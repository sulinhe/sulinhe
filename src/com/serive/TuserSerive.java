package com.serive;

import javax.servlet.http.HttpSession;

import com.pojo.Tuser;

public interface TuserSerive {
     String selectall(String name,String password,HttpSession session);
     String selectall1(String name,String password);
     void add(Tuser u);
}
