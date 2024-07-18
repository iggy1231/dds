package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@GetMapping("profile")
	public String profileList() {
		
		return ".four.mypage.profile";
	}
	
	
	
}
