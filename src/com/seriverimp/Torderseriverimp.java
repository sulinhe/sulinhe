package com.seriverimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TorderMapper;

import com.serive.TorderSerive;
@Service
public class Torderseriverimp implements TorderSerive{
	@Autowired
	private TorderMapper torderMapper;


}
