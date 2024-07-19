package com.fly.dds.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.dds.common.FileManager;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomQnA;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.RoomQnAService;
import com.fly.dds.service.RoomService;

@Controller
@RequestMapping(value = "/room/*")
public class RoomController {
	@Autowired
	private RoomService service;
	
	@Autowired
	private RoomQnAService qnaService;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@GetMapping("main")
	public String roomMain() {
		return ".room.main";
	}
	
	@RequestMapping("article")
	public String roomArticle() {
		return ".room.article";
	}
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 데이터 개수 / 전체 페이지수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		// 리스트
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		
		List<Room> list = service.listRoom(map);
		
		String query = "";
		String cp = req.getContextPath();
		String listUrl;
		String articleUrl;
		if(kwd.length() != 0) {
			query = "&kwd=" +
					URLEncoder.encode(kwd, "utf-8");
		}
		
		listUrl = cp + "/dds/list";
		articleUrl = cp + "/dds/article?page=" + current_page;
		if(query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 포워딩할 JSP에 전달할 모델
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("kwd", kwd);
		model.addAttribute("paging", paging);
		
		return ".room.list";
	}
	
	@GetMapping("review")
	public String roomReview() {
		return "room/review";
	}
	
	@PostMapping("writeQnA")
	public String writeQnA(RoomQnA qna, HttpSession session,Model model) {
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        qna.setUserName(info.getUserName());
	        qna.setUserNum(info.getUser_num());
	        
	        qnaService.insertQnA(qna);
	        System.out.println("확인 " + qna.getNum());
	        if (qna.getNum() == 0) {
	            // 에러 메시지를 설정하고 폼을 다시 표시하도록 처리
	            model.addAttribute("message", "상품 번호가 필요합니다.");
	            return ".room.article"; // 폼으로 다시 돌아가도록 설정
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:/room/article?num=" + qna.getNum();
	}
	
	@GetMapping("search")
	 public String searchRoomList(@RequestParam String kwd, 
             @RequestParam(required = false) String sdate, 
             @RequestParam(required = false) String edate, 
             @RequestParam int people, 
             Model model) {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("kwd", kwd);
			map.put("sdate", sdate);
			map.put("edate", edate);
			map.put("people", people);
			
			List<Room> roomList = service.searchRoom(map);
			model.addAttribute("rooms", roomList);
			model.addAttribute("kwd", kwd);
			model.addAttribute("sdate", sdate);
			model.addAttribute("edate", edate);
			model.addAttribute("people", people);
			model.addAttribute("dataCount", roomList.size());
			
			return ".room.list";
				}
}
