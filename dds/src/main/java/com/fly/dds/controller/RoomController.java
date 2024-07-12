package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/room/*")
public class RoomController {
	
	@GetMapping("main")
	public String roomMain() {
		
		return ".room.main";
	}
	
	@RequestMapping("article")
	public String roomArticle() {
		
		return ".room.article";
	}
	
	@GetMapping("list")
	public String roomList() {
		
		return ".room.list";
	}
	
	@GetMapping("review")
	public String roomReview() {
		
		return ".room.review";
	}
}
