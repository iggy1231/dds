package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/info/*")
public class InfoController {
	
	@GetMapping("list")
	public String infoList() {
		
		return ".info.list";
	}
}
