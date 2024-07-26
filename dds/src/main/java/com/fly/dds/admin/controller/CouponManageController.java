package com.fly.dds.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/couponManage/*")
public class CouponManageController {
	
	@GetMapping("list")
	public String couponList() {
		
		return ".admin.couponManage.list";
	}
	
	@GetMapping("write")
	public String couponWrite() {
		
		return ".admin.couponManage.write";
	}
}
