package com.icss.bk.dao;

public interface IBaseDao {
	public void beginTransaction() throws Exception;
	public void rollback() throws Exception;
	public void commit() throws Exception;
}
