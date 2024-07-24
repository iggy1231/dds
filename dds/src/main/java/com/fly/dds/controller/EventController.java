package com.fly.dds.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Event;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.EventService;


@Controller
@RequestMapping("/event/*")
public class EventController {
	@Autowired
	private EventService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("{category}/list")
	public String list(@PathVariable String category,
					@RequestParam(value = "page", defaultValue = "1") int current_page,
					@RequestParam(defaultValue = "all") String schType,
					@RequestParam(defaultValue = "") String kwd,
					HttpServletRequest req,
					Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("showEvent", 1);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<Event> list = service.listEvent(map);

		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/event/"+category+"/list";
		String articleUrl = cp + "/event/"+category+"/article?page=" + current_page;

		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".event.list";
	}
	
	@GetMapping("{category}/article")
	public String article(
			@PathVariable String category,
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		if(category.equals("progress")) {
			service.updateHitCount(num);
		}

		Event dto = service.findByNum(num);
		if (dto == null) {
			return "redirect:/event/" + category + "/list?" + query;
		}
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("showEvent", 1);
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);

		Event prevDto = service.findByPrev(map);
		Event nextDto = service.findByNext(map);
		
		
		// 진행 이벤트(progress) 탭 : 이벤트 참여 여부
		boolean userEventTakers = false;
		if(category.equals("progress")) {
			map.put("user_num", info.getUser_num());
			userEventTakers = service.userEventTakers(map);
		}
		
		// 당첨자 발표(winner) 탭 : 이벤트 당첨자
		List<Event> listEventWinner = null;
		Event userWinner =  null; // 로그인 유저 당첨 유무
		if(category.equals("winner") || category.equals("ended")) {
			listEventWinner = service.listEventWinner(num);
			
			for(Event vo : listEventWinner) {
				if(vo.getUser_num()==(info.getUser_num())) {
					userWinner = vo;
				}
				
				vo.setUserName(myUtil.nameMasking(vo.getUserName()));
			}
		}

		model.addAttribute("category", category);
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);

		model.addAttribute("userEventTakers", userEventTakers);
		model.addAttribute("listEventWinner", listEventWinner);
		model.addAttribute("userWinner", userWinner); 
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
	
		return ".event.article";
	}
	
	@PostMapping("progress/apply")
	@ResponseBody
	public Map<String, Object> applySubmit(Event dto,
			HttpSession session) throws Exception {
		// 이벤트 응모
		
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";
		
		try {
			Event vo = service.findByNum(dto.getNum());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date now = new Date();
			Date date = sdf.parse(vo.getEndDate());
			if(now.getTime() > date.getTime()) {
				model.put("state", "timeout");
				return model;
			}
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");

			dto.setUser_num(info.getUser_num());
			service.insertEventTakers(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		model.put("state", state);
		
		return model;
	}
}
