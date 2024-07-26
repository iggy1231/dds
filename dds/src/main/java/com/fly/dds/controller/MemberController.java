package com.fly.dds.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.dds.domain.Member;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("login")
	public String loginForm() {
		return "member/login";
	}
	
	@PostMapping("login")
	public String loginSubmit(@RequestParam String userId,
			@RequestParam String userPwd,
			HttpSession session,
			Model model) {

		Member dto = service.loginMember(userId);
		if (dto == null || !userPwd.equals(dto.getPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
		
		SessionInfo info = new SessionInfo();
		
		info.setUser_num(dto.getUser_num());
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		info.setNickName(dto.getNickName());
		info.setGrade(dto.getGrade());
		info.setStatus(dto.getStatus());
		info.setActivity(dto.getActivity());
		info.setPhoto(dto.getPhoto());
		
		session.setMaxInactiveInterval(30 * 60);

		session.setAttribute("member", info);
		
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		System.out.println("after:"+uri);
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}

		return uri;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		session.invalidate();

		return "redirect:/";
	}
	
	@PostMapping("signup")
	public String signup(@RequestParam String userId,
			@RequestParam String userPwd,
			@RequestParam String userName,
			@RequestParam String userNickname,
			@RequestParam String userBirth) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPwd", userPwd);
		map.put("userName", userName);
		map.put("userNickname", userNickname);
		map.put("userBirth", userBirth);
		
		service.signupMember(map);
		
		return "redirect:/member/login";
	}
}
