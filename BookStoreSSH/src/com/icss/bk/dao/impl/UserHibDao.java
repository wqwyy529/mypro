package com.icss.bk.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;

import com.icss.bk.dao.IUserDao;
import com.icss.bk.dto.BuyRecAll;
import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Buyrecord;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tuser;

@SuppressWarnings("unchecked")
public class UserHibDao extends BaseHibDao implements IUserDao{

	public Tuser login(String uname, String pwd) throws Exception{
		String hql = "From Tuser where uname=? and pwd=?";
		Query q = this.getSession(false).createQuery(hql);
		q.setString(0, uname);
		q.setString(1, pwd);
		Tuser user = (Tuser) q.uniqueResult();
		return user;		
	}

	
	public List<Tuser> getAllUser() throws Exception {
		 String hql = "FROM Tuser";         //注意实体名和属性名都要区分大小写
		 Query q = this.getSession(false).createQuery(hql);
		 return q.list();		 
	}

	public Tuser getUser(String uname) throws Exception{
		String hql ="From Tuser where uname=?";
		Query q = this.getSession(false).createQuery(hql);
		q.setString(0, uname);
		Tuser user = (Tuser) q.uniqueResult();
		return user;
	}

	public void addUser(Tuser user) throws Exception{
		this.getSession(false).save(user);
		this.getSession(false).flush();
	}

	public void deletUser(String uname) throws Exception{
		Tuser user = new Tuser();
		user.setUname(uname);
		this.getSession(false).delete(user);
		this.getSession(false).flush();
	}

	public void updateUser(Tuser user) throws Exception{
		String sql = "update Tuser set pwd=?,realname=?,sex=?,account=?,telephone=?,address=? where uname=?";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setString(0, user.getPwd());
		q.setString(1, user.getRealname());
		q.setString(2, user.getSex());
		q.setDouble(3, user.getAccount());
		q.setString(4, user.getTelephone());
		q.setString(5, user.getAddress());
		q.setString(6, user.getUname());
		q.executeUpdate();
		this.getSession(false).flush();
	}

	public void userAccount(String uname, double money) throws Exception{
		String sql = "select account from tuser where uname=?";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setString(0, uname);
		double account = Double.parseDouble(q.uniqueResult().toString());
		String sql2 = "update tuser set account =? where uname =?";
		SQLQuery q2 = this.getSession(false).createSQLQuery(sql2);	
		q2.setDouble(0, account+=money);
		q2.setString(1, uname);
		q2.executeUpdate();		
	}

	public void addBuyRecord(Buyrecord br) throws Exception{
		String sql="insert into Buyrecord(brid,uname,buyamount,allmoney,telephone,address,deliver,paybank,buydate) values(nvl((select max(brid) from Buyrecord),0)+1,?,?,?,?,?,?,?,?)";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		q.setString(0, br.getUname());
		q.setInteger(1, br.getBuyamount());
		q.setDouble(2, br.getAllmoney());
		q.setString(3, br.getTelephone());
		q.setString(4, br.getAddress());
		q.setString(5, br.getDeliver());
		q.setString(6, br.getPaybank());
		q.setDate(7, br.getBuydate());
		q.executeUpdate();
	}

	public void addBuyDetail(List<Tbook> books) throws Exception{
		for(Tbook bk : books){
			String sql = "insert into buyDetail(id,brid,bookid,bname,buynum,price) values(nvl((select max(id) from buydetail),0)+1,nvl((select max(brid) from BuyRecord),0),?,?,?,? ) ";
			SQLQuery q = this.getSession(false).createSQLQuery(sql);
			q.setInteger(0, bk.getBookid());
			q.setString(1, bk.getBname());
			q.setInteger(2, bk.getBuynum());
			q.setDouble(3, bk.getPrice());
			q.executeUpdate();
			updateStore(bk.getBookid(),-bk.getBuynum());         //减少书的数量
		}	
	}

	private void updateStore(int bookid, int buynum) throws Exception{
		String sql="update Tbook set store=store+? where bookid=?";
		SQLQuery q2 = this.getSession(false).createSQLQuery(sql);
		q2.setInteger(0, buynum);
		q2.setInteger(1, bookid);
		q2.executeUpdate();
	}

	public List<BuyRecAll> getRecAll(TurnPagePara tp) throws Exception{
		String sql="select r.uname,b.bname,d.bookid,r.buyamount,r.allmoney,d.buynum,d.price,r.buydate " +
				   "from buyrecord r,buydetail d,tbook b where r.brid = d.brid and b.bookid = d.bookid";
		SQLQuery q = this.getSession(false).createSQLQuery(sql);
		tp.PageCount = (tp.RecordCount-1)/tp.OnePageCount+1;
		tp.RecordCount = this.getRecCount(sql);
		q.setFirstResult((tp.RecordCount-1)/tp.OnePageCount);
		q.setMaxResults(tp.OnePageCount);
		q.addScalar("uname", Hibernate.STRING);
		q.addScalar("bname", Hibernate.STRING);
		q.addScalar("bookid", Hibernate.INTEGER);
		q.addScalar("buyamount", Hibernate.INTEGER);
		q.addScalar("allmoney", Hibernate.DOUBLE);
		q.addScalar("buynum", Hibernate.INTEGER);
		q.addScalar("price", Hibernate.DOUBLE);
		q.addScalar("buydate", Hibernate.TIMESTAMP);
		q.setResultTransformer(Transformers.aliasToBean(BuyRecAll.class));
		return q.list();
	}


	public List<BuyRecAll> getUserBuyRecInfo(String uname){
		// TODO Auto-generated method stub
		return null;
	}
	

}
