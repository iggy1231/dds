package com.fly.dds.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.fly.dds.admin.domain.MemberManage;
import com.fly.dds.admin.service.MemberManageService;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.domain.TravelReview;
import com.fly.dds.domain.TravelReviewReply;
import com.fly.dds.service.TravelReviewReplyService;
import com.fly.dds.service.TravelReviewService;

@Controller
@RequestMapping(value = "/travelreview/*")
public class TravelReviewController {
	@Autowired
	private TravelReviewService reviewService;

	@Autowired
	private MyUtil myUtil;

	@Autowired
	private TravelReviewReplyService replyService;
	
	@Autowired
	private MemberManageService mmservice;

	@RequestMapping("list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model , HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo) session.getAttribute("member");
		try {
			MemberManage dto2;
			dto2 = mmservice.checkBan(info.getUser_num());
		        if(dto2.getBan_state() == 1) {
		            session.invalidate();
		            model.addAttribute("dto2",dto2);
		            return "/member/login";
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = reviewService.dataCount(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<TravelReview> list = reviewService.listReview(map);
		String listUrl = "";

		String paging = myUtil.paging(current_page, total_page, listUrl);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".travelreview.list";
	}
	
	@RequestMapping("listHas")
	public String listHas(@RequestParam(value="region") String region,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("region", region);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = reviewService.dataHas(map);
		if (dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		// 글 리스트
		List<TravelReview> list = reviewService.listHas(map);
		String listUrl = "";

		String paging = myUtil.paging(current_page, total_page, listUrl);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".travelreview.list";
	}

	@GetMapping("create")
	public String createForm(Model model) {
		model.addAttribute("mode", "create");
		return ".travelreview.createPost";
	}

	@PostMapping("create")
	public String createReview(HttpSession session, @RequestParam String region_main, @RequestParam String region_sub,
			@RequestParam String subject, @RequestParam String content, @RequestParam List<MultipartFile> selectFile) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "travelreview";

		try {
			TravelReview dto = new TravelReview();

			dto.setRegion_main(region_main);
			dto.setRegion_sub(region_sub);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setSelectFile(selectFile);
			dto.setNickName(info.getNickName());
			dto.setUser_num(info.getUser_num());

			reviewService.reviewInsert(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/travelreview/list";
	}

	@GetMapping("article")
	public String article(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpSession session, Model model) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		reviewService.updateHitCount(num);

		// 해당 레코드 가져 오기
		TravelReview dto = reviewService.findByNum(num);
		if (dto == null) {
			return "redirect:/travelreview/list?" + query;
		}

		List<TravelReview> fileList = reviewService.listFile(num);

		// 댓글 목록 가져오기
		List<TravelReviewReply> replies = replyService.listReplies(num);
		if (replies == null) {
			return ".travelreview.list";
		}

		int likeCount = reviewService.likeCount(num);

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("fileList", fileList);
		model.addAttribute("replies", replies); // 댓글 목록 추가
		model.addAttribute("likeCount", likeCount);

		return ".travelreview.article";
	}

	@GetMapping("update")
	public String updateForm(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpSession session, Model model) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		TravelReview dto = reviewService.findByNum(num);
		if (dto == null) {
			return "redirect:/travelreview/list?" + query;
		}
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".travelreview.createPost";
	}

	@PostMapping("update")
	public String updateReview(@RequestParam long num, @RequestParam String subject, @RequestParam String content,
			@RequestParam String region_main, @RequestParam String region_sub,
			@RequestParam List<MultipartFile> selectFile, @RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "travelreview";

		try {
			TravelReview dto = new TravelReview();

			dto.setNum(num);
			dto.setRegion_main(region_main);
			dto.setRegion_sub(region_sub);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setSelectFile(selectFile);
			dto.setNickName(info.getNickName());
			dto.setUser_num(info.getUser_num());

			reviewService.updateReview(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/travelreview/article?num=" + num + "&" + query;
	}

	@GetMapping("delete")
	public String deleteReview(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpSession session, Model model) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		try {
			reviewService.deleteReview(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/travelreview/list?" + query;
	}

	@PostMapping("insertReply")
	public String insertReply(TravelReviewReply reply, @RequestParam String page, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			reply.setNickName(info.getNickName());
			reply.setUserNum(info.getUser_num());

			replyService.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/travelreview/article?num=" + reply.getNum() + "&page=" + page;
	}

	@GetMapping("deleteReply")
	public String deleteReply(@RequestParam long replyNum, @RequestParam long num, @RequestParam String page) {

		try {
			// 사용자가 이 댓글을 삭제할 권한이 있는지 확인하는 로직을 구현할 수 있습니다.

			// 서비스 메소드를 호출하여 댓글을 삭제합니다.
			replyService.deleteReply(replyNum);

		} catch (Exception e) {
			e.printStackTrace(); // 디버깅을 위해 예외를 출력합니다.
		}

		// 해당하는 게시글 페이지로 리다이렉트하며 필요한 파라미터를 함께 전달합니다.
		return "redirect:/travelreview/article?num=" + num + "&page=" + page;
	}

	@ResponseBody
	@PostMapping("TravelReview_Like")
	public Map<String, Object> TravelReview_Like(@RequestParam long num, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "false";
		int likeCount = reviewService.likeCount(num);

		try {
			map.put("num", num);
			map.put("user_num", info.getUser_num());

			if (!reviewService.isBoardLike(map)) {
				state = "liked";
				model.put("state", state);
				model.put("likeCount", likeCount);
			} else {
				reviewService.TravelReview_Like(map);
				state = "true";
				likeCount = reviewService.likeCount(num);
				model.put("state", state);
				model.put("likeCount", likeCount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}

	@PostMapping("insertReReply")
	public String insertReReply(TravelReviewReply reply, @RequestParam String page, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			reply.setNickName(info.getNickName());
			reply.setUserNum(info.getUser_num());

			replyService.insertReReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/travelreview/article?num=" + reply.getNum() + "&page=" + page;
	}
	
	
	@ResponseBody
	@PostMapping("reportReply")
	public Map<String, Object> travelreviewReplyReport(@RequestParam(value="article_num") long article_num,
			@RequestParam(value="user_num") long user_num,
			@RequestParam(value="reason") String reason,
			HttpSession session) {
		
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		Map<String, Object> model=new HashMap<String, Object>();
		String state="false";
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("article_num", article_num);
			map.put("user_num", user_num);
			map.put("reporter_num", info.getUser_num());
			if(replyService.isReplyReported(map)) {
				state="reported";
				model.put("state", state);
				return model;
			}
			map.put("reason", reason);
			replyService.reportReply(map);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("state", state);
		return model;
	}
	
	@ResponseBody
	@PostMapping("reportReview")
	public Map<String, Object> travelreviewReport(@RequestParam(value="article_num") long article_num,
			@RequestParam(value="user_num") long user_num,
			@RequestParam(value="reason") String reason,
			HttpSession session) {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		Map<String, Object> model=new HashMap<String, Object>();
		String state="false";
		
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("article_num", article_num);
			map.put("user_num", user_num);
			map.put("reporter_num", info.getUser_num());
			if(reviewService.isReviewReported(map)) {
				state="reported";
				model.put("state", state);
				return model;
			}
			map.put("reason", reason);
			reviewService.reportReview(map);
			state="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("state", state);
		return model;
	}
}
