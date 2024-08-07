package com.fly.dds;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.dds.domain.Companion;
import com.fly.dds.domain.Home;
import com.fly.dds.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired
    private HomeService homeService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		// 필요한 파라미터를 설정 (여기서는 빈 맵 사용)
        Map<String, Object> map = new HashMap<>();
        
       // HomeService를 통해 데이터를 가져옴
        List<Home> topRatedRooms = homeService.homeRoom(map);
        
        // 모델에 데이터를 추가
        model.addAttribute("topRatedRooms", topRatedRooms);
        
     // HomeService를 통해 동행 데이터를 가져옴
        int offset = 0; // 필요한 경우 적절히 설정
        int size = 5; // 필요한 경우 적절히 설정
        map.put("offset", offset);
        map.put("size", size);
        List<Companion> companions = homeService.homeCompanion(map);
        model.addAttribute("companions", companions);
        
		return ".home";
	}
}
