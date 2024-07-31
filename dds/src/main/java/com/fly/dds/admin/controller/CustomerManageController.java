package com.fly.dds.admin.controller;

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

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.RoomQnA;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.RoomQnAService;

@Controller
@RequestMapping(value = "/admin/customer/*")
public class CustomerManageController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private RoomQnAService qnaService;
	
	
	@GetMapping("review")
	public String reviewList() {
		
		return ".admin.customer.review";
	}
	
	@GetMapping("question")
	public String questionList(
			@RequestParam(value = "page", defaultValue =  "1") int current_page,
			@RequestParam(defaultValue = "1") int mode,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 10;
			int dataCount = 0;
			
			map.put("mode", mode);
			dataCount = qnaService.dataCount2(map);
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			
			List<RoomQnA> list = qnaService.listQnA2(map);
			
			
			String cp = req.getContextPath();
			String listUrl = cp + "/admin/customer/question";
			if(mode != 1) {
				listUrl += "?mode=" + mode;
			}
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
			model.addAttribute("mode", mode);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".admin.customer.question";
	}
	
	@PostMapping("question/answer")
	public String questionAnswer(RoomQnA dto, @RequestParam String page, 
			@RequestParam int mode,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setUserName(info.getUserName());
			qnaService.updateQnA(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/admin/customer/question?";
		
		if(mode == 1) {
			url += "page=" + page;
		} else {
			url += "mode=" + mode + "&page=" + page;
		}
		return url;
	}
	
	@GetMapping("question/delete")
	public String questionDelete(
			@RequestParam long qna_num,
			@RequestParam String page,
			@RequestParam int mode,
			HttpSession session
			)  throws Exception {
		
		try {
			qnaService.deleteQnA(qna_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/admin/customer/question?";
		
		if(mode == 1) {
			url += "page=" + page;
		} else {
			url += "mode=" + mode + "&page=" + page;
		}
		return url;
		
	}
	
	
}
