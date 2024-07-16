package com.fly.dds.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/orderStatus/*")
public class OrderStatusManageController {
	
	@GetMapping("detail")
	public String reviewList() {
		
		return ".admin.orderStatus.detail";
	}
	
	@GetMapping("status")
	public String questionList() {
		
		return ".admin.orderStatus.status";
	}
}
