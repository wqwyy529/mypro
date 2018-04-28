package com.icss.bk.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Tuser entity. @author MyEclipse Persistence Tools
 */

public class Tuser implements java.io.Serializable {

	// Fields

	private String uname;
	private String pwd;
	private String realname;
	private String role;
	private String sex;
	private Double account;
	private String telephone;
	private String address;
	private Set tcomments = new HashSet(0);
	private Set buyrecords = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tuser() {
	}

	/** minimal constructor */
	public Tuser(String uname) {
		this.uname = uname;
	}

	/** full constructor */
	public Tuser(String uname, String pwd, String realname, String role,
			String sex, Double account, String telephone, String address,
			Set tcomments, Set buyrecords) {
		this.uname = uname;
		this.pwd = pwd;
		this.realname = realname;
		this.role = role;
		this.sex = sex;
		this.account = account;
		this.telephone = telephone;
		this.address = address;
		this.tcomments = tcomments;
		this.buyrecords = buyrecords;
	}

	// Property accessors

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Double getAccount() {
		return this.account;
	}

	public void setAccount(Double account) {
		this.account = account;
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

	public Set getTcomments() {
		return this.tcomments;
	}

	public void setTcomments(Set tcomments) {
		this.tcomments = tcomments;
	}

	public Set getBuyrecords() {
		return this.buyrecords;
	}

	public void setBuyrecords(Set buyrecords) {
		this.buyrecords = buyrecords;
	}

}