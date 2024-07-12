package com.fly.dds.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/product/*")
public class ProductManageController {
	
	@GetMapping("list")
	public String productList() {
		
		return ".admin.product.list";
	}
	
	@GetMapping("write")
	public String questionList() {
		
		return ".admin.product.write";
	}
}
