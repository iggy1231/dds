package com.fly.dds.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.dds.domain.Companion;
import com.fly.dds.service.CompanionService;

@Controller
@RequestMapping(value = "/companion/*")
public class CompanionController {
	@Autowired
	private CompanionService service;
	
	
	@GetMapping("list")
	public String companionList(Model model) {
		
		return ".companion.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) {
		
		return ".companion.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(@RequestParam String areaCode,
			@RequestParam String[] sigunguCode,
			@RequestParam String sdate,
			@RequestParam String edate,
			@RequestParam String theme,
			@RequestParam String gender,
			@RequestParam String[] age,
			@RequestParam int total_people,
			@RequestParam int estimate_cost,
			@RequestParam String subject,
			@RequestParam String content,
			Model model) {
		
		Companion dto=new Companion();
		
		try {
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setRegion_main(areaCode);
			dto.setRegion_sub(sigunguCode);
			dto.setSdate(sdate);
			dto.setEdate(edate);
			dto.setTheme(theme);
			dto.setGender(gender);
			dto.setAge(age);
			dto.setTotal_people(total_people);
			dto.setEstimate_cost(estimate_cost);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".companion.list";
	}
}
