package com.fly.dds.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.dds.admin.domain.MemberManage;
import com.fly.dds.admin.domain.ReportManage;
import com.fly.dds.admin.service.MemberManageService;

@Controller
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	@Autowired
	private MemberManageService service;
	
	
	@GetMapping("list")
    public String memberManage(@RequestParam(value = "page", defaultValue = "1") int current_page,
    		@RequestParam(defaultValue = "") String kwd,
            HttpServletRequest req,
            Model model
    		) throws Exception {
		 int size = 10;
	        int total_page = 0;
	        int dataCount = 0;
	        
	        if (req.getMethod().equalsIgnoreCase("GET")) {
	            kwd = URLDecoder.decode(kwd, "utf-8");
	        }
	        
	        Map<String, Object> map = new HashMap<String, Object>();

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
	        List<MemberManage> list = service.listMember(map);
	        
	        model.addAttribute("list",list);
	        model.addAttribute("kwd",kwd);
	        model.addAttribute("page",current_page);
	        model.addAttribute("total_page",total_page);
	        model.addAttribute("size",size);
	        model.addAttribute("dataCount",dataCount);
		
        return ".admin.memberManage.list";
    }
	
	@GetMapping("reportbanlist")
	public String listManage() {
		
		return ".admin.banManage.list";
	}
	
	@GetMapping("report")
    public String reportManage(@RequestParam(value = "page", defaultValue = "1") int current_page,
            HttpServletRequest req,
            Model model
    		) throws Exception {
		 int size = 10;
	        int total_page = 0;
	        int dataCount = 0;
	        
	        Map<String, Object> map = new HashMap<String, Object>();

	        dataCount = service.reportCount();
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
	        
	        ReportManage dto = null;
	        
	        List<ReportManage> list = service.listReportMember(dto);
	        
	        model.addAttribute("list",list);
	        model.addAttribute("page",current_page);
	        model.addAttribute("total_page",total_page);
	        model.addAttribute("size",size);
	        model.addAttribute("dataCount",dataCount);
		
        return ".admin.memberManage.report";
    }
	
	@GetMapping("banlist")
    public String banManage(@RequestParam(value = "page", defaultValue = "1") int current_page,
            HttpServletRequest req,
            Model model
    		) throws Exception {
		 int size = 10;
	        int total_page = 0;
	        int dataCount = 0;
	        
	        Map<String, Object> map = new HashMap<String, Object>();

	        dataCount = service.banCount();
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
	        

	        
	        List<ReportManage> list = service.listBan();
	        
	        model.addAttribute("list",list);
	        model.addAttribute("page",current_page);
	        model.addAttribute("total_page",total_page);
	        model.addAttribute("size",size);
	        model.addAttribute("dataCount",dataCount);
		
        return ".admin.memberManage.banlist";
    }
	
	@PostMapping("ban")
	public String insertBan(
			@RequestParam int ban_date,
			@RequestParam String reason,
			@RequestParam Long user_num
			) {
		
		MemberManage dto = new MemberManage();
		
		try {
			dto.setBan_date(ban_date);
			dto.setReason(reason);
			dto.setUser_num(user_num);
			
			service.insertBan(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return ".admin.memberManage.list";
	}
	
	@PostMapping("unblock")
	public String unblock(
			@RequestParam long user_num
			) {

		try {
			service.updateBan(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/memberManage/banlist";
	}
}