package com.pojo;


public class Tuser{
  private Integer uid;
  private String uname;
  private String password;
public Integer getUid() {
	return uid;
}
public void setUid(Integer uid) {
	this.uid = uid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
@Override
public String toString() {
	return "Tuser [uid=" + uid + ", uname=" + uname + ", password=" + password
			+ "]";
}
public Tuser(Integer uid, String uname, String password) {
	super();
	this.uid = uid;
	this.uname = uname;
	this.password = password;
}
public Tuser() {
	super();
	// TODO Auto-generated constructor stub
}
  

}
