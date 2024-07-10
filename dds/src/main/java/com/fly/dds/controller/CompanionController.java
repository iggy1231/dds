package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/companion/*")
public class CompanionController {
	
	@GetMapping("list")
	public String companionList() {
		
		return "companion/list";
	}
}