package com.fly.dds.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/faqManage/*")
public class FaqManageController {
	
	@GetMapping(value = "main")
	public String faqmanagemain() {
		
		return ".admin.faqManage.main";
	}
	
	@GetMapping(value = "list")
	public String faqlist() {
		
		return ".admin.faqManage/list";
	}
}
