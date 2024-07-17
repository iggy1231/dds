package com.fly.dds.admin.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.dds.admin.domain.FaqManage;
import com.fly.dds.admin.service.FaqManageService;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.SessionInfo;

@Controller
@RequestMapping("/admin/faqManage/*")
public class FaqManageController {
	@Autowired
	private FaqManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")	
	private MyUtil myUtil;

	@RequestMapping(value = "main")
	public String main(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("mode", "enabled");
		List<FaqManage> listCategory = service.listCategory(map);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("categoryNum", "0");
		model.addAttribute("pageNo", current_page);

		return ".admin.faqManage.main";
	}

	// AJAX-Text(HTML)
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "0") int categoryNum,
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
		map.put("categoryNum", categoryNum);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<FaqManage> list = service.listFaq(map);
		for (FaqManage dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("categoryNum", categoryNum);

		return "admin/faqManage/list";
	}

	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<FaqManage> listCategory = service.listCategory(map);

		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory", listCategory);

		return ".admin.faqManage.write";
	}

	@PostMapping("write")
	public String writeSubmit(FaqManage dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUser_num(info.getUser_num());
			service.insertFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/faqManage/main?pageNo=1";
	}

	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		FaqManage dto = service.findById(num);
		if (dto == null) {
			return "redirect:/admin/faqManage/main?pageNo=" + pageNo;
		}

		if (! (info.getUser_num() == dto.getUser_num())) {
			return "redirect:/admin/faqManage/main?pageNo=" + pageNo;
		}

		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<FaqManage> listCategory = service.listCategory(map);

		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);

		return ".admin.faqManage.write";
	}

	@PostMapping("update")
	public String updateSubmit(FaqManage dto,
			@RequestParam String pageNo,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUser_num(info.getUser_num());
			service.updateFaq(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/faqManage/main?pageNo=" + pageNo;
	}

	// AJAX-JSON
	@PostMapping("delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam long num,
			HttpSession session) throws Exception {
		String state = "false";

		try {
			Map<String, Object> map = new HashMap<>();
			map.put("num", num);

			service.deleteFaq(map);
			state = "true";
		} catch (Exception e) {
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}

	// AJAX-Text(HTML)
	@GetMapping("listAllCategory")
	public String listAllCategory(Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("mode", "all");
		List<FaqManage> listCategory = service.listCategory(map);
		model.addAttribute("listAllCategory", listCategory);
		
		return "admin/faqManage/listAllCategory";
	}

	// AJAX-JSON
	@GetMapping("listCategory")
	@ResponseBody
	public Map<String, Object> listCategory(@RequestParam String mode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mode", mode);
		List<FaqManage> listCategory = service.listCategory(map);

		Map<String, Object> model = new HashMap<>();
		model.put("listCategory", listCategory);
		return model;
	}

	// AJAX-JSON
	@PostMapping("insertCategory")
	@ResponseBody
	public Map<String, Object> insertCategory(FaqManage dto) throws Exception {

		String state = "false";
		try {
			service.insertCategory(dto);
			state = "true";
		} catch (Exception e) {
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	// AJAX-JSON
	@PostMapping("updateCategory")
	@ResponseBody
	public Map<String, Object> updateCategory(FaqManage dto) throws Exception {

		String state = "false";
		try {
			service.updateCategory(dto);
			state = "true";
		} catch (Exception e) {
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	// AJAX-JSON
	@PostMapping("deleteCategory")
	@ResponseBody
	public Map<String, Object> deleteCategory(@RequestParam long categoryNum) throws Exception {

		String state = "false";
		try {
			service.deleteCategory(categoryNum);
			state = "true";
		} catch (Exception e) {
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

}
