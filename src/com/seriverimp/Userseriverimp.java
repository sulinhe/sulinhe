package com.seriverimp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;



import com.alibaba.fastjson.JSON;
import com.dao.TuserMapper;
import com.pojo.Tuser;
import com.serive.TuserSerive;
@Service
public class Userseriverimp implements TuserSerive{

	@Autowired
	private TuserMapper tuserMapper;
@Autowired
    private JedisPool redisClient;
	@Override
	public String selectall(String name, String password,HttpSession session) {
	    Jedis resource = redisClient.getResource();		    
	    List<Tuser> selectall = tuserMapper.selectall();
	    //取到list判断是否为空
	    String list=resource.get("list");
	   
	    if (list==null) {
	    	   resource.set("list",JSON.toJSONString(selectall));
	    	  for (Tuser tuser : selectall) {
					if(tuser.getUname().equals(name) &&tuser.getPassword().equals(password))
					{
						session.setAttribute("user",tuser);
						  return "ok";
						
					}
				}
	    	  
		}
	    //如果不为空
	    else
	    {	
	    	 List<Tuser> list2= JSON.parseArray(list,Tuser.class);
				System.out.println(list2);
				
	    	    for(Tuser tuser2 : list2) {
	    	    	
	    	    	if(tuser2.getUname().equals(name) &&tuser2.getPassword().equals(password))
					{
						session.setAttribute("user",tuser2);
						  return "ok";
					}
				} 
	    	    
	    }
		return "no";	
}

	@Override
	public String selectall1(String name, String password) {
		  List<Tuser> selectall = tuserMapper.selectall();
		    for (Tuser tuser : selectall) {
				if(tuser.getUname().equals(name) )
				{
					
					  return "ok";
					
				}
			}
		return "no";
	}

	@Override
	public void add(Tuser u) {
	tuserMapper.add(u);
		
	}
	/*
	*/
}
