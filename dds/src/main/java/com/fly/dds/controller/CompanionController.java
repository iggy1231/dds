package com.fly.dds.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Companion;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.CompanionService;

@Controller
@RequestMapping(value = "/companion/*")
public class CompanionController {
	@Autowired
	private CompanionService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("list")
	public String list(Model model) {
		
		return ".companion.list";
	}
	
	@ResponseBody
	@GetMapping("companionList")
	public Map<String, Object> companionList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page) {
		Map<String, Object> model=new HashMap<String, Object>();
		int size=5;
		int dataCount=service.dataCount();
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("size", size);
		
		List<Companion> list=service.listCompanion(map);
		
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		return model;
	}
	
	@GetMapping("write")
	public String writeForm(Model model) {
		
		return ".companion.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(@RequestParam List<String> areaCode,
			@RequestParam List<String> sigunguCode,
			@RequestParam String sdate,
			@RequestParam String edate,
			@RequestParam String theme,
			@RequestParam String gender,
			@RequestParam Set<String> age,
			@RequestParam int total_people,
			@RequestParam int estimate_cost,
			@RequestParam String subject,
			@RequestParam String content,
			HttpSession session,
			Model model) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Companion dto=new Companion();

		try {
			dto.setNickname(info.getNickName());
			dto.setUser_num(info.getUser_num());
			
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
			
			service.insertCompanion(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/companion/list";
	}
	
	@ResponseBody
	@GetMapping("areaCompanionList")
	public Map<String, Object> areaCompanionList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam String mainRegion) {
		Map<String, Object> model=new HashMap<String, Object>();
		int size=4;
		int dataCount;
		if(mainRegion.equals("전체")) {
			dataCount=service.dataCount();
		} else {
			dataCount=service.dataCountByArea(mainRegion);
		}
		
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("mainRegion", mainRegion);
		map.put("offset", offset);
		map.put("size", size);
		
		List<Companion> list=null;
		if(mainRegion.equals("전체")) {
			list=service.listCompanion(map);
		} else {
			list=service.listBymainRegion(map);
		}
		
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		return model;
	}
	
	@GetMapping("article")
	public String article(@RequestParam long num,
			Model model) {
		Companion dto=null;
		try {
			dto=service.findByNum(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("dto", dto);
		
		return ".companion.article";
	}
}
