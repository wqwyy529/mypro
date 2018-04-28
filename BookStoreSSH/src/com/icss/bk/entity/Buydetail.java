package com.icss.bk.entity;

/**
 * Buydetail entity. @author MyEclipse Persistence Tools
 */

public class Buydetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private Buyrecord buyrecord;
	private Tbook tbook;
	private String bname;
	private Double price;
	private Integer buynum;

	// Constructors

	/** default constructor */
	public Buydetail() {
	}

	/** minimal constructor */
	public Buydetail(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Buydetail(Integer id, Buyrecord buyrecord, Tbook tbook,
			String bname, Double price, Integer buynum) {
		this.id = id;
		this.buyrecord = buyrecord;
		this.tbook = tbook;
		this.bname = bname;
		this.price = price;
		this.buynum = buynum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Buyrecord getBuyrecord() {
		return this.buyrecord;
	}

	public void setBuyrecord(Buyrecord buyrecord) {
		this.buyrecord = buyrecord;
	}

	public Tbook getTbook() {
		return this.tbook;
	}

	public void setTbook(Tbook tbook) {
		this.tbook = tbook;
	}

	public String getBname() {
		return this.bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getBuynum() {
		return this.buynum;
	}

	public void setBuynum(Integer buynum) {
		this.buynum = buynum;
	}

}