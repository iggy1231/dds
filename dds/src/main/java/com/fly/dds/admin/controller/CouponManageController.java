package com.fly.dds.admin.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fly.dds.admin.service.CouponManageService;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Coupon;
import com.fly.dds.domain.SessionInfo;

@Controller
@RequestMapping(value = "/admin/couponManage/*")
public class CouponManageController {
	@Autowired
	private CouponManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@ResponseBody
	@GetMapping("historyList")
	public Map<String, Object> historyList(@RequestParam(value="pageNo", defaultValue="1") int current_page) {
		Map<String, Object> model=new HashMap<String, Object>();
		
		List<Coupon> list=null;
		int size=10;
		int historyCount=service.historyCount();
		int total_page=myUtil.pageCount(historyCount, size);
		
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("size", size);
		
		try {
			list=service.listCouponHistory(map);
		} catch (Exception e) {
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, "CouponHistoryList");
		
		model.put("list", list);
		model.put("pageNo", current_page);
		model.put("total_page", total_page);
		model.put("paging", paging);
		
		return model;
	}
	
	@GetMapping("list")
	public String couponList(@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) {
		List<Coupon> list=null;
		
		
		int size=5;
		int dataCount=service.dataCount();
		
		int total_page=myUtil.pageCount(dataCount, size);
		
		
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*size;
		if(offset<0) {
			offset=0;
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("size", size);
		
		try {
			list=service.listCoupon(map);
			if(list==null) {
				return "redirect:/admin";
			}
		} catch (Exception e) {
		}
		String listUrl=req.getContextPath()+"/admin/couponManage/list?";
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		return ".admin.couponManage.list";
	}
	
	@GetMapping("write")
	public String couponWriteForm(Model model) {
		model.addAttribute("mode", "write");
		return ".admin.couponManage.write";
	}
	
	@PostMapping("write")
	public String couponWriteSubmit(@RequestParam(value="name") String name,
			@RequestParam(value="content") String content,
			@RequestParam(value="code") String code,
			@RequestParam(value="rate_discount") int rate_discount,
			@RequestParam(value="issue_date") String issue_date,
			@RequestParam(value="expiry_date") String expiry_date,
			@RequestParam(value="coupon_image") MultipartFile coupon_image,
			HttpSession session) {
		
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		Coupon dto=new Coupon();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "couponManage";
		
		try {
			dto.setName(name);
			dto.setContent(content);
			dto.setRate_discount(rate_discount);
			dto.setCode(code);
			dto.setIssue_date(issue_date);
			dto.setExpiry_date(expiry_date);
			dto.setCoupon_image(coupon_image);
			dto.setUser_num(info.getUser_num());
			
			service.insertCoupon(dto, pathname);
		} catch (Exception e) {
			
		}
		
		return "redirect:/admin/couponManage/list";
	}
	
	@PostMapping("updateForm")
	public String couponUpdateForm(@RequestParam(value="num") long num,
			Model model) {
		Coupon dto=null;
		try {
			dto=service.findByNum(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".admin.couponManage.write";
	}
	
	@PostMapping("update")
	public String couponUpdateSubmit(@RequestParam(value="num") long num,
			@RequestParam(value="name") String name,
			@RequestParam(value="content") String content,
			@RequestParam(value="code") String code,
			@RequestParam(value="rate_discount") int rate_discount,
			@RequestParam(value="issue_date") String issue_date,
			@RequestParam(value="expiry_date") String expiry_date,
			@RequestParam(value="coupon_image") MultipartFile coupon_image,
			HttpSession session) {
		
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		Coupon dto=new Coupon();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "couponManage";
		
		System.out.println(num);
		
		try {
			dto.setNum(num);
			dto.setName(name);
			dto.setContent(content);
			dto.setRate_discount(rate_discount);
			dto.setCode(code);
			dto.setIssue_date(issue_date);
			dto.setExpiry_date(expiry_date);
			dto.setCoupon_image(coupon_image);
			dto.setUser_num(info.getUser_num());
			
			service.updateCoupon(dto, pathname);
		} catch (Exception e) {
			
		}
		
		return "redirect:/admin/couponManage/list";
	}
	
	@PostMapping("delete")
	public String couponDelete(@RequestParam(value="num") long num) {
		
		try {
			service.deleteCoupon(num);
		} catch (Exception e) {
			
		}
		
		return "redirect:/admin/couponManage/list";
	}
}
