package com.fly.dds.controller;

import java.io.File;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Companion;
import com.fly.dds.domain.Coupon;
import com.fly.dds.domain.Info;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.MyPage;
import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomQnA;
import com.fly.dds.domain.RoomReview;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.domain.TravelReview;
import com.fly.dds.service.MyPageService;
import com.fly.dds.service.RoomPaymentService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	@Autowired
	private MyPageService service;

	@Autowired
	private MyUtil myUtil;

	@Autowired
	private RoomPaymentService rpservice;



	@GetMapping("profile")
	public String profileList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "page2", defaultValue = "1") int current_page2,

			HttpSession session, Model model) {



		SessionInfo Info = (SessionInfo) session.getAttribute("member");
		Long user_num = Info.getUser_num();
		Member dto = null;
		try {
			dto = service.findById(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("dto", dto);
		return ".four.mypage.profile";
	}

	@GetMapping("review")
	public String review(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.dataCount(map);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<TravelReview> list = service.listReview(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listReview");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);
		model.addAttribute("mode", "newest");

		return "mypage/review";
	}

	@GetMapping("reviewPast")
	public String reviewPast(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.dataCount(map);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<TravelReview> list = service.listPast(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listPast");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);
		model.addAttribute("mode", "oldest");
		return "mypage/review";
	}

	@GetMapping("replyPast")
	public String replyPast(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 10;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.replyCount(map);

		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<MyPage> list = service.listReplyPast(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listReplyPast");

		model.addAttribute("dataCount", dataCount);

		model.addAttribute("list", list);

		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);
		
		model.addAttribute("mode", "replyOldest");

		return "mypage/reply";
	}
	
	@GetMapping("reply")
	public String reply(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 10;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.replyCount(map);

		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<MyPage> list = service.listReply(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listReply");

		model.addAttribute("dataCount", dataCount);

		model.addAttribute("list", list);

		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);
		
		model.addAttribute("mode", "replyNewest");

		return "mypage/reply";
	}

	@PostMapping("mbtiUpdate")
	public String mbtiUpdate(Member dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		dto.setUser_num(info.getUser_num());

		try {
			service.updateMbti(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ".four.mypage.profile";
	}

	@GetMapping("profileUpdate")
	public String profileWrite(Member dto, HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto = service.findById(info.getUser_num());
		} catch (Exception e) {
			e.printStackTrace();
		}

		// System.out.println("진명아 확인할땐 이렇게하는거야 " + dto);
		model.addAttribute("dto", dto);

		return ".four.mypage.profileUpdate";
	}

	@PostMapping("profileUpdate")
	public String profileSubmit(Member dto, HttpSession session) {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "mypage";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		dto.setUser_num(info.getUser_num());

		try {
			service.updateProfile(dto, path);
			service.updateInfo(dto);
			service.updateMember(dto);

			dto = service.findById(info.getUser_num());
			info.setPhoto(dto.getPhoto());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/mypage/profile";
	}

	@PostMapping("deleteMember")
	public String deleteMember(HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Long user_num = info.getUser_num();

		try {
			service.deleteInfo(user_num);
			service.deleteMember(user_num);
			service.deleteProfile(user_num);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}

	@PostMapping("deleteReply")
	@ResponseBody
	public Map<String, String> deleteReply(@RequestParam String boardname, @RequestParam long reply_num) {

		System.out.println("데이터" + boardname);
		System.out.println("리플라이" + reply_num);
		Map<String, String> map = new HashMap<>();
		try {

			service.deleteReply(boardname, reply_num);
			map.put("status", "success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@GetMapping("wishList")
	public String wishList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "page2", defaultValue = "1") int current_page2,

			HttpSession session, Model model) {
		SessionInfo Info = (SessionInfo) session.getAttribute("member");
		Long user_num = Info.getUser_num();
		Member dto = null;
		try {
			dto = service.findById(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("dto", dto);
		return ".four.mypage.wishList";
	}

	@GetMapping("wishReview")
	public String wishReview(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 10;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.wishReviewCount(user_num);

		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<MyPage> list = service.listWishReview(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listWishReview");

		model.addAttribute("dataCount", dataCount);

		model.addAttribute("list", list);

		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/wishReview";
	}

	@GetMapping("wishInfo")
	public String wishInfo(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.wishInfoCount(user_num);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<Info> list = service.listWishInfo(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listWishInfo");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/wishInfo";
	}

	@GetMapping("wishCompanion")
	public String wishCompanion(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.wishCompanionCount(user_num);
		System.out.println(dataCount);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<Companion> list = service.listWishCompanion(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listWishInfo");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/wishCompanion";
	}

	@GetMapping("wishRoom")
	public String wishRoom(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.wishRoomCount(user_num);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<Room> list = service.listWishRoom(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listWishRoom");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/wishRoom";
	}

	@PostMapping("wishlist/remove")
	@ResponseBody
	public Map<String, Object> removeFromWishlist(@RequestParam("num") long num, @RequestParam String table_name,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			long user_num = info.getUser_num();
			service.removeFromWishlist(user_num, num, table_name); // 서비스 메소드 호출
			result.put("success", true);
		} catch (Exception e) {
			result.put("success", false);
			result.put("message", e.getMessage());
		}
		return result;
	}

	@GetMapping("myTrip")
	public String myTrip(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "page2", defaultValue = "1") int current_page2,

			HttpSession session, Model model) {

		SessionInfo Info = (SessionInfo) session.getAttribute("member");
		Long user_num = Info.getUser_num();
		Member dto = null;
		try {
			dto = service.findById(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("dto", dto);

		return ".four.mypage.myTrip";
	}

	@GetMapping("myRoom")
	public String myRoom(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Long user_num = info.getUser_num();

		Map<String, Object> map = new HashMap<>();
		map.put("user_num", user_num);

		Map<String, List<Room>> roomMap = service.listMyRoom(map);

		model.addAttribute("currentTrips", roomMap.get("currentTrips"));
		model.addAttribute("pastTrips", roomMap.get("pastTrips"));

		return "mypage/tripRoom";
	}

	@GetMapping("coupoint")
	public String coupoint(HttpSession session, Model model) {
		List<Coupon> Available_list = null;
		List<Coupon> Disabled_list = null;
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			service.updateCouponUse();
			Available_list = service.listCouponAvailable(info.getUser_num());
			Disabled_list = service.listCouponDisabled(info.getUser_num());
		} catch (Exception e) {
			e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
		}

		model.addAttribute("list1", Available_list);
		model.addAttribute("list2", Disabled_list);

		return ".four.mypage.coupoint";
	}

	@ResponseBody
	@PostMapping("addcoupon")
	public Map<String, Object> addCoupon(@RequestParam(value = "code") String code, HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Coupon dto = null;
		String state = "false";
		try {
			dto = service.findByCode(code);
			if (dto == null) {
				model.put("state", state);
				return model;
			}

			LocalDate now = LocalDate.now();
			String[] issue_date = dto.getIssue_date().split("-");
			String[] expiry_date = dto.getExpiry_date().split("-");
			LocalDate idate = LocalDate.of(Integer.parseInt(issue_date[0]), Integer.parseInt(issue_date[1]),
					Integer.parseInt(issue_date[2]));
			LocalDate edate = LocalDate.of(Integer.parseInt(expiry_date[0]), Integer.parseInt(expiry_date[1]),
					Integer.parseInt(expiry_date[2]));

			if (!idate.isBefore(now) || !edate.isAfter(now)) {
				model.put("state", state);
				return model;
			}

			map.put("num", dto.getNum());
			map.put("user_num", info.getUser_num());
			if (service.isUsedCoupon(map)) {
				state = "used";
				model.put("state", state);
				return model;
			}

			map.put("use_state", 1);

			service.addCoupon(map);
			state = "true";
		} catch (Exception e) {

		}
		model.put("state", state);
		return model;
	}

	@GetMapping("inquiReview")
	public String inquiReview() {
		return ".four.mypage.inquiReview";
	}

	@PostMapping("deleteQna")
	public String deleteQna(@RequestParam(value = "num") long num) {
		try {
			service.deleteQna(num);
		} catch (Exception e) {
		}
		return ".four.mypage.inquiReview";
	}

	@GetMapping("companion")
	public String companion(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "page2", defaultValue = "1") int current_page2,

			HttpSession session, Model model) {
		SessionInfo Info = (SessionInfo) session.getAttribute("member");
		Long user_num = Info.getUser_num();
		Member dto = null;
		try {
			dto = service.findById(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("dto", dto);

		return ".four.mypage.companion";
	}

	@GetMapping("waitingCompanion")
	public String waitingCompanion(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.waitingCompanionCount(user_num);
		System.out.println(dataCount);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<Companion> list = service.listWaitingCompanion(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listWaitingCompanion");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/waitingCompanion";
	}

	@GetMapping("ingcompanion")
	public String ingCompanion(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.ingCompanionCount(user_num);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<Companion> list = service.listIngCompanion(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listIngCompanion");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/ingCompanion";
	}

	@GetMapping("pastcompanion")
	public String pastCompanion(@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session, Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.pastCompanionCount(user_num);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<Companion> list = service.listPastCompanion(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listPastCompanion");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/pastCompanion";
	}

	@GetMapping("mycompanion")
	public String myCompanion(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.myCompanionCount(user_num);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<Companion> list = service.listMyCompanion(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listMyCompanion");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/myCompanion";
	}

	@PostMapping("/cancelReservation")
	@ResponseBody
	public String cancelReservation(@RequestParam("sale_num") long sale_num,
			@RequestParam("detail_num") long detail_num, @RequestParam("user_num") long user_num) {
		System.out.println("sale_num: " + sale_num + ", detail_num: " + detail_num + ", user_num: " + user_num); // 로그
																													// 추가
		Map<String, Object> params = new HashMap<>();
		params.put("sale_num", sale_num);
		params.put("detail_num", detail_num);
		params.put("user_num", user_num);

		try {
			service.deleteRoom(params);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@GetMapping("inquireview")
	public String myQnAList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "page2", defaultValue = "1") int current_page2,

			HttpSession session, Model model) {

		SessionInfo Info = (SessionInfo) session.getAttribute("member");
		Long user_num = Info.getUser_num();
		Member dto = null;
		try {
			dto = service.findById(user_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("dto", dto);
		return ".four.mypage.inquiReview";
	}

	@GetMapping("myQnA")
	public String myQnA(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.myRoomQnACount(user_num);
		int total_page = myUtil.pageCount(dataCount, size);
		if (total_page < current_page)
			current_page = total_page;
		int offset = (current_page - 1) * size;
		map.put("offset", offset);
		map.put("size", size);
		List<RoomQnA> list = service.myRoomQnA(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "myRoomQnA");

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		return "mypage/myRoomQnA";
	}

	@GetMapping("myReview")
	public String myReview(@RequestParam(value = "pageNo", defaultValue = "1") int current_page, HttpSession session,
			Model model) {

		Map<String, Object> map = new HashMap<>();
		int size = 9;
		int total_page;
		int dataCount = 0;

		SessionInfo Info = (SessionInfo) session.getAttribute("member");

		Long user_num = Info.getUser_num();

		map.put("user_num", user_num);

		dataCount = service.myTripCount(user_num);
		total_page = myUtil.pageCount(dataCount, size);

		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;

		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		List<RoomReview> list = service.myTripReview(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listMyReview");

		// 리뷰 통계 계산
		Map<String, Object> stats = service.calculateReviewStatistics(user_num);

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		model.addAttribute("pageNo", current_page);

		model.addAttribute("total_page", total_page);

		// 통계 데이터 추가
		model.addAttribute("averageScore", stats.get("averageScore"));
		model.addAttribute("reviewCount", stats.get("reviewCount"));
		model.addAttribute("ratingCount", stats.get("ratingCount"));

		return "mypage/myReview";
	}

	@PostMapping("token")
	public ResponseEntity<Map<String, Object>> getAccessToken() {
		Map<String, Object> response = new HashMap<>();
		try {
			RestTemplate restTemplate = new RestTemplate();
			String url = "https://api.iamport.kr/users/getToken";

			Map<String, String> body = new HashMap<>();
			body.put("imp_key", "7846183717363020"); // 포트원 API 키
			body.put("imp_secret", "ZV0MSr5pDwiDrchZaPzIJQl578nG28CJ9NOkTrcQVrlyGXxLKRhAzN6t3C7kO3aR7JPG6w2ibBAUbct0"); // 포트원
																														// API
																														// 시크릿

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);

			HttpEntity<Map<String, String>> entity = new HttpEntity<>(body, headers);
			ResponseEntity<Map> responseEntity = restTemplate.postForEntity(url, entity, Map.class);

			if (responseEntity.getStatusCode() != HttpStatus.OK) {
				throw new Exception("Failed to get access token: " + responseEntity.getStatusCode());
			}

			Map<String, Object> responseBody = responseEntity.getBody();

			if (responseBody == null || !responseBody.containsKey("response")) {
				throw new Exception("Failed to get access token: invalid response");
			}

			Map<String, String> responseData = (Map<String, String>) responseBody.get("response");
			response.put("state", "true");
			response.put("access_token", responseData.get("access_token"));
		} catch (Exception e) {
			response.put("state", "false");
			response.put("message", "Failed to get access token: " + e.getMessage());
		}
		return ResponseEntity.ok(response);
	}

	@PostMapping("cancel")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> cancelPayment(@RequestBody Map<String, Object> requestData) {
		String accessToken = (String) requestData.get("access_token");
		String imp_uid = (String) requestData.get("imp_uid");
		String reason = (String) requestData.get("reason");
		Integer refund_price = null;
		long sale_num = ((Integer) requestData.get("sale_num")).longValue();
		String card_num = (String) requestData.get("card_num");
		long user_num = Long.parseLong((String) requestData.get("user_num"));

		try {
			String final_price = (String) requestData.get("final_price");
			refund_price = Integer.parseInt(final_price);
			Map<String, Object> map = new HashMap<>();
			map.put("refund_reason", reason);
			map.put("sale_num", sale_num);
			map.put("refund_price", refund_price);
			map.put("card_num", card_num);
			map.put("user_num", user_num);
			RestTemplate restTemplate = new RestTemplate();
			String url = "https://api.iamport.kr/payments/cancel";
			rpservice.insertRefund(map);

			Map<String, Object> body = new HashMap<>();
			body.put("imp_uid", imp_uid);
			body.put("reason", reason);

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.set("Authorization", accessToken);

			HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
			ResponseEntity<Map> response = restTemplate.postForEntity(url, entity, Map.class);

			if (response.getStatusCode() == HttpStatus.OK) {
				Map<String, Object> responseBody = response.getBody();
				// 성공 처리
				Map<String, Object> successResponse = new HashMap<>();
				successResponse.put("state", "true");
				successResponse.put("response", responseBody);
				return ResponseEntity.ok().body(successResponse);
			} else {
				// 실패 처리
				throw new Exception("Failed to cancel payment: " + response.getStatusCode());
			}
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> errorResponse = new HashMap<>();
			errorResponse.put("state", "false");
			errorResponse.put("message", e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
		}

	}

}
