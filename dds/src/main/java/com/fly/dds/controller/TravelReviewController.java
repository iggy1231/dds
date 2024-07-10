package com.fly.dds.controller;

import java.io.File;
import java.net.URLDecoder;
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

import com.fly.dds.domain.SessionInfo;
import com.fly.dds.domain.TravelReview;
import com.fly.dds.service.TravelReviewService;


@Controller
@RequestMapping(value = "/travelreview/*")
public class TravelReviewController {
	@Autowired
	private TravelReviewService service;
	
	@RequestMapping("list")
	public String companionList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<TravelReview> list = service.listReview(map);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".travelreview.list";
	}
	
	@GetMapping("create")
	public String insertForm() {
		return ".travelreview.createPost";
	}
	
	@PostMapping("create")
	public String insertReview(HttpSession session, TravelReview dto) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "travelreview";

		try {
			dto.setUser_num(info.getUser_num());
			service.reviewInsert(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/travelreview/list";
	}
}
