package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Tgoods;
import com.seriverimp.Tgoodseriverimp;

@Controller
@RequestMapping("goods")
public class TgoodsController {
  
	@Autowired
	private Tgoodseriverimp tgoodseriverimp;
	
	@RequestMapping("select")
	@ResponseBody
	public List<Tgoods> select()
	{
		List<Tgoods> selectall = tgoodseriverimp.selectall();
		return selectall;
		
		
	}
	
	
	
	@RequestMapping("update")
	@ResponseBody
	public String update(int account,int gid)
	{
		tgoodseriverimp.update(account, gid);
		return null;
		
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(int[] array,HttpSession session)
	{
		tgoodseriverimp.add(array,session);
		
		return "ok";
	}
	
	
}
