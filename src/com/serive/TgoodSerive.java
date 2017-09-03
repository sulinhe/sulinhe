package com.serive;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.pojo.Tgoods;

public interface TgoodSerive {
	 List<Tgoods> selectall();
	 void update(int account,int pid);
	 void add(int[] array,HttpSession session);
	 Tgoods select(int gid);
	 }
