package com.fly.dds.controller;

import java.io.File;
import java.net.http.HttpResponse;
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

import com.fly.dds.common.FileManager;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.MyPage;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.domain.TravelReview;
import com.fly.dds.service.MyPageService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@GetMapping("profile")
	public String profileList(
			 @RequestParam(value = "page", defaultValue = "1") int current_page,
			 @RequestParam(value = "page2", defaultValue = "1") int current_page2,

    		HttpSession session,
    		Model model
    		) {
		
		SessionInfo Info = (SessionInfo)session.getAttribute("member");
		Long user_num = Info.getUser_num();
		Member dto = null;
		try {
			dto = service.findById(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		model.addAttribute("dto" , dto);
		return ".four.mypage.profile";
	}
	
	
	@GetMapping("review")
	public String review(
			 @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
    		HttpSession session,
    		Model model
    		) {
			 
		    
		    Map<String, Object> map = new HashMap<>();
		    int size = 9;
		    int dataCount = 0;
		    
		    
		    SessionInfo Info = (SessionInfo)session.getAttribute("member");

		    
		    Long user_num = Info.getUser_num();
		    
		    map.put("user_num", user_num);
		    
		    dataCount = service.dataCount(map);
		    int total_page=myUtil.pageCount(dataCount, size);
		    if(total_page < current_page) current_page = total_page;
		    int offset = (current_page - 1) * size;
		    map.put("offset", offset);
		    map.put("size", size);
		    List<TravelReview> list = service.listReview(map);

		    String paging = myUtil.pagingMethod(current_page, total_page, "listReview");
		    
		model.addAttribute("dataCount" , dataCount);    
		model.addAttribute("list",list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo",current_page);

		model.addAttribute("total_page",total_page);

		return "mypage/review";
	}	
	
	@GetMapping("reply")
	public String reply(
			 @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
    		HttpSession session,
    		Model model
    		) {
			 
		    
		    Map<String, Object> map = new HashMap<>();
		    int size = 10;
		    int dataCount = 0;
		    
		    SessionInfo Info = (SessionInfo)session.getAttribute("member");
		    
		    Long user_num = Info.getUser_num();
		    
		    map.put("user_num", user_num);
		    
		    dataCount = service.replyCount(map);
		    
		    int total_page=myUtil.pageCount(dataCount, size);		    
		    if(total_page < current_page) current_page = total_page;
		    int offset = (current_page - 1) * size;
		    map.put("offset", offset);
		    map.put("size", size);
		    List<MyPage> list = service.listReply(map);
		  
		    
		    String paging = myUtil.pagingMethod(current_page, total_page, "listReply");
		
		    
		model.addAttribute("dataCount" , dataCount);

		model.addAttribute("list",list);
		
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo",current_page);

		model.addAttribute("total_page",total_page);

		return "mypage/reply";
	}	
	
	@PostMapping("mbtiUpdate")
    public String mbtiUpdate(Member dto,
    		HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setUser_num(info.getUser_num());
		
		try {
			service.updateMbti(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        return ".four.mypage.profile";
    }
	
	
	@GetMapping("profileUpdate")
    public String profileWrite(Member dto ,
    		HttpSession session,
    		Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto = service.findById(info.getUser_num());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//System.out.println("진명아 확인할땐 이렇게하는거야 " + dto);
		model.addAttribute("dto" , dto);
		
        return ".four.mypage.profileUpdate";
    }
	
	@PostMapping("profileUpdate")
	public String profileSubmit(Member dto ,
			HttpSession session 
			) {
	    String root = session.getServletContext().getRealPath("/");
	    String path = root + "uploads" + File.separator + "mypage";
	    SessionInfo info = (SessionInfo)session.getAttribute("member");
	    
	    dto.setUser_num(info.getUser_num());
	    
	    try {
			service.updateProfile(dto, path);
			service.updateInfo(dto);
			service.updateMember(dto);
			
			dto = service.findById(info.getUser_num());
			info.setPhoto(dto.getPhoto());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/profile";
	}
	
	@PostMapping("deleteMember")
	public String deleteMember(HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Long user_num = info.getUser_num();
		
		try {
			service.deleteInfo(user_num);
			service.deleteMember(user_num);
			service.deleteProfile(user_num);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/";
	}
	
	@PostMapping("deleteReply")
	@ResponseBody
	public Map<String, String> deleteReply(
			@RequestParam String boardname,
			@RequestParam long reply_num) {
		
		System.out.println("데이터" + boardname);
		System.out.println("리플라이" + reply_num);
		Map<String, String> map = new HashMap<>();
		try {
			
			service.deleteReply(boardname, reply_num);
			map.put("status", "success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	
	@GetMapping("wishList")
    public String wishList() {
        return ".four.mypage.wishList";
    }
	
	@GetMapping("myTrip")
    public String myTrip() {
        return ".four.mypage.myTrip";
    }
	
	@GetMapping("coupoint")
    public String coupoint() {
        return ".four.mypage.coupoint";
    }
	
	@GetMapping("inquiReview")
    public String inquiReview() {
        return ".four.mypage.inquiReview";
    }
	
	@GetMapping("companion")
    public String companion() {
        return ".four.mypage.companion";
    }
	
}
