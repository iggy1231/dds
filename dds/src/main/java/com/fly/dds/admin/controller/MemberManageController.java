package com.fly.dds.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/membermanage/*")
public class MemberManageController {
	
	
	@GetMapping("list")
    public String memberManage() {
        return ".admin.memberManage.list";
    }
}
