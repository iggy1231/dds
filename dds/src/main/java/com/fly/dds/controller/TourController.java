package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/tour/*")
public class TourController {
	
	@GetMapping("main")
	public String roomMain() {
		
		return ".tour.main";
	}
}
