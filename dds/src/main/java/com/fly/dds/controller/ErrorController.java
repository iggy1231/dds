package com.fly.dds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/error/*")
public class ErrorController {

	@GetMapping("error")
	public String error() {
		
		return ".error.error";
	}
	
	
	@GetMapping("error404")
	public String error404() {
		
		return ".error.error404";
	}
	
	
	
	
	}
	

