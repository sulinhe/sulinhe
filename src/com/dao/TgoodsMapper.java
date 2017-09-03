package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.Tgoods;

public interface TgoodsMapper {
   List<Tgoods> selectall();
   void update(@Param("account")int account,@Param("gid")int gid);
   Tgoods select(int pid);
}
