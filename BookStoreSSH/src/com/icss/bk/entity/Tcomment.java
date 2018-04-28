package com.icss.bk.entity;

import java.util.Date;

/**
 * Tcomment entity. @author MyEclipse Persistence Tools
 */

public class Tcomment implements java.io.Serializable {

	// Fields

	private Integer cid;
	private String uname;
	private Tuser tuser;
	private Integer bid;
	private Tbook tbook;
	private String content;
	private Date cdate;

	// Constructors

	/** default constructor */
	public Tcomment() {
	}

	/** minimal constructor */
	public Tcomment(Integer cid) {
		this.cid = cid;
	}

	/** full constructor */
	public Tcomment(Integer cid, Tuser tuser, Tbook tbook, String content,
			Date cdate) {
		this.cid = cid;
		this.tuser = tuser;
		this.tbook = tbook;
		this.content = content;
		this.cdate = cdate;
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Tuser getTuser() {
		return this.tuser;
	}

	public void setTuser(Tuser tuser) {
		this.tuser = tuser;
	}

	public Tbook getTbook() {
		return this.tbook;
	}

	public void setTbook(Tbook tbook) {
		this.tbook = tbook;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCdate() {
		return this.cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}
	
}