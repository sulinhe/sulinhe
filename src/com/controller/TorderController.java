package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seriverimp.Tgoodseriverimp;
import com.seriverimp.Torderseriverimp;

@Controller
@RequestMapping("torder")
public class TorderController {
  
	@Autowired
	private Torderseriverimp torderseriverimp;
	
	
	
	
}
