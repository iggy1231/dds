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

import com.fly.dds.common.FileManager;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Member;
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
			Member dto,
    		HttpSession session,
    		Model model
    		) {
			 
		    
		    Map<String, Object> map = new HashMap<>();
		    int size = 10;
		    int total_page = 0;
		    int dataCount = 0;
		    
		    
		    SessionInfo Info = (SessionInfo)session.getAttribute("member");
		    
		    Long user_num = Info.getUser_num();
		    
		    map.put("user_num", user_num);
		    
		    dataCount = service.dataCount(map);
		    total_page = dataCount != 0 ? myUtil.pageCount(size, dataCount) : 0;
		    if(total_page < current_page) current_page = total_page;
		    
		    int offset = (current_page - 1) * size;
		    map.put("offset", offset);
		    map.put("size", size);
		    List<TravelReview> list = service.listReview(map);
		try {
			dto = service.findById(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println("진명아 확인할땐 이렇게하는거야 " + dto.getAge());
		model.addAttribute("list",list);
		model.addAttribute("page",current_page);
		model.addAttribute("total_page",total_page);
		model.addAttribute("dto" , dto);
		return ".four.mypage.profile";
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
