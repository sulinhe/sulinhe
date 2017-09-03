package com.pojo;

public class Torder {
	private Integer oid;
	private Integer userid;
	private Integer goodsid;
	private Integer goodsaccount;
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}
	public Integer getGoodsaccount() {
		return goodsaccount;
	}
	public void setGoodsaccount(Integer goodsaccount) {
		this.goodsaccount = goodsaccount;
	}
	@Override
	public String toString() {
		return "Torder [oid=" + oid + ", userid=" + userid + ", goodsid="
				+ goodsid + ", goodsaccount=" + goodsaccount + "]";
	}
	public Torder(Integer oid, Integer userid, Integer goodsid,
			Integer goodsaccount) {
		super();
		this.oid = oid;
		this.userid = userid;
		this.goodsid = goodsid;
		this.goodsaccount = goodsaccount;
	}
	public Torder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
