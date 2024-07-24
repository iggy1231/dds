package com.fly.dds.admin.controller;

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

import com.fly.dds.admin.service.RoomProductService;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Room;

@Controller
@RequestMapping(value = "/admin/product/*")
public class ProductManageController {
	
	@Autowired
	private RoomProductService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String productList(
			@RequestParam (defaultValue = "all") String schType,
			@RequestParam (defaultValue = "") String kwd,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model
			)  throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCountRoom(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0 ) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Room> list = service.listRoomProduct(map);
		
		
		String listUrl = cp + "/admin/product/list";
		// String articleUrl = cp + "/admin"
		
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		return ".admin.product.list";
	}
	
	
	
	
	@GetMapping("write")
	public String roomWriteForm(Model model) {
		
		model.addAttribute("mode", "write");
		
		return ".admin.product.write";
	}
	
	@PostMapping("write")
	public String roomWriteSubmit(Room dto,
									
	                              HttpSession session,
	                              Model model) {
	    String root = session.getServletContext().getRealPath("/");
	    String path = root + "uploads" + File.separator + "room";

	    try {
	        service.insertProduct(dto, path);
	       // model.addAttribute("message", "등록이 성공적으로 완료되었습니다.");
	    } catch (Exception e) {
	       // model.addAttribute("message", "등록에 실패했습니다.");
	    }

	    return "redirect:/admin/product/list";
	}
	
	
	
}
