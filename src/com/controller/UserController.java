package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.TuserMapper;
import com.pojo.Tuser;
import com.seriverimp.Userseriverimp;

@Controller
@RequestMapping("user")
public class UserController {
  
	@Autowired
	private Userseriverimp userseriverimp;
	private TuserMapper tuserMapper;
	
	@RequestMapping("login")
	@ResponseBody
	public String login(String name,String password,HttpSession session)
	{
		String selectall = userseriverimp.selectall(name, password,session);
		if (selectall.equals("ok")) {
			return "ok";
			
		}
		else
		{
			return "no";
		}
	}
	
	
	@RequestMapping("namepan")
	@ResponseBody
	public String namepan(String name)
	{
		
		String selectall = userseriverimp.selectall1(name,null);
		if (selectall.equals("ok")) {
			return "no";
		}
		else {
			return "ok";
		}
		
		
	}
	
	@RequestMapping("adduser")
	@ResponseBody
	public String adduser(String name,String password,HttpSession session)
	{
		 Tuser tuser=new Tuser();
		 tuser.setPassword(password);
		 tuser.setUname(name);
		 session.setAttribute("user", tuser);
		 userseriverimp.add(tuser);
		return "ok";
		
		
	}
	
	
}
