package com.seriverimp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TgoodsMapper;
import com.dao.TorderMapper;
import com.pojo.Tgoods;
import com.pojo.Torder;
import com.pojo.Tuser;
import com.serive.TgoodSerive;
@Service
public class Tgoodseriverimp implements TgoodSerive{
	@Autowired
	private TgoodsMapper tgoodsMapper;
	@Autowired
	private TorderMapper torderMapper;

	@Override
	public List<Tgoods> selectall() {
		 List<Tgoods> selectall = tgoodsMapper.selectall();
		return selectall;
	}

	@Override
	public void update(int account, int pid) {
		tgoodsMapper.update(account, pid);
		
	}

	
	
	@Override
	public void add(int[] array,HttpSession session) {
	   Tuser tuser=(Tuser) session.getAttribute("user");
		   int uid=tuser.getUid();
		  	 for (int i : array) {
			Tgoods select = tgoodsMapper.select(i);
			Torder torder=new Torder();
			System.out.println(select);
			torder.setUserid(uid);
			torder.setGoodsid(select.getGid());
			torder.setGoodsaccount(select.getAccount());
			System.out.println(torder);
			torderMapper.add(torder);	
		}
		System.out.println("nihao");
		
	}

	@Override
	public Tgoods select(int gid) {
		Tgoods select = tgoodsMapper.select(gid);
		return select;
	}
	
}
