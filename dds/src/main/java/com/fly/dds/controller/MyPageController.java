package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@GetMapping("profile")
	public String profileList() {
		
		return ".four.mypage.profile";
	}
	
	@GetMapping("profileUpdate")
    public String profileWrite() {
        return ".four.mypage.profileUpdate";
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
