package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/travelreview/*")
public class TravelReviewController {
	@GetMapping("list")
	public String companionList() {
		
		return ".travelreview.list";
	}
}
