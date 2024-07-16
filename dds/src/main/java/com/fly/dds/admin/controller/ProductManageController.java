package com.fly.dds.admin.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.dds.domain.Room;

@Controller
@RequestMapping(value = "/admin/product/*")
public class ProductManageController {
	
	@GetMapping("list")
	public String productList() {
		
		return ".admin.product.list";
	}
	
	@GetMapping("write")
	public String roomWriteForm(Model model) {
		
		model.addAttribute("mode", "write");
		
		return ".admin.product.write";
	}
	
	@PostMapping("wrtie")
	public String roomWriteSubmit(Room dto,
			HttpSession session,
			Model model
			) {
		
	String root = session.getServletContext().getRealPath("/");
	String path = root + "upload" + File.separator + "room";
	
	try {
		
	} catch (Exception e) {
		
	}
	
		
		
		return ".admin.product.list";
	}
}
