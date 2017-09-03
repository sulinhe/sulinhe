package com.pojo;

public class Tgoods {
private Integer gid;
private Integer price;
private Integer account;
private String gname;
public Integer getGid() {
	return gid;
}
public void setGid(Integer gid) {
	this.gid = gid;
}
public Integer getPrice() {
	return price;
}
public void setPrice(Integer price) {
	this.price = price;
}
public Integer getAccount() {
	return account;
}
public void setAccount(Integer account) {
	this.account = account;
}
public String getGname() {
	return gname;
}
public void setGname(String gname) {
	this.gname = gname;
}
@Override
public String toString() {
	return "Tgoods [gid=" + gid + ", price=" + price + ", account=" + account
			+ ", gname=" + gname + "]";
}
public Tgoods(Integer gid, Integer price, Integer account, String gname) {
	super();
	this.gid = gid;
	this.price = price;
	this.account = account;
	this.gname = gname;
}
public Tgoods() {
	super();
	// TODO Auto-generated constructor stub
}

}
