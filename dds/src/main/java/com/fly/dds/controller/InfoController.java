package com.fly.dds.controller;

import java.util.HashMap;
import java.util.HashSet;
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
import com.fly.dds.domain.Info;
import com.fly.dds.domain.InfoReply;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.InfoService;

@Controller
@RequestMapping(value = "/info/*")
public class InfoController {
	@Autowired
	private InfoService service;
	
	@Autowired
	private MyUtil myUtil;

	
	@GetMapping("list")
	public String list(Model model) {
		
		
		Map<String, Object> map=new HashMap<String, Object>();
		int dataCount=service.dataCount(map);
		
		model.addAttribute("dataCount", dataCount);
		return ".info.list";
	}
	
	@ResponseBody
	@GetMapping("infoList")
	public Map<String, Object> infoList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page) throws Exception {
		
	
		
		Map<String, Object> map=new HashMap<String, Object>();
		int size=12;
		int dataCount=service.dataCount(map);
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
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
	public String search(@RequestParam(defaultValue = "name") String schType,
			@RequestParam(defaultValue = "") String kwd,
			Model model) {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("schType", schType);
			map.put("kwd",  kwd);
		
			int dataCount=service.dataCount(map);
			
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
		return ".info.search";
	}
	
	@ResponseBody
	@GetMapping("searchList")
	public Map<String, Object> infoSearch(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam int dataCount,
			@RequestParam(defaultValue = "name") String schType,
			@RequestParam(defaultValue = "") String kwd) throws Exception {

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd",  kwd);
		int size=12;
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
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
	
	@ResponseBody
	@GetMapping("searchPopularList")
	public Map<String, Object> popularInfoSearch(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam int dataCount,
			@RequestParam(defaultValue = "name") String schType,
			@RequestParam(defaultValue = "") String kwd) throws Exception {
		
		int size=12;
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
			
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
			
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd",  kwd);
		map.put("offset", offset);
		map.put("size", size);
			
		List<Info> list=service.popularListallInfo(map);
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
	
	@GetMapping("load")
	public String loadArticle(@RequestParam long num,
			@RequestParam String contentId,
			Model model) {
		model.addAttribute("num", num);
		model.addAttribute("contentId", contentId);
		return "info/load";
	}
	
	@PostMapping("article")
	public String infoArticle(@RequestParam long num,
			@RequestParam long contentId,
			@RequestParam String homepage,
			@RequestParam String tel,
			@RequestParam String addr1,
			@RequestParam String addr2,
			@RequestParam String mapx,
			@RequestParam String mapy,
			@RequestParam String overview,
			HttpSession session,
			Model model) {
		Set<String> tagList=new HashSet<String>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Info dto=service.findByNum(num);
		if(dto==null) {
			return "info.list";
		}
		try {
			dto.setHomepage(homepage);
			dto.setTel(tel);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			
			tagList.add(dto.getMain_Category());
			tagList.add(dto.getMiddle_Category());
			tagList.add(dto.getSub_Category());
			
			dto.setMapx(mapx);
			dto.setMapy(mapy);
			dto.setOverview(overview);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int likeCount=service.likeCount(num);
		
		model.addAttribute("liked", "false");
		if(info!=null) {
			Map<String, Object> likeMap=new HashMap<String, Object>();
			likeMap.put("num", num);
			likeMap.put("user_num", info.getUser_num());
			
			if(service.isInfoLiked(likeMap)) {
				model.addAttribute("liked", "true");
			}
		}
		
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("tagList", tagList);
		model.addAttribute("dto", dto);
		model.addAttribute("contentId", contentId);
		
		return ".info.article";
	}

	@ResponseBody
	@PostMapping("like")
	public Map<String, Object> insertInfoLike(@RequestParam long num,
			HttpSession session) {
		
		Map<String, Object> model=new HashMap<String, Object>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
				
		String state = "false";
		int likeCount=service.likeCount(num);
		
		Map<String, Object> likeMap=new HashMap<String, Object>();
		likeMap.put("num", num);
		likeMap.put("user_num", info.getUser_num());
		
		try {
			if(service.isInfoLiked(likeMap)) {
				state="liked";
				model.put("state", state);
				model.put("likeCount", likeCount);
				return model;
			}
			service.insertInfoLike(likeMap);		
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
	public Map<String, Object> insertInfoReply(@RequestParam long num,
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
			
			service.insertInfoReply(map);
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.put("state", state);
		
		return model;
	}
	
	@ResponseBody
	@GetMapping("listReply")
	public Map<String, Object> listInfoReply(@RequestParam long num,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) {
	
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

		
		list=service.listInfoReply(map);
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
			
			if(service.isInfoReplyLiked(map)) {
				state="liked";
				model.put("state", state);
				model.put("likeCount", likeCount);
				return model;
			}
			
			service.insertInfoReplyLike(map);
			state = "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		likeCount=service.replyLikeCount(reply_num);
		model.put("likeCount", likeCount);
		model.put("state", state);
		
		return model;
	}
	
	@ResponseBody
	@GetMapping("popularInfoListall")
	public Map<String, Object> popularInfoListall(@RequestParam(value = "pageNo", defaultValue = "1") int current_page) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		int size=12;
		int dataCount=service.dataCount(map);
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Info> list=service.popularListallInfo(map);
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
	
	@ResponseBody
	@PostMapping("deleteReply")
	public Map<String, Object> infoReplyDelete(@RequestParam long reply_num) {
		Map<String, Object> model=new HashMap<String, Object>();
		String state="false";
		
		try {
			service.deleteInfoReply(reply_num);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("state", state);
		return model;
	}
	
	@ResponseBody
	@PostMapping("reportReply")
	public Map<String, Object> infoReplyReport(@RequestParam long article_num,
			@RequestParam long user_num,
			@RequestParam String reason,
			HttpSession session) {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		Map<String, Object> model=new HashMap<String, Object>();
		String state="false";
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("article_num", article_num);
			map.put("user_num", user_num);
			map.put("reporter_num", info.getUser_num());
			if(service.isInfoReplyReported(map)) {
				state="reported";
				model.put("state", state);
				return model;
			}
			map.put("reason", reason);
			service.reportInfoReply(map);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("state", state);
		return model;
	}
	
	@ResponseBody
	@GetMapping("popularInfoList")
	public Map<String, Object> popularInfoList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		int size=3;
		int dataCount=service.countPopularData();
		int total_page=myUtil.pageCount(dataCount, size);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Info> list=service.popularListInfo(map);
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
}
