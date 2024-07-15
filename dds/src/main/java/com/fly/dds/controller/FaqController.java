package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/faq/*")
public class FaqController {
	
	@GetMapping(value = "main")
	public String faqmain() {
		
		return ".faq.main";
	}
	
	@GetMapping(value = "list")
	public String faqlist() {
		
		return ".faq/list";
	}
	

}
