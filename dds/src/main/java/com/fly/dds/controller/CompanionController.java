package com.fly.dds.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fly.dds.admin.domain.MemberManage;
import com.fly.dds.admin.service.MemberManageService;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Companion;
import com.fly.dds.domain.CompanionApply;
import com.fly.dds.domain.CompanionReply;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.CompanionService;

@Controller
@RequestMapping(value = "/companion/*")
public class CompanionController {
	@Autowired
	private CompanionService service;
	
	@Autowired
	private MemberManageService mmservice;
	
	@Autowired
	private MyUtil myUtil;
	
	@GetMapping("list")
	public String list() {
	
		return ".companion.list";
	}
	
	@ResponseBody
	@GetMapping("companionList")
	public Map<String, Object> companionList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(value="gender") String gender,
			@RequestParam(value="age") String age) {
		Map<String, Object> model=new HashMap<String, Object>();
		int size=5;
		int dataCount=service.dataCountall();
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
		map.put("gender", gender);
		map.put("age", age);
		
		List<Companion> list=service.listCompanionGenderAge(map);
		
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		return model;
	}
	
	@GetMapping("write")
	public String writeForm(Model model) {
		
		model.addAttribute("mode", "write");
		return ".companion.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(@RequestParam List<String> areaCode,
			@RequestParam List<String> sigunguCode,
			@RequestParam String sdate,
			@RequestParam String edate,
			@RequestParam String theme,
			@RequestParam String gender,
			@RequestParam String age,
			@RequestParam int total_people,
			@RequestParam int estimate_cost,
			@RequestParam String subject,
			@RequestParam String content,
			@RequestParam List<MultipartFile> imgFiles,
			HttpSession session,
			Model model) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Companion dto=new Companion();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "companion";

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
			dto.setImgFiles(imgFiles);
			
			service.insertCompanion(dto, pathname);
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
	@GetMapping("areaPopularList")
	public Map<String, Object> areaPopularList(@RequestParam String mainRegion) {
		Map<String, Object> model=new HashMap<String, Object>();
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("mainRegion", mainRegion);
		map.put("size", 12);
		map.put("offset", 0);
		
		List<Companion> list=null;
		if(mainRegion.equals("전체")) {
			list=service.PopularList(map);
		} else {
			list=service.areaPopularList(map);
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
		List<Companion> imgFiles=null;
				
		try {
			dto=service.findByNum(num);
			imgFiles=service.listFile(num);
			service.updateHitCount(num);
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
		
		List<CompanionApply> waitingList=service.waitingList(num);
		List<CompanionApply> partyList=service.partyList(num);
		
		model.addAttribute("waitingList", waitingList);
		model.addAttribute("partyList", partyList);
		model.addAttribute("imgFiles", imgFiles);
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
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> map=new HashMap<String, Object>();
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		List<CompanionReply> list=null;

		int size=10;
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
		
		for(CompanionReply dto:list) {
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
	
	@ResponseBody
	@PostMapping("insertReplyAnswer")
	public Map<String, Object> insertReplyAnswer(@RequestParam long num,
			@RequestParam long reply_num,
			@RequestParam String content,
			HttpSession session) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> model=new HashMap<String, Object>();
		
		String state = "false";
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("num", num);
			map.put("answer_num", reply_num);
			map.put("user_num", info.getUser_num());
			map.put("nickName", info.getNickName());
			map.put("content", content);
			
			service.insertCompanionAnswer(map);
			state="true";
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.put("state", state);
		return model;
	}
	
	@GetMapping("search")
	public String searchPage(@RequestParam(defaultValue = "subject") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam String mainRegion,
			Model model) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("kwd", kwd);
		map.put("schType", schType);
		map.put("mainRegion", mainRegion);
		int dataCount=0;
		
		if(mainRegion.equals("전체")) {
			dataCount=service.dataCount(map);
		} else {
			dataCount=service.areaDataCount(map);
		}
		
		model.addAttribute("mainRegion", mainRegion);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("kwd", kwd);
		return ".companion.search";
	}
	
	@ResponseBody
	@GetMapping("searchList")
	public Map<String, Object> searchList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam int dataCount,
			@RequestParam(defaultValue = "subject") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam String mainRegion) {
		Map<String, Object> model=new HashMap<String, Object>();
		
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
		map.put("mainRegion", mainRegion);
		List<Companion> list=null;
		
		if(mainRegion.equals("전체")) {
			list=service.listCompanion(map);
		} else {
			list=service.listBymainRegion(map);
		}
		
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		return model;
	}
	
	@ResponseBody
	@GetMapping("searchPopularList")
	public Map<String, Object> searchPopularList(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam int dataCount,
			@RequestParam(defaultValue = "subject") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam String mainRegion) {
		Map<String, Object> model=new HashMap<String, Object>();
		
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
		map.put("mainRegion", mainRegion);
		
		List<Companion> list=null;
		
		if(mainRegion.equals("전체")) {
			list=service.popularListCompanion(map);
		} else {
			list=service.popularListBymainRegion(map);
		}
		
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("list", list);
		
		return model;
	}
	
	@ResponseBody
	@PostMapping("apply")
	public Map<String, Object> apply(@RequestParam long num,
			HttpSession session) {
		Map<String, Object> model=new HashMap<String, Object>();
		Map<String, Object> map=new HashMap<String, Object>();
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		map.put("num", num);
		map.put("user_num", info.getUser_num());
		map.put("nickname", info.getNickName());
		map.put("status", "대기");
		String state="false";
		try {
			if(service.isApplied(map)) {
				state="applied";
			} else {
				service.apply(map);
				state="true";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.put("state", state);
		return model;
	}
	
	@PostMapping("accept")
	public String accept(@RequestParam long num, @RequestParam long user_num) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("user_num", user_num);
		map.put("mode", "add");
		try {
			service.accept(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/companion/article?num="+num;
	}
	
	@PostMapping("reject")
	public String reject(@RequestParam long num, @RequestParam long user_num) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("user_num", user_num);
		try {
			service.reject(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:/companion/article?num="+num;
	}
	
	@PostMapping("vanish")
	public String vanish(@RequestParam long num, @RequestParam long user_num) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("user_num", user_num);
		map.put("mode", "sub");
		try {
			service.vanish(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:/companion/article?num="+num;
	}
	
	@PostMapping("deleteCompanion")
	public String deleteCompanion(@RequestParam long num) {
		try {
			service.deleteCompanion(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/companion/list";
	}
	
	@PostMapping("endCompanion")
	public String endCompanion(@RequestParam long num) {
		try {
			service.endCompanion(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/companion/list";
	}
	
	@GetMapping("updateCompanion")
	public String updateForm(@RequestParam long num,
			Model model) {
		Companion dto=null;
		try {
			dto=service.findByNum(num);
			if(dto==null) {
				return "redirect:/companion/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".companion.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(@RequestParam long num,
			@RequestParam List<String> areaCode,
			@RequestParam List<String> sigunguCode,
			@RequestParam String sdate,
			@RequestParam String edate,
			@RequestParam String theme,
			@RequestParam String gender,
			@RequestParam String age,
			@RequestParam int total_people,
			@RequestParam int estimate_cost,
			@RequestParam String subject,
			@RequestParam String content,
			@RequestParam List<MultipartFile> imgFiles,
			HttpSession session,
			Model model) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Companion dto=new Companion();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "companion";

		try {
			dto.setNum(num);
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
			dto.setImgFiles(imgFiles);
			
			service.updateCompanion(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/companion/list";
	}
	
	@ResponseBody
	@PostMapping("reportReply")
	public Map<String, Object> companionReplyReport(@RequestParam(value="article_num") long article_num,
			@RequestParam(value="user_num") long user_num,
			@RequestParam(value="reason") String reason,
			HttpSession session) {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		Map<String, Object> model=new HashMap<String, Object>();
		String state="false";
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("article_num", article_num);
			map.put("user_num", user_num);
			map.put("reporter_num", info.getUser_num());
			if(service.isCompanionReplyReported(map)) {
				state="reported";
				model.put("state", state);
				return model;
			}
			map.put("reason", reason);
			service.reportCompanionReply(map);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("state", state);
		return model;
	}
	
	@ResponseBody
	@PostMapping("reportCompanion")
	public Map<String, Object> companionReport(@RequestParam(value="article_num") long article_num,
			@RequestParam(value="user_num") long user_num,
			@RequestParam(value="reason") String reason,
			HttpSession session) {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		Map<String, Object> model=new HashMap<String, Object>();
		String state="false";
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("article_num", article_num);
			map.put("user_num", user_num);
			map.put("reporter_num", info.getUser_num());
			if(service.isCompanionReported(map)) {
				state="reported";
				model.put("state", state);
				return model;
			}
			map.put("reason", reason);
			service.reportCompanion(map);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("state", state);
		return model;
	}
}
