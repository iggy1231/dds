package com.fly.dds.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/customer/*")
public class CustomerManageController {
	
	@GetMapping("review")
	public String reviewList() {
		
		return ".admin.customer.review";
	}
	
	@GetMapping("question")
	public String questionList() {
		
		return ".admin.customer.question";
	}
}
