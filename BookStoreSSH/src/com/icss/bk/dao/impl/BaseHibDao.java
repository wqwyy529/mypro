package com.icss.bk.dao.impl;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.icss.bk.dao.IBaseDao;

public class BaseHibDao extends HibernateDaoSupport implements IBaseDao{
	protected Session session;
	
	@SuppressWarnings("deprecation")
	public void beginTransaction() throws Exception{
		session = this.getSession(false);
		session.connection().setAutoCommit(false);
		//transaction = this.getSession(false).beginTransaction();
	}
	
	@SuppressWarnings("deprecation")
	public void rollback() throws Exception {
		if(session != null){
			session.connection().rollback();
		}
	}
	
	@SuppressWarnings("deprecation")
	public void commit() throws Exception{
		if(session != null){
			session.connection().commit();
		}
	}
	
	public  int getRecCount(String strSql){
		//mysql 中必须加别名w
		String strExe = "SELECT count(*) FROM (" + strSql + ")";	
		SQLQuery qm = this.getSession(false).createSQLQuery(strExe);
		int count = Integer.parseInt(qm.uniqueResult().toString());
		return count;
	}
}
