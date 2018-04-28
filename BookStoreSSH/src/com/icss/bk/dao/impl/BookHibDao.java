package com.icss.bk.dao.impl;

import java.io.BufferedInputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.lob.SerializableBlob;
import org.hibernate.transform.Transformers;

import com.icss.bk.dao.IBookDao;
import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tcomment;

@SuppressWarnings("unchecked")
public class BookHibDao extends BaseHibDao implements IBookDao{
	public void addBook(Tbook bk) throws Exception {
		String sql = "insert into tbook(bookid,bname,author,price,press,pubdate,detail,pic,store)values(nvl((select max(bookid) from tbook),0)+1,?,?,?,?,?,?,?,?)";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setString(0, bk.getBname());
		q.setString(1, bk.getAuthor());
		q.setDouble(2, bk.getPrice());
		q.setString(3, bk.getPress());
		q.setDate(4, bk.getPubdate());
		q.setString(5, bk.getDetail());
		q.setBinary(6, bk.getPic());
		q.setInteger(7, bk.getStore());
		q.executeUpdate();
		this.getSession(false).flush();
	}

	public Tbook getBook(int bookid) throws Exception {
		String hql = "From Tbook where bookid=?";
		Query q = this.getSession(false).createQuery(hql);
		q.setInteger(0, bookid);
		Tbook bk = (Tbook) q.uniqueResult();
		return bk;
	}

	
	
	public List<Tbook> getAllBooks(TurnPagePara tp) throws Exception {
		String sql = "select bookid,bname,author,price,store,press,detail,pubdate from tbook order by bookid";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		tp.RecordCount = this.getRecCount(sql);
		tp.PageCount = (tp.RecordCount-1)/tp.OnePageCount+1;
		if(tp.CurrentPageNo>tp.PageCount){
			tp.CurrentPageNo = tp.PageCount;
		}
		q.setFirstResult((tp.CurrentPageNo-1)*tp.OnePageCount);
		q.setMaxResults(tp.OnePageCount);
		q.addScalar("bookid", Hibernate.INTEGER);
		q.addScalar("bname", Hibernate.STRING);
		q.addScalar("author", Hibernate.STRING);
		q.addScalar("price", Hibernate.DOUBLE);
		q.addScalar("store", Hibernate.INTEGER);
		q.addScalar("press", Hibernate.STRING);
		q.addScalar("detail", Hibernate.STRING);
		q.addScalar("pubdate", Hibernate.DATE);
		q.setResultTransformer(Transformers.aliasToBean(Tbook.class));
		return  q.list();
		
	}

	@SuppressWarnings("rawtypes")
	public byte[] getPic(int bookid) throws Exception{	
		byte[] pic = null;
		String sql = "SELECT pic from TBOOK WHERE bookid=?";	
		Query query = this.getSession(false).createSQLQuery(sql);
		query.setInteger(0, bookid);
		Iterator it = query.list().iterator();
		while(it.hasNext()){
			SerializableBlob blob = (SerializableBlob)it.next();		
			if(blob != null){             									//可能没有图片，则blob=null
				BufferedInputStream stream = new BufferedInputStream(blob.getBinaryStream());			         
		        pic = new byte[(int)blob.length()];
		        stream.read(pic);			        
		        stream.close();
			}		         			     
			break;
		}	
		return pic;
	}

	public List<Tbook> getShopCartBook(Set<Integer> bkCart) throws Exception{
		List<Tbook> bkList = null;
		String bid = "";
		Object[] books = bkCart.toArray();
		for(int i=0;i<books.length;i++){
			if(i==0){
				bid += books[i];
			}else{
				bid = bid+","+books[i];
			}	
		}
		String hql = "From Tbook where bookid in("+bid+")";	
		Query q = this.getSession(false).createQuery(hql);
		bkList = q.list();			
		return bkList;		
	}

	public void updateBook(Tbook bk) throws Exception{
		String sql = "update tbook set bname=?,author=?,price=?,press=?,detail=?,pic=?,store=? where bookid=?";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setString(0, bk.getBname());
		q.setString(1, bk.getAuthor());
		q.setDouble(2, bk.getPrice());
		q.setString(3, bk.getPress());
		q.setString(4, bk.getDetail());
		q.setBinary(5, bk.getPic());
		q.setInteger(6, bk.getStore());
		q.setInteger(7, bk.getBookid());
		q.executeUpdate();
		this.getSession(false).flush();
	}

	public void deletBook(int bookid) throws Exception {
		Tbook bk = new Tbook();
		bk.setBookid(bookid);
		this.getSession(false).delete(bk);
		this.getSession(false).flush();		
	}
	
	public List<Tbook> selectByAuthor(String author) throws Exception{
		String sql="select bookid,bname,author,price,store,press,detail,pubdate From Tbook where author=?";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setString(0, author);
		q.addScalar("bookid", Hibernate.INTEGER);
		q.addScalar("bname", Hibernate.STRING);
		q.addScalar("author", Hibernate.STRING);
		q.addScalar("price", Hibernate.DOUBLE);
		q.addScalar("store", Hibernate.INTEGER);
		q.addScalar("press", Hibernate.STRING);
		q.addScalar("detail", Hibernate.STRING);
		q.addScalar("pubdate", Hibernate.DATE);
		q.setResultTransformer(Transformers.aliasToBean(Tbook.class));
		return q.list();
	}
	
	public List<Tbook> selectByPress(String press) throws Exception{
		String sql="select bookid,bname,author,price,store,press,detail,pubdate From Tbook where press=?";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setString(0, press);
		q.addScalar("bookid", Hibernate.INTEGER);
		q.addScalar("bname", Hibernate.STRING);
		q.addScalar("author", Hibernate.STRING);
		q.addScalar("price", Hibernate.DOUBLE);
		q.addScalar("store", Hibernate.INTEGER);
		q.addScalar("press", Hibernate.STRING);
		q.addScalar("detail", Hibernate.STRING);
		q.addScalar("pubdate", Hibernate.DATE);
		q.setResultTransformer(Transformers.aliasToBean(Tbook.class));
		return q.list();
	}
	
	public List<Tbook> selectByPrice(double price1,double price2) throws Exception{
		String sql="select bookid,bname,author,price,store,press,detail,pubdate From Tbook where price between ? and ?";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setDouble(0, price1);
		q.setDouble(1, price2);
		q.addScalar("bookid", Hibernate.INTEGER);
		q.addScalar("bname", Hibernate.STRING);
		q.addScalar("author", Hibernate.STRING);
		q.addScalar("price", Hibernate.DOUBLE);
		q.addScalar("store", Hibernate.INTEGER);
		q.addScalar("press", Hibernate.STRING);
		q.addScalar("detail", Hibernate.STRING);
		q.addScalar("pubdate", Hibernate.DATE);
		q.setResultTransformer(Transformers.aliasToBean(Tbook.class));
		return q.list();
	}

	public void commentBook(Tcomment cmt) throws Exception {
		String sql = "insert into Tcomment(cid,bookid,uname,content,cdate)values(nvl((select max(cid) from Tcomment),0)+1,?,?,?,?)";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setInteger(0, cmt.getBid());
		q.setString(1, cmt.getUname());
		q.setString(2, cmt.getContent());
		q.setTimestamp(3, cmt.getCdate());
		q.executeUpdate();
		this.getSession(false).flush();		
	}

	public List<Tcomment> getComment(int bid) throws Exception {		
		String sql = "select uname,content,cdate From Tcomment where bookid=?";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setInteger(0, bid);
		q.addScalar("uname", Hibernate.STRING);
		q.addScalar("content", Hibernate.STRING);
		q.addScalar("cdate", Hibernate.TIMESTAMP);
		q.setResultTransformer(Transformers.aliasToBean(Tcomment.class));
		return q.list();
	}
	
	public List<Tcomment> getAllComment()throws Exception{
		String hql = "From Tcomment";
		Query q = this.getSession(false).createQuery(hql);
		return q.list();
		
	}
	
	

}
