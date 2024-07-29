package com.fly.dds.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.dds.common.FileManager;
import com.fly.dds.common.MyUtil;
import com.fly.dds.domain.Member;
import com.fly.dds.domain.Room;
import com.fly.dds.domain.RoomPayment;
import com.fly.dds.domain.RoomQnA;
import com.fly.dds.domain.RoomReview;
import com.fly.dds.domain.SessionInfo;
import com.fly.dds.domain.Summary;
import com.fly.dds.service.MyPageService;
import com.fly.dds.service.RoomPaymentService;
import com.fly.dds.service.RoomQnAService;
import com.fly.dds.service.RoomReviewService;
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
	private RoomPaymentService paymentService;
	
	@Autowired
	private RoomReviewService reviewService;
	
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
            @RequestParam(defaultValue="1") String page,
            @RequestParam(defaultValue="2") String people,
            @RequestParam(defaultValue = "") String kwd,
            HttpSession session,
            @RequestParam String sdate,
	        @RequestParam String edate,
            Model model) throws Exception {
        SessionInfo info=(SessionInfo) session.getAttribute("member");
        
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
        
        map.put("user_num", info.getUser_num());
        
        String liked="false";
        if(service.isLiked(map)) {
        	liked="true";
        }
        
        model.addAttribute("liked", liked);
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
	        @RequestParam(defaultValue="popular") String sort,
	        @RequestParam(defaultValue="all") String roomType,
	        @RequestParam(defaultValue="priceType1") String priceType,
	        @RequestParam(defaultValue="") String[] keywords,
	        @RequestParam(defaultValue="") String[] facilities,
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
	    
	    map.put("roomType", roomType);
	    map.put("priceType", priceType);
	    map.put("keywords", keywords);
	    map.put("facilities", facilities);
	    map.put("sort", sort);
	    
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
	    model.addAttribute("sort", sort);
	    model.addAttribute("roomType", roomType);
	    model.addAttribute("priceType", priceType);
	    
	    if(keywords.length!=0) {
	    	model.addAttribute("keywords", Arrays.toString(keywords));
	    } else {
	    	model.addAttribute("keywords", keywords);
	    }
	    
	    if(keywords.length!=0) {
	    	model.addAttribute("facilities", Arrays.toString(facilities));
	    } else {
	    	model.addAttribute("facilities", facilities);
	    }

	    return ".room.list";
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
	
	@PostMapping("insertWishList")
	public String insertWishList(
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam String sdate,
			@RequestParam String edate,
			HttpSession session
			) {
		 SessionInfo info = (SessionInfo)session.getAttribute("member");
		    
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("user_num", info.getUser_num());
		 map.put("num", num);
		 try {
			
			 service.insertRoomWishList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 return "redirect:/room/article?num="+num+"&page="+page+"&sdate="+sdate+"&edate="+edate;
	}
	
	
	@GetMapping("payment") 
	public String roomPayment(
			@RequestParam long detail_num,
			@RequestParam String sdate,
			@RequestParam String edate,
			HttpSession session,
			Model model) throws Exception {
		
		try {
			long sale_num = paymentService.payMentSeq();
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
			
			model.addAttribute("sale_num",sale_num);
			model.addAttribute("total_price",total_price );
			model.addAttribute("point_price", point_price );
			// model.addAttribute("final_price",final_price );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".room.payment";
	}
	
	@PostMapping("insertPayment")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> insertPayment(
			@RequestBody RoomPayment paymentData
			){
		Map<String, Object> response = new HashMap<>();
		try {
			paymentService.insertPayment(paymentData);
			response.put("success", true);
			response.put("sale_num", paymentData.getSale_num());
			paymentService.insertCardData(paymentData);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("fail", false);
		}
		return ResponseEntity.ok(response);
		
	}
	
	@PostMapping("payComplete")
	@ResponseBody
	public Map<String, Object> payComplete(@RequestBody RoomPayment dto, HttpServletRequest request) {
	    Map<String, Object> response = new HashMap<>();

	    try {
	        String redirectUrl = String.format("%s/room/payComplete?sale_num=%d&name=%s&final_price=%d&total_price=%d&subject=%s&card_name=%s",
	                request.getContextPath(),
	                dto.getSale_num(),
	                URLEncoder.encode(dto.getName(), "UTF-8"),
	                dto.getFinal_price(),
	                dto.getTotal_price(),
	                URLEncoder.encode(dto.getSubject(), "UTF-8"),
	                URLEncoder.encode(dto.getCard_name(), "UTF-8"),
	                URLEncoder.encode(dto.getCard_num(), "UTF-8")
	        );

	        response.put("success", true);
	        response.put("redirectUrl", redirectUrl);
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "결제 처리 중 오류가 발생했습니다.");
	    }

	    return response;
	}
	
	@GetMapping("payComplete")
	public String payCompletePage(@RequestParam Map<String, String> params, Model model) {
	    model.addAllAttributes(params);
	    return ".room.payComplete";
	}

	
	
	// 리뷰 등록 - ajax
	@PostMapping("reviewWrite")
	@ResponseBody
	public Map<String, Object> writeReviewSubmit(RoomReview dto, HttpSession session) throws Exception {
	    Map<String, Object> map = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    dto.setUser_num(info.getUser_num());

	    try {
	        String root = session.getServletContext().getRealPath("/");
	        String pathname = root + "uploads" + File.separator + "roomReview";

	        // 파일 업로드 처리
	        if (dto.getPhotoFile() != null && !dto.getPhotoFile().isEmpty()) {
	            String filename = fileManager.doFileUpload(dto.getPhotoFile(), pathname);
	            dto.setPhoto(filename);
	        }

	        reviewService.insertRoomReview(dto, pathname);
	        map.put("state", "true");
	    } catch (Exception e) {
	        e.printStackTrace();
	        map.put("state", "false");
	    }

	    return map;
	}



	
	@ResponseBody
	@GetMapping("reviewlist")
	public Map<String, Object> list(
			@RequestParam long num,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			
			map.put("num", num);
			Summary summary = reviewService.findByRoomReviewSummary(map);
			
			if(summary == null) {
				return model;
			}
			
			dataCount = summary.getCount();
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;
			
			
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<RoomReview> list = reviewService.listRoomReview(map);
			if(info != null) {
				for(RoomReview dto : list) {
					if(info.getUser_num() == info.getUser_num()) {
						dto.setDeletePermit(true);
					}
				}
			}
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listRoomReview");
			
			model.put("list", list);
			
			model.put("summary", summary);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
			
		} catch (Exception e) {
			
		}
		
		return model;
	}
	
}
