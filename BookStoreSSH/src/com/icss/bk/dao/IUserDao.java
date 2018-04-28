package com.icss.bk.dao;

import java.util.List;

import com.icss.bk.dto.BuyRecAll;
import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Buyrecord;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tuser;

public interface IUserDao extends IBaseDao{
	public Tuser login(String uname,String pwd) throws Exception;
	public List<Tuser> getAllUser()throws Exception;
	public Tuser getUser(String uname) throws Exception;
	public void addUser(Tuser user)throws Exception;
	public void deletUser(String uname)throws Exception;
	public void updateUser(Tuser user)throws Exception;
	public void userAccount(String uname,double money)throws Exception;
	public void addBuyRecord(Buyrecord br)throws Exception;
	public void addBuyDetail(List<Tbook> books)throws Exception;
	public List<BuyRecAll> getRecAll(TurnPagePara tp)throws Exception;
	public List<BuyRecAll> getUserBuyRecInfo(String uname)throws Exception;
}
