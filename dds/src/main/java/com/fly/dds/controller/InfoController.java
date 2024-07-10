package com.fly.dds.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Info;
import com.fly.dds.service.InfoService;

@Controller
@ResponseBody
@RequestMapping(value = "/info/*")
public class InfoController {
	@Autowired
	private InfoService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("main")
	public ModelAndView info(Model model) {
		
		return new ModelAndView(".info.list");
	}
	
	@GetMapping("list")
	public Map<String, Object> infoList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page) throws Exception {
		int size=4;
		int dataCount=service.dataCount();
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Info> list=service.listInfo(map);
		
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		for(Info i:list) {
			System.out.println(i.getThumbnail());
		}
		
		return model;
	}
	
	@GetMapping("search")
	public String infoSearch() {
		
		return ".info.search";
	}
	
	@GetMapping("article")
	public String infoArticle() {
		
		return ".info.article";
	}
}
