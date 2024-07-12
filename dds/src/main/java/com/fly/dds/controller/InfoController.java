package com.fly.dds.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Info;
import com.fly.dds.service.InfoService;

@Controller
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
	
	@ResponseBody
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
		for(Info dto:list) {
			Set<String> set=new HashSet<String>();
			
			set.add(dto.getContentType());
			set.add(dto.getMain_Category());
			set.add(dto.getMiddle_Category());
			set.add(dto.getSub_Category());
			
			dto.setTags(set);
		}
		
		Map<String, Object> model=new HashMap<String, Object>();
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		return model;
	}
	
	@GetMapping("search")
	public ModelAndView infoSearch(Model model) {
		
		return new ModelAndView(".info.search");
	}
	
	@GetMapping("load")
	public String loadArticle(@RequestParam String contentId,
			@RequestParam String contentType,
			@RequestParam String thumbnail,
			Model model) {
		model.addAttribute("contentId", contentId);
		model.addAttribute("contentType", contentType);
		model.addAttribute("thumbnail", thumbnail);
		
		return "info/load";
	}
	
	@PostMapping("article")
	public String infoArticle(@RequestParam String title,
			@RequestParam String homepage,
			@RequestParam String tel,
			@RequestParam String addr1,
			@RequestParam String addr2,
			@RequestParam String zipcode,
			@RequestParam String areacode,
			@RequestParam String sigungucode,
			@RequestParam String cat1,
			@RequestParam String cat2,
			@RequestParam String cat3,
			@RequestParam String mapx,
			@RequestParam String mapy,
			@RequestParam String overview,
			@RequestParam String contentId,
			@RequestParam String thumbnail,
			Model model) {
		Info dto=new Info();
		Map<String, Object> areaMap=new HashMap<String, Object>();
		Map<String, Object> categoryMap=new HashMap<String, Object>();
		Set<String> tagList=new HashSet<String>();
	
		try {
			dto.setName(title);
			dto.setHomepage(homepage);
			dto.setTel(tel);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			dto.setZipcode(zipcode);
			
			areaMap=myUtil.areaCode(Integer.parseInt(areacode), Integer.parseInt(sigungucode));
			categoryMap=myUtil.categoryCode(cat1, cat2, cat3);
			dto.setRegion_Main(areaMap.get("areaCode").toString());
			dto.setRegion_Sub(areaMap.get("sigunguCode").toString());
			
			tagList.add(categoryMap.get("category1").toString());
			tagList.add(categoryMap.get("category2").toString());
			tagList.add(categoryMap.get("category3").toString());
			
			dto.setMapx(mapx);
			dto.setMapy(mapy);
			dto.setOverview(overview);
			dto.setThumbnail(thumbnail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("tagList", tagList);
		model.addAttribute("dto", dto);
		model.addAttribute("contentId", contentId);
		return ".info.article";
	}
}
