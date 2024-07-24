package com.fly.dds.controller;

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

import com.fly.dds.common.FileManager;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomPayment;
import com.fly.dds.domain.RoomQnA;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.service.MyPageService;
import com.fly.dds.service.RoomQnAService;
import com.fly.dds.service.RoomService;

@Controller
@RequestMapping(value = "/room/*")
public class RoomController {
	@Autowired
	private RoomService service;
	
	@Autowired
	private RoomQnAService qnaService;
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@GetMapping("main")
	public String roomMain() {
		return ".room.main";
	}
	
	@RequestMapping("article")
	public String roomArticle(@RequestParam long num,
            @RequestParam String page,
            @RequestParam(defaultValue = "") String kwd,
            HttpSession session,
            @RequestParam String sdate,
	        @RequestParam String edate,
            Model model) throws Exception {
        
        kwd = URLDecoder.decode(kwd, "utf-8");

        String query = "page=" + page;
        if (kwd.length() != 0) {
            query += 
                    "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
        }

        // 해당 레코드 가져 오기
        Room dto = service.findByNum(num);
        if (dto == null) {
            return "redirect:/room/list?" + query;
        }
        
        // 상세정보 출력
        Map<String, Object> map = new HashMap<>();
        map.put("num", num);
        List<Room> detail = service.listDetail(map);
        
        // 사진 출력
        List<Room> photo = service.listPhoto(map);
        
        
        model.addAttribute("detail" , detail);
        model.addAttribute("photo" , photo);
        model.addAttribute("dto", dto);
        model.addAttribute("page", page);
        model.addAttribute("kwd", kwd);
        model.addAttribute("sdate", sdate);
        model.addAttribute("edate", edate);
        model.addAttribute("query", query);
        
       
        return ".room.article";
    }
	

	@RequestMapping("list")
	public String list(
	        @RequestParam(value = "page", defaultValue = "1") int current_page,
	        @RequestParam String kwd,
	        @RequestParam String sdate,
	        @RequestParam String edate,
	        @RequestParam int people,
	        
	        HttpServletRequest req,
	        Model model) throws Exception {
	    
	    if(req.getMethod().equalsIgnoreCase("GET")) {
	        kwd = URLDecoder.decode(kwd, "UTF-8");
	    }
	    
	    int size = 10;
	    int total_page;
	    int dataCount;
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("kwd", kwd);
	    map.put("sdate", java.sql.Date.valueOf(sdate));
	    map.put("edate", java.sql.Date.valueOf(edate));
	    map.put("people", people);

	    dataCount = service.dataCount(map);
	    total_page = myUtil.pageCount(dataCount, size);
	    
	    // total_page = dataCount != 0 ? myUtil.pageCount(size, dataCount) : 0;
	    if(total_page < current_page) current_page = total_page;
	    
	    int offset = (current_page - 1) * size;
	    map.put("offset", offset);
	    map.put("size", size);
	    List<Room> list = service.listRoom(map);
	    
	    StringBuilder query = new StringBuilder();
	    boolean queryStarted = false;
	    
	    if (!kwd.isEmpty()) {
	        query.append("kwd=").append(URLEncoder.encode(kwd, "UTF-8"));
	        queryStarted = true;
	    }
	    if (sdate != null && !sdate.isEmpty()) {
	        if (queryStarted) query.append("&");
	        query.append("sdate=").append(sdate);
	        queryStarted = true;
	    }
	    if (edate != null && !edate.isEmpty()) {
	        if (queryStarted) query.append("&");
	        query.append("edate=").append(edate);
	        queryStarted = true;
	    }
	    if (people > 0) {
	        if (queryStarted) query.append("&");
	        query.append("people=").append(people);
	    }
	    
	    String listUrl = req.getContextPath() + "/dds/list";
	    if (query.length() > 0) {
	        listUrl += "?" + query.toString();
	    }
	    
	    String paging = myUtil.pagingUrl(current_page, total_page, listUrl);
	    
	    model.addAttribute("list", list);
	    model.addAttribute("listUrl", listUrl);
	    model.addAttribute("page", current_page);
	    model.addAttribute("kwd", kwd);
	    model.addAttribute("sdate", sdate);
	    model.addAttribute("edate", edate);
	    model.addAttribute("people", people);
	    model.addAttribute("total_page", total_page);
	    model.addAttribute("dataCount", dataCount);
	    model.addAttribute("paging", paging);
	    
	    return ".room.list";
	}


	
	@GetMapping("review")
	public String roomReview() {
		return "room/review";
	}
	
	@PostMapping("writeQnA")
	public String writeQnA(RoomQnA qna, HttpSession session, Model model) {
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        qna.setUserName(info.getUserName());
	        qna.setUserNum(info.getUser_num());
	        
	        if (qna.getNum() == 0) {
	            // 에러 메시지를 설정하고 폼을 다시 표시하도록 처리
	            model.addAttribute("message", "상품 번호가 필요합니다.");
	            return ".room.article"; // 폼으로 다시 돌아가도록 설정
	        }

	        qnaService.insertQnA(qna);
	        System.out.println("확인 " + qna.getNum());
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("message", "문의 등록 중 오류가 발생했습니다.");
	        return ".room.article";
	    }
	    return "redirect:/room/article?num=" + qna.getNum() + "&page=1";
	}
	
	@ResponseBody
	@GetMapping("qnalist")
	public Map<String, Object> listQnA(
	        @RequestParam long num,
	        @RequestParam(value = "page", defaultValue = "1") int current_page,
	        HttpSession session) throws Exception {
	    SessionInfo info = (SessionInfo)session.getAttribute("member");
	    
	    Map<String, Object> model = new HashMap<>();
	    
	    try {
	        Map<String, Object> map = new HashMap<>();
	        
	        int size = 5;
	        int dataCount = 0;
	        
	        map.put("num", num);
	        
	        dataCount = qnaService.dataCount(map);
	        int total_page = myUtil.pageCount(dataCount, size);
	        if (current_page > total_page) {
	            current_page = total_page;
	        }

	        int offset = (current_page - 1) * size;
	        if(offset < 0) offset = 0;

	        map.put("offset", offset);
	        map.put("size", size);

	        List<RoomQnA> list = qnaService.listQnA(map);
	        for(RoomQnA dto : list) {
	            if(dto.getAnonymous() == 1 && (info == null || (info.getActivity()) < 50 && dto.getUserNum() != info.getUser_num())) {
	                dto.setContent("비밀글 입니다. <i class='bi bi-file-lock2'></i>");
	                dto.setAnswer("");
	            }
	        }
	        
	        String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");
	        
	        model.put("list", list);
	        model.put("dataCount", dataCount);
	        model.put("size", size);
	        model.put("page", current_page);
	        model.put("paging", paging);
	        model.put("total_page", total_page);
	        
	        // System.out.println("QnA List: " + list);
	        // System.out.println("Paging: " + paging);
	        // System.out.println("Data Count: " + dataCount);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return model;
	}
	
	/*
	@GetMapping("payment") 
	public String roomPayment(
			@RequestParam long detail_num,
	        @RequestParam String sdate,
	        @RequestParam String edate,
	        HttpSession session,
	        Model model) throws Exception {
	    
	    try {
	        // 해당 레코드 가져 오기
	    	Room dto = service.findByDetail(detail_num);
	        SessionInfo info = (SessionInfo)session.getAttribute("member");
	       
	        
	        Member member = null;
	        String tel;
	        
	        member = myPageService.findById(info.getUser_num());
	        tel = member.getTel();
	       
	        
	        // 상세정보 출력
	        Map<String, Object> map = new HashMap<>();
	        
	        model.addAttribute("dto", dto);
	        
	       //  System.out.println("테스터 : " + dto + sdate + edate + people + detail_num + photo);
	        
	        // 추가된 정보
	        model.addAttribute("sdate", sdate);
	        model.addAttribute("edate", edate);
	        model.addAttribute("detail_num", detail_num);
	        model.addAttribute("tel",tel);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return ".room.payment";
	}
	*/
	
	@GetMapping("payment") 
	public String roomPayment(
			@RequestParam long detail_num,
			@RequestParam String sdate,
			@RequestParam String edate,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			// 해당 레코드 가져 오기
			Room dto = service.findByDetail(detail_num);
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			
			Member member = null;
			String tel;
			
			member = myPageService.findById(info.getUser_num());
			tel = member.getTel();
			
			
			// 상세정보 출력
			Map<String, Object> map = new HashMap<>();
			
			model.addAttribute("dto", dto);
			
			//  System.out.println("테스터 : " + dto + sdate + edate + people + detail_num + photo);
			
			// 추가된 정보
			model.addAttribute("sdate", sdate);
			model.addAttribute("edate", edate);
			model.addAttribute("detail_num", detail_num);
			model.addAttribute("tel",tel);
			
			// 계산
			int total_price = dto.getPrice(); // 객실 가격
			/// int coupon_price = d
			int point_price = (int) (total_price * 0.05); // 적립된 포인트가
			// int final_price = total_price - point_price;
			// int dicount = point_price;
			
			// 결제 정보 저장
			// RoomPayment roomPayment = new RoomPayment();
			//   roomSale.setRegDate(LocalDate.now()); ... 등으로 저장
			
			model.addAttribute("total_price",total_price );
			model.addAttribute("point_price", point_price );
			// model.addAttribute("final_price",final_price );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".room.payment";
	}

	
	
}
