package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/schedule/*")
public class ScheduleController {
	
	@GetMapping("list")
	public String scheduleList() {
		
		return ".schedule.list";
	}
}
