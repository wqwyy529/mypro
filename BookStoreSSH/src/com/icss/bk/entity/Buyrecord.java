package com.icss.bk.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Buyrecord entity. @author MyEclipse Persistence Tools
 */

public class Buyrecord implements java.io.Serializable {

	// Fields

	private Integer brid;
	private String uname;
	private Tuser tuser;
	private Integer buyamount;
	private Double allmoney;
	private String telephone;
	private String address;
	private String deliver;
	private String paybank;
	private Date buydate;
	private Set buydetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public Buyrecord() {
	}

	/** minimal constructor */
	public Buyrecord(Integer brid) {
		this.brid = brid;
	}

	/** full constructor */
	public Buyrecord(Integer brid, Tuser tuser, Integer buyamount,
			Double allmoney, String telephone, String address, String deliver,
			String paybank, Date buydate, Set buydetails) {
		this.brid = brid;
		this.tuser = tuser;
		this.buyamount = buyamount;
		this.allmoney = allmoney;
		this.telephone = telephone;
		this.address = address;
		this.deliver = deliver;
		this.paybank = paybank;
		this.buydate = buydate;
		this.buydetails = buydetails;
	}

	// Property accessors

	public Integer getBrid() {
		return this.brid;
	}

	public void setBrid(Integer brid) {
		this.brid = brid;
	}

	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Tuser getTuser() {
		return this.tuser;
	}

	public void setTuser(Tuser tuser) {
		this.tuser = tuser;
	}

	public Integer getBuyamount() {
		return this.buyamount;
	}

	public void setBuyamount(Integer buyamount) {
		this.buyamount = buyamount;
	}

	public Double getAllmoney() {
		return this.allmoney;
	}

	public void setAllmoney(Double allmoney) {
		this.allmoney = allmoney;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDeliver() {
		return this.deliver;
	}

	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}

	public String getPaybank() {
		return this.paybank;
	}

	public void setPaybank(String paybank) {
		this.paybank = paybank;
	}

	public Date getBuydate() {
		return this.buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	public Set getBuydetails() {
		return this.buydetails;
	}

	public void setBuydetails(Set buydetails) {
		this.buydetails = buydetails;
	}

}