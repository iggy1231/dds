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
import com.fly.dds.domain.RoomPayment;
import com.fly.dds.service.RoomService;

@Controller
@RequestMapping(value = "/admin/product/*")
public class ProductManageController {

	@Autowired
	private RoomProductService service;

	@Autowired
	private RoomService rservice;

	@Autowired
	private MyUtil myUtil;

	@GetMapping("main")
	public String productList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "page2", defaultValue = "1") int current_page2) {

		return ".admin.product.main";
	}

	// 숙소 리스트 ajax - admin/product/roomlist
	@RequestMapping("roomList")
	public String productList(@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req, Model model)
			throws Exception {

		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("서치타입" + schType + "키워드! 에용" + kwd);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCountRoom(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Room> list = service.listRoomProduct(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listRoom");

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "admin/product/roomList";
	}

	// 투어 리스트 ajax
	@RequestMapping("tourList")
	public String productTourList(@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req, Model model)
			throws Exception {

		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCountRoom(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Room> list = service.listRoomProduct(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listTour");

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "admin/product/tourList";
	}

	@GetMapping("write")
	public String roomWriteForm(Model model) {

		model.addAttribute("mode", "write");

		return ".admin.product.write";
	}

	@PostMapping("write")
	public String roomWriteSubmit(Room dto, HttpSession session, Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "room";

		try {
			service.insertProduct(dto, path);
			// model.addAttribute("message", "등록이 성공적으로 완료되었습니다.");
		} catch (Exception e) {
			// model.addAttribute("message", "등록에 실패했습니다.");
		}

		return "redirect:/admin/product/roomList";
	}

	@GetMapping("update")
	public String roomUpdateForm(@RequestParam long num, @RequestParam String page, Model model) {

		Room dto = service.findById(num);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("num", num);

		List<Room> list = rservice.listDetail(map);
		List<Room> list2 = rservice.listPhoto(map);

		if (dto == null) {
			return "redirect:/admin/product/main";
		}

		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("num", num);
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);

		return ".admin.product.write";
	}

	@PostMapping("update")
	public String roomUpdateSubmit(Room dto, @RequestParam String page, HttpSession session, Model model) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "room";

		try {
			service.updateProduct(dto, path);
		} catch (Exception e) {
		}
		String query = "num=" + dto.getNum() + "&page=" + page;

		return "redirect:/admin/product/main?" + query;
	}

	@RequestMapping("listsale")
	public String listSale(@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req,
			Model model) throws Exception {

		int size = 10;
		int total_page;
		int dataCount;

		Map<String, Object> map = new HashMap<String, Object>();

		dataCount = service.saleCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);

		List<RoomPayment> list = service.listSale(map);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);

		return ".admin.product.listsale";
	}

}
