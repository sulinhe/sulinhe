package com.dao;

import java.util.List;

import com.pojo.Tuser;

public interface TuserMapper {
  List<Tuser> selectall();
  void add(Tuser tuser);
}
