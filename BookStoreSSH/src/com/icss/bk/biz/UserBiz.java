package com.icss.bk.biz;

import java.util.List;

import com.icss.bk.dao.IUserDao;
import com.icss.bk.dto.BuyRecAll;
import com.icss.bk.dto.TurnPagePara;
import com.icss.bk.entity.Buyrecord;
import com.icss.bk.entity.Tbook;
import com.icss.bk.entity.Tuser;

public class UserBiz {
	private IUserDao userDao;	

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public Tuser login(String uname,String pwd) throws Exception{
		return userDao.login(uname, pwd);
		
	}
	
	public List<Tuser> getAllUser() throws Exception{
		return userDao.getAllUser();
		 
	}
	
	public Tuser getUser(String uname) throws Exception{
		return userDao.getUser(uname);
		 
	}
	
	public void addUser(Tuser user)throws Exception{
		userDao.addUser(user);
	}
	
	public void deletUser(String uname)throws Exception{
		userDao.deletUser(uname);
	}
	public void updateUser(Tuser user)throws Exception{
		userDao.updateUser(user);
	}
	
	public void buyBook(Buyrecord br, List<Tbook> books) throws Exception{
		try {
			userDao.beginTransaction();
			userDao.userAccount(br.getUname(), -br.getAllmoney());
			userDao.addBuyRecord(br);
			userDao.addBuyDetail(books);
			
			userDao.commit();
		} catch (Exception e) {
			e.printStackTrace();
			userDao.rollback();
			throw new Exception(e.getMessage());			
		}
		
	}
	
	public List<BuyRecAll> getRecInfo(TurnPagePara tp) throws Exception{
		return userDao.getRecAll(tp);
		
	}

	public String[] getUnamePwd(String unamepwdString) {
		return unamepwdString.split(",");
		
	}
	
	public List<BuyRecAll> getUserBuyRecAll(String uname) throws Exception{
		return userDao.getUserBuyRecInfo(uname);		
		
	}
	
}


