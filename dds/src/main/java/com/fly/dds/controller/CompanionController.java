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
import com.fly.dds.domain.InfoReply;
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
	public Map<String, Object> areaCompanionList(@RequestParam String mainRegion) {
		Map<String, Object> model=new HashMap<String, Object>();
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("mainRegion", mainRegion);
		map.put("size", 12);
		map.put("offset", 0);
		
		List<Companion> list=null;
		if(mainRegion.equals("전체")) {
			list=service.listCompanion(map);
		} else {
			list=service.listBymainRegion(map);
		}

		model.put("list", list);
		
		return model;
	}
	
	@ResponseBody
	@GetMapping("similiarList")
	public Map<String, Object> similiarList(@RequestParam long num,
			@RequestParam String mainRegion) {
		Map<String, Object> model=new HashMap<String, Object>();
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("mainRegion", mainRegion);
		map.put("num", num);
		map.put("size", 12);
		map.put("offset", 0);
		
		List<Companion> list=null;
		list=service.similiarList(map);

		model.put("list", list);
		
		return model;
	}
	
	@GetMapping("article")
	public String article(@RequestParam long num,
			HttpSession session,
			Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Companion dto=null;
		
		try {
			dto=service.findByNum(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int likeCount=service.likeCount(num);
		model.addAttribute("liked", "false");
		if(info!=null) {
			Map<String, Object> likeMap=new HashMap<String, Object>();
			likeMap.put("num", num);
			likeMap.put("user_num", info.getUser_num());
			
			if(service.isCompanionLiked(likeMap)) {
				model.addAttribute("liked", "true");
			}
		}
		
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("dto", dto);
		
		return ".companion.article";
	}
	
	@ResponseBody
	@PostMapping("like")
	public Map<String, Object> insertCompanionLike(@RequestParam long num,
			HttpSession session) {
		
		Map<String, Object> model=new HashMap<String, Object>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
				
		String state = "false";
		int likeCount=service.likeCount(num);
		
		Map<String, Object> likeMap=new HashMap<String, Object>();
		likeMap.put("num", num);
		likeMap.put("user_num", info.getUser_num());
		
		try {
			if(service.isCompanionLiked(likeMap)) {
				state="liked";
				model.put("state", state);
				model.put("likeCount", likeCount);
				return model;
			}
			service.insertCompanionLike(likeMap);		
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		likeCount=service.likeCount(num);	
		model.put("state", state);
		model.put("likeCount", likeCount);
				
		return model;
	}
	@ResponseBody
	@PostMapping("insertReply")
	public Map<String, Object> insertReply(@RequestParam long num,
			@RequestParam String content,			
			HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "false";
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("num", num);
			map.put("user_num", info.getUser_num());
			map.put("nickName", info.getNickName());
			map.put("content", content);
			
			service.insertCompanionReply(map);
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.put("state", state);
		
		return model;	
	}
	
	@ResponseBody
	@GetMapping("listReply")
	public Map<String, Object> listCompanionReply(@RequestParam long num,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) {
		System.out.println("??????");
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> map=new HashMap<String, Object>();
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		List<InfoReply> list=null;

		int size=5;
		int dataCount=service.replyCount(num);
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		map.put("num", num);
		map.put("offset", offset);
		map.put("size", size);
		
		if(info!=null) {
			map.put("login_user_num", info.getUser_num());
		}
		
		list=service.listCompanionReply(map);
		if(list==null) {
			return model;
		}
		
		for(InfoReply dto:list) {
			dto.setLikeCount(service.replyLikeCount(dto.getReply_num()));
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		model.put("paging", paging);
		
		return model;
	}
	
	@ResponseBody
	@PostMapping("deleteReply")
	public Map<String, Object> companionReplyDelete(@RequestParam long reply_num) {
		Map<String, Object> model=new HashMap<String, Object>();
		String state="false";
		
		try {
			service.deleteCompanionReply(reply_num);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("state", state);
		return model;
	}
	
	@ResponseBody
	@PostMapping("insertReplyLike")
	public Map<String, Object> insertInfoReplyLike(@RequestParam long reply_num,
			HttpSession session) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> model=new HashMap<String, Object>();
		
		String state = "false";
		int likeCount=service.replyLikeCount(reply_num);
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("reply_num", reply_num);
			map.put("user_num", info.getUser_num());
			
			if(service.isCompanionReplyLiked(map)) {
				state="liked";
				model.put("state", state);
				model.put("likeCount", likeCount);
				return model;
			}
			
			service.insertCompanionReplyLike(map);
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		likeCount=service.replyLikeCount(reply_num);
		model.put("likeCount", likeCount);
		model.put("state", state);
		
		return model;
	}
}
