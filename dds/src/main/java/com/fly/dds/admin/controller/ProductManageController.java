package com.fly.dds.admin.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.dds.admin.service.RoomProductService;
import com.fly.dds.domain.Room;

@Controller
@RequestMapping(value = "/admin/product/*")
public class ProductManageController {
	
	@Autowired
	private RoomProductService service;
	
	@GetMapping("list")
	public String productList() {
		
		return ".admin.product.list";
	}
	
	@GetMapping("write")
	public String roomWriteForm(Model model) {
		
		model.addAttribute("mode", "write");
		
		return ".admin.product.write";
	}
	
	@PostMapping("write")
	public String roomWriteSubmit(Room dto,
			HttpSession session,
			Model model
			) {
		
	String root = session.getServletContext().getRealPath("/");
	String path = root + "upload" + File.separator + "room";
	
	try {
		service.insertProduct(dto, path);
		  model.addAttribute("message", "등록이 성공적으로 완료되었습니다.");
	} catch (Exception e) {
		model.addAttribute("message", "등록 실습니다.");
	}
	
	String url = "redirect:/admin/product/list";
	
		return url;
	}
}
