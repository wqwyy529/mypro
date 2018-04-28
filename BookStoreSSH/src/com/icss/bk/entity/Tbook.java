package com.icss.bk.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Tbook entity. @author MyEclipse Persistence Tools
 */

public class Tbook implements java.io.Serializable {

	// Fields

	private Integer bookid;
	private String bname;
	private String author;
	private Double price;
	private String press;
	private Integer store;
	private byte[] pic;
	private String detail;
	private Date pubdate;
	private Integer buynum;
	private Set tcomments = new HashSet(0);
	private Set buydetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public Tbook() {
	}

	/** minimal constructor */
	public Tbook(Integer bookid) {
		this.bookid = bookid;
	}

	/** full constructor */
	public Tbook(Integer bookid, String bname, String author, Double price,
			String press, Integer store, byte[] pic, String detail,
			Date pubdate, Set tcomments, Set buydetails) {
		this.bookid = bookid;
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.press = press;
		this.store = store;
		this.pic = pic;
		this.detail = detail;
		this.pubdate = pubdate;
		this.tcomments = tcomments;
		this.buydetails = buydetails;
	}

	// Property accessors

	public Integer getBookid() {
		return this.bookid;
	}

	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}

	public String getBname() {
		return this.bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPress() {
		return this.press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public Integer getStore() {
		return this.store;
	}

	public void setStore(Integer store) {
		this.store = store;
	}

	public byte[] getPic() {
		return this.pic;
	}

	public void setPic(byte[] pic) {
		this.pic = pic;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Set getTcomments() {
		return this.tcomments;
	}

	public void setTcomments(Set tcomments) {
		this.tcomments = tcomments;
	}

	public Set getBuydetails() {
		return this.buydetails;
	}

	public void setBuydetails(Set buydetails) {
		this.buydetails = buydetails;
	}

	public Integer getBuynum() {
		return buynum;
	}

	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}
	
}