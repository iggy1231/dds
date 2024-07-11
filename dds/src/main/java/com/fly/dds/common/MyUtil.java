package com.fly.dds.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections.map.HashedMap;

public abstract class MyUtil {
	/**
	* 전체 페이지수를 구하는 메소드
	* 
	* @param dataCount		총 데이터 개수
	* @param size			한 화면에 출력할 데이터 개수
	* @return				총 페이지 수
	*/
	public int pageCount(int dataCount, int size) {
		if(dataCount <= 0) {
			return 0;
		}
	
		return dataCount / size + (dataCount % size > 0 ? 1 : 0);
	}
	
	/**
	 * 페이징(paging) 처리를 하는 메소드(GET 방식, a 태그를 이용하여 해당 페이지의 URL로 이동)
	 * 
	 * @param current_page	화면에 출력할 페이지 번호
	 * @param total_page	총 페이지 수
	 * @param list_url		페이지 번호에 link를 설정할 URL
	 * @return				페이징 처리 결과
	 */
	public abstract String paging(int current_page, int total_page, String list_url);

	/**
	 * javascript를 이용하여 페이징 처리를하는 메소드 : javascript의 지정한 함수(methodName)를 호출
	 * 
	 * @param current_page	화면에 출력할 페이지 번호
	 * @param total_page	총 페이지 수
	 * @param methodName	호출할 자바스크립트 함수명
	 * @return				페이징 처리 결과
	 */
    public abstract String pagingMethod(int current_page, int total_page, String methodName);

	public abstract String pagingUrl(int current_page, int total_page, String list_url);
	public abstract String pagingFunc(int current_page, int total_page, String methodName);
    
	/**
	* 문자열에서 HTML 태그를 제거하는 메소드
	* 
	* @param str		HTML 태그를 제거할 문자열
	* @return			HTML 태그가 제거된 문자열
	*/
	public String removeHtmlTag(String str) {
		if(str == null || str.length() == 0) {
			return "";
		}

		String regex = "<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>";
		String result = str.replaceAll(regex, "");
		
		return result;
    }

	/**
	* HTML 문서에서 img 태그의 src 속성값을 추출하는 메소드
	* 
	* @param html		html 문자열
	* @return			추출된 src 속성값을 가지고 있는 List 객체 
	*/
	public List<String> getImgSrc(String html) {
		List<String> result = new ArrayList<String>();
		
		if(html == null || html.length() == 0) {
			return result;
		}

		String regex = "<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>";
		Pattern nonValidPattern = Pattern.compile(regex);

		Matcher matcher = nonValidPattern.matcher(html);
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		
		return result;
    }

	/**
	* 특수 문자를 HTML 문자로 변경 및 엔터를 <br>로 변경 하는 메소드
	* 
	* @param str		특수 문자를 HTML 문자로 변경할 문자열
	* @return			특수 문자가 HTML 문자로 변경된 문자열
	*/
	public String htmlSymbols(String str) {
		if(str == null || str.length() == 0) {
			return "";
		}

		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("<", "&lt;");
    	 
		str = str.replaceAll(" ", "&nbsp;"); // \\s를 사용할 경우 \n 아래에서 사용해야 한다.
		str = str.replaceAll("\n", "<br>");
    	 
		return str;
	}
     
	/**
	* 중간 이름 마스킹 처리
	* @param userName		이름
	* @return				마스킹 처리된 이름
	*/
	public String nameMasking(String userName) {
		String result = "";
    	 
		try {
			userName = userName.replaceAll("\\s", "");
			
			if(userName.length() < 2) {
				return userName;
			}
        	 
			String firstName, midName, lastName, s;
        	 
			firstName = userName.substring(0, 1); // 성
			midName = "";
			if(userName.length() > 2) {
				midName = userName.substring(1, userName.length()-1); // 중간이름
			}
			s = "";
			for(int i = 0; i<midName.length(); i++) {
				s += "*";
			}
			if(userName.length() > 2) {
				lastName = userName.substring(userName.length()-1, userName.length()); // 마지막 글자
			} else {
				lastName = "*";
			}

			result = firstName + s + lastName;
		} catch (Exception e) {
		}
    	 
		return result;
	}

	/**
	* 정규식을 이용하여 E-Mail을 검사하는 메소드
	* 
	* @param email		검사할 E-Mail
	* @return			올바른 E-Mail 이지의 여부
	*/
	public boolean isValidEmail(String email) {
		if (email == null) return false;
		
		boolean b = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", 
						email.trim());
		return b;
	}
	
	public Map<String, Object> areaCode(int areaCode, int sigunguCode) {
		Map<String, Object> map=new HashMap<String, Object>();
		
		switch (areaCode) {
			case 1: {
				map.put("areaCode", "서울");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "강남구"); break;
					case 2: map.put("sigunguCode", "강동국"); break;
					case 3: map.put("sigunguCode", "강북구"); break;
					case 4: map.put("sigunguCode", "강서구"); break;
					case 5: map.put("sigunguCode", "관악구"); break;
					case 6: map.put("sigunguCode", "광진구"); break;
					case 7: map.put("sigunguCode", "구로구"); break;
					case 8: map.put("sigunguCode", "금천구"); break;
					case 9: map.put("sigunguCode", "노원구"); break;
					case 10: map.put("sigunguCode", "도봉구"); break;
					case 11: map.put("sigunguCode", "동대문구"); break;
					case 12: map.put("sigunguCode", "동작구"); break;
					case 13: map.put("sigunguCode", "마포구"); break;
					case 14: map.put("sigunguCode", "서대문구"); break;
					case 15: map.put("sigunguCode", "서초구"); break;
					case 16: map.put("sigunguCode", "성동구"); break;
					case 17: map.put("sigunguCode", "성북구"); break;
					case 18: map.put("sigunguCode", "송파구"); break;
					case 19: map.put("sigunguCode", "양천구"); break;
					case 20: map.put("sigunguCode", "영등포구"); break;
					case 21: map.put("sigunguCode", "용산구"); break;
					case 22: map.put("sigunguCode", "은평구"); break;
					case 23: map.put("sigunguCode", "종로구"); break;
					case 24: map.put("sigunguCode", "중구"); break;
					case 25: map.put("sigunguCode", "중랑구"); break;
				} break;
			}
			case 2: {
				map.put("areaCode", "인천");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "강화군"); break;
					case 2: map.put("sigunguCode", "계양구"); break;
					case 3: map.put("sigunguCode", "미추홀구"); break;
					case 4: map.put("sigunguCode", "남동구"); break;
					case 5: map.put("sigunguCode", "동구"); break;
					case 6: map.put("sigunguCode", "부평구"); break;
					case 7: map.put("sigunguCode", "서구"); break;
					case 8: map.put("sigunguCode", "연수구"); break;
					case 9: map.put("sigunguCode", "옹진군"); break;
					case 10: map.put("sigunguCode", "중구"); break;
				} break;
			}
			case 3: {
				map.put("areaCode", "대전");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "대덕구"); break;
					case 2: map.put("sigunguCode", "동구"); break;
					case 3: map.put("sigunguCode", "서구"); break;
					case 4: map.put("sigunguCode", "유성구"); break;
					case 5: map.put("sigunguCode", "중구"); break;
				} break;
			}
			case 4: {
				map.put("areaCode", "대구");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "남구"); break;
					case 2: map.put("sigunguCode", "달서구"); break;
					case 3: map.put("sigunguCode", "달성군"); break;
					case 4: map.put("sigunguCode", "동구"); break;
					case 5: map.put("sigunguCode", "북구"); break;
					case 6: map.put("sigunguCode", "서구"); break;
					case 7: map.put("sigunguCode", "수성구"); break;
					case 8: map.put("sigunguCode", "중구"); break;
					case 9: map.put("sigunguCode", "군위군"); break;
				} break;
			}
			case 5: {
				map.put("areaCode", "광주");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "광산구"); break;
					case 2: map.put("sigunguCode", "남구"); break;
					case 3: map.put("sigunguCode", "동구"); break;
					case 4: map.put("sigunguCode", "북구"); break;
					case 5: map.put("sigunguCode", "서구"); break;
				} break;
			}
			case 6: {
				map.put("areaCode", "부산");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "강서구"); break;
					case 2: map.put("sigunguCode", "금정구"); break;
					case 3: map.put("sigunguCode", "기장군"); break;
					case 4: map.put("sigunguCode", "남구"); break;
					case 5: map.put("sigunguCode", "동구"); break;
					case 6: map.put("sigunguCode", "동래구"); break;
					case 7: map.put("sigunguCode", "부산진구"); break;
					case 8: map.put("sigunguCode", "북구"); break;
					case 9: map.put("sigunguCode", "사상구"); break;
					case 10: map.put("sigunguCode", "사하구"); break;
					case 11: map.put("sigunguCode", "서구"); break;
					case 12: map.put("sigunguCode", "수영구"); break;
					case 13: map.put("sigunguCode", "연제구"); break;
					case 14: map.put("sigunguCode", "영도구"); break;
					case 15: map.put("sigunguCode", "중구"); break;
					case 16: map.put("sigunguCode", "해운대구"); break;
				} break;
			}
			case 7: {
				map.put("areaCode", "울산");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "중구"); break;
					case 2: map.put("sigunguCode", "남구"); break;
					case 3: map.put("sigunguCode", "동구"); break;
					case 4: map.put("sigunguCode", "북구"); break;
					case 5: map.put("sigunguCode", "을주군"); break;
				} break;
			}
			case 8: {
				map.put("areaCode", "세종");
				map.put("sigunguCode", "세종시");
				break;
			}
			case 31: {
				map.put("areaCode", "경기도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "가평군"); break;
					case 2: map.put("sigunguCode", "고양시"); break;
					case 3: map.put("sigunguCode", "과천시"); break;
					case 4: map.put("sigunguCode", "광명시"); break;
					case 5: map.put("sigunguCode", "광주시"); break;
					case 6: map.put("sigunguCode", "구리시"); break;
					case 7: map.put("sigunguCode", "군포시"); break;
					case 8: map.put("sigunguCode", "김포시"); break;
					case 9: map.put("sigunguCode", "남양주시"); break;
					case 10: map.put("sigunguCode", "동두천시"); break;
					case 11: map.put("sigunguCode", "부천시"); break;
					case 12: map.put("sigunguCode", "성남시"); break;
					case 13: map.put("sigunguCode", "수원시"); break;
					case 14: map.put("sigunguCode", "시흥시"); break;
					case 15: map.put("sigunguCode", "안산시"); break;
					case 16: map.put("sigunguCode", "안성시"); break;
					case 17: map.put("sigunguCode", "안양시"); break;
					case 18: map.put("sigunguCode", "양주시"); break;
					case 19: map.put("sigunguCode", "양평군"); break;
					case 20: map.put("sigunguCode", "여주시"); break;
					case 21: map.put("sigunguCode", "연천군"); break;
					case 22: map.put("sigunguCode", "오산시"); break;
					case 23: map.put("sigunguCode", "용인시"); break;
					case 24: map.put("sigunguCode", "의왕시"); break;
					case 25: map.put("sigunguCode", "의정부시"); break;
					case 26: map.put("sigunguCode", "이천시"); break;
					case 27: map.put("sigunguCode", "파주시"); break;
					case 28: map.put("sigunguCode", "평택시"); break;
					case 29: map.put("sigunguCode", "포천시"); break;
					case 30: map.put("sigunguCode", "하남시"); break;
					case 31: map.put("sigunguCode", "화성시"); break;
				} break;
			}
			case 32: {
				map.put("areaCode", "강원도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "강릉시"); break;
					case 2: map.put("sigunguCode", "고성군"); break;
					case 3: map.put("sigunguCode", "동해시"); break;
					case 4: map.put("sigunguCode", "삼척시"); break;
					case 5: map.put("sigunguCode", "속초시"); break;
					case 6: map.put("sigunguCode", "양구군"); break;
					case 7: map.put("sigunguCode", "양양군"); break;
					case 8: map.put("sigunguCode", "영월군"); break;
					case 9: map.put("sigunguCode", "원주시"); break;
					case 10: map.put("sigunguCode", "인제군"); break;
					case 11: map.put("sigunguCode", "정선군"); break;
					case 12: map.put("sigunguCode", "철원군"); break;
					case 13: map.put("sigunguCode", "춘천시"); break;
					case 14: map.put("sigunguCode", "태백시"); break;
					case 15: map.put("sigunguCode", "평창군"); break;
					case 16: map.put("sigunguCode", "홍천군"); break;
					case 17: map.put("sigunguCode", "화천군"); break;
					case 18: map.put("sigunguCode", "황성군"); break;
				} break;
			}
			case 33: {
				map.put("areaCode", "충청북도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "괴산군"); break;
					case 2: map.put("sigunguCode", "단양군"); break;
					case 3: map.put("sigunguCode", "보은군"); break;
					case 4: map.put("sigunguCode", "영동군"); break;
					case 5: map.put("sigunguCode", "옥천군"); break;
					case 6: map.put("sigunguCode", "음성군"); break;
					case 7: map.put("sigunguCode", "제천시"); break;
					case 8: map.put("sigunguCode", "진천군"); break;
					case 9: map.put("sigunguCode", "청원군"); break;
					case 10: map.put("sigunguCode", "청주시"); break;
					case 11: map.put("sigunguCode", "충주시"); break;
					case 12: map.put("sigunguCode", "증평군"); break;
				} break;
			}
			case 34: {
				map.put("areaCode", "충청남도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "공주시"); break;
					case 2: map.put("sigunguCode", "금산군"); break;
					case 3: map.put("sigunguCode", "논산시"); break;
					case 4: map.put("sigunguCode", "당진시"); break;
					case 5: map.put("sigunguCode", "보령시"); break;
					case 6: map.put("sigunguCode", "부여군"); break;
					case 7: map.put("sigunguCode", "서산시"); break;
					case 8: map.put("sigunguCode", "서천군"); break;
					case 9: map.put("sigunguCode", "아산시"); break;
					case 11: map.put("sigunguCode", "예산군"); break;
					case 12: map.put("sigunguCode", "천안시"); break;
					case 13: map.put("sigunguCode", "청양군"); break;
					case 14: map.put("sigunguCode", "태안군"); break;
					case 15: map.put("sigunguCode", "홍성군"); break;
					case 16: map.put("sigunguCode", "계룡시"); break;
				} break;
			}
			case 35: {
				map.put("areaCode", "경상북도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "경산시"); break;
					case 2: map.put("sigunguCode", "경주시"); break;
					case 3: map.put("sigunguCode", "고령군"); break;
					case 4: map.put("sigunguCode", "구미시"); break;
					case 6: map.put("sigunguCode", "김천시"); break;
					case 7: map.put("sigunguCode", "문경시"); break;
					case 8: map.put("sigunguCode", "봉화군"); break;
					case 9: map.put("sigunguCode", "상주시"); break;
					case 10: map.put("sigunguCode", "성주군"); break;
					case 11: map.put("sigunguCode", "안동시"); break;
					case 12: map.put("sigunguCode", "영덕군"); break;
					case 13: map.put("sigunguCode", "영양군"); break;
					case 14: map.put("sigunguCode", "영주시"); break;
					case 15: map.put("sigunguCode", "영천시"); break;
					case 16: map.put("sigunguCode", "예천군"); break;
					case 17: map.put("sigunguCode", "울릉군"); break;
					case 18: map.put("sigunguCode", "울진군"); break;
					case 19: map.put("sigunguCode", "의성군"); break;
					case 20: map.put("sigunguCode", "청도군"); break;
					case 21: map.put("sigunguCode", "청송군"); break;
					case 22: map.put("sigunguCode", "칠곡군"); break;
					case 23: map.put("sigunguCode", "포항시"); break;
				} break;
			}
			case 36: {
				map.put("areaCode", "경상남도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "거제시"); break;
					case 2: map.put("sigunguCode", "거창군"); break;
					case 3: map.put("sigunguCode", "고성군"); break;
					case 4: map.put("sigunguCode", "김해시"); break;
					case 5: map.put("sigunguCode", "남해군"); break;
					case 6: map.put("sigunguCode", "마산시"); break;
					case 7: map.put("sigunguCode", "밀양시"); break;
					case 8: map.put("sigunguCode", "사천시"); break;
					case 9: map.put("sigunguCode", "산청군"); break;
					case 10: map.put("sigunguCode", "양산시"); break;
					case 12: map.put("sigunguCode", "의령군"); break;
					case 13: map.put("sigunguCode", "진주시"); break;
					case 14: map.put("sigunguCode", "진해시"); break;
					case 15: map.put("sigunguCode", "창년군"); break;
					case 16: map.put("sigunguCode", "창원시"); break;
					case 17: map.put("sigunguCode", "통영시"); break;
					case 18: map.put("sigunguCode", "하동군"); break;
					case 19: map.put("sigunguCode", "함안군"); break;
					case 20: map.put("sigunguCode", "함양군"); break;
					case 21: map.put("sigunguCode", "합천군"); break;
				} break;
			}
			case 37: {
				map.put("areaCode", "전라북도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "고창군"); break;
					case 2: map.put("sigunguCode", "군산시"); break;
					case 3: map.put("sigunguCode", "김제시"); break;
					case 4: map.put("sigunguCode", "남원시"); break;
					case 5: map.put("sigunguCode", "무주군"); break;
					case 6: map.put("sigunguCode", "부안군"); break;
					case 7: map.put("sigunguCode", "순창군"); break;
					case 8: map.put("sigunguCode", "완주군"); break;
					case 9: map.put("sigunguCode", "익산시"); break;
					case 10: map.put("sigunguCode", "임실시"); break;
					case 11: map.put("sigunguCode", "장수군"); break;
					case 12: map.put("sigunguCode", "전주시"); break;
					case 13: map.put("sigunguCode", "정읍시"); break;
					case 14: map.put("sigunguCode", "진안군"); break;
				} break;
			}
			case 38: {
				map.put("areaCode", "전라남도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "강진군"); break;
					case 2: map.put("sigunguCode", "고흥군"); break;
					case 3: map.put("sigunguCode", "곡성군"); break;
					case 4: map.put("sigunguCode", "광양시"); break;
					case 5: map.put("sigunguCode", "구례군"); break;
					case 6: map.put("sigunguCode", "나주시"); break;
					case 7: map.put("sigunguCode", "담양군"); break;
					case 8: map.put("sigunguCode", "목포시"); break;
					case 9: map.put("sigunguCode", "무안군"); break;
					case 10: map.put("sigunguCode", "보성군"); break;
					case 11: map.put("sigunguCode", "순천시"); break;
					case 12: map.put("sigunguCode", "신안군"); break;
					case 13: map.put("sigunguCode", "여수시"); break;
					case 16: map.put("sigunguCode", "영광군"); break;
					case 17: map.put("sigunguCode", "영암군"); break;
					case 18: map.put("sigunguCode", "완도군"); break;
					case 19: map.put("sigunguCode", "장성군"); break;
					case 20: map.put("sigunguCode", "장흥군"); break;
					case 21: map.put("sigunguCode", "진도군"); break;
					case 22: map.put("sigunguCode", "함평군"); break;
					case 23: map.put("sigunguCode", "해남군"); break;
					case 24: map.put("sigunguCode", "화순군"); break;
				} break;
			}
			case 39: {
				map.put("areaCode", "제주도");
				switch (sigunguCode) {
					case 1: map.put("sigunguCode", "남제주군"); break;
					case 2: map.put("sigunguCode", "북제주군"); break;
					case 3: map.put("sigunguCode", "서귀포시"); break;
					case 4: map.put("sigunguCode", "제주시"); break;
				} break;
			}
		}
		return map;
	}
	
	public Map<String, Object> categoryCode(String category1, String category2, String category3) {
		Map<String, Object> map=new HashMap<String, Object>();
		
		switch (category1) {
			case "A01": {
				map.put("category1", "자연");
				if(category2.equals("A0101")) {
					map.put("category2", "자연관광지");
					switch (category3) {
						case "A01010100": map.put("category3", "국립공원"); break;
						case "A01010200": map.put("category3", "도립공원"); break;
						case "A01010300": map.put("category3", "군립공원"); break;
						case "A01010400": map.put("category3", "산"); break;
						case "A01010500": map.put("category3", "자연생태관광지"); break;
						case "A01010600": map.put("category3", "자연휴양림"); break;
						case "A01010700": map.put("category3", "수목원"); break;
						case "A01010800": map.put("category3", "폭포"); break;
						case "A01010900": map.put("category3", "계곡"); break;
						case "A01011000": map.put("category3", "약수터"); break;
						case "A01011100": map.put("category3", "해안절경"); break;
						case "A01011200": map.put("category3", "해수욕장"); break;
						case "A01011300": map.put("category3", "섬"); break;
						case "A01011400": map.put("category3", "항구/포구"); break;
						case "A01011600": map.put("category3", "등대"); break;
						case "A01011700": map.put("category3", "호수"); break;
						case "A01011800": map.put("category3", "강"); break;
						case "A01011900": map.put("category3", "동굴"); break;
					}
				} else {
					map.put("category2", "관광자원");
					if(category3.equals("A01020100")) {
						map.put("category3", "희귀동.식물");
					} else {
						map.put("category3", "기암괴석");
					}
				} 	
			} break;
			case "A02": {
				map.put("category1", "인문(문화/예술/역사)");
				switch (category2) {
					case "A0201": {
						map.put("category2", "역사관광지");
						switch (category3) {
							case "A02010100": map.put("category3", "고궁"); break;
							case "A02010200": map.put("category3", "성"); break;
							case "A02010300": map.put("category3", "문"); break;
							case "A02010400": map.put("category3", "고택"); break;
							case "A02010500": map.put("category3", "생가"); break;
							case "A02010600": map.put("category3", "민속마을"); break;
							case "A02010700": map.put("category3", "유적지/사적지"); break;
							case "A02010800": map.put("category3", "사찰"); break;
							case "A02010900": map.put("category3", "종교성지"); break;
							case "A02011000": map.put("category3", "안보관광"); break;
						}
						break;
					}
					case "A0202": {
						map.put("category2", "휴양관광지");
						switch (category3) {
							case "A02020200": map.put("category3", "관광단지"); break;
							case "A02020300": map.put("category3", "온천/욕장/스파"); break;
							case "A02020400": map.put("category3", "이색찜질방"); break;
							case "A02020500": map.put("category3", "헬스투어"); break;
							case "A02020600": map.put("category3", "테마공원"); break;
							case "A02020700": map.put("category3", "공원"); break;
							case "A02020800": map.put("category3", "유람선/잠수함관광"); break;
						}
						break;
					}
					case "A0203": {
						map.put("category2", "체험관광지");
						switch (category3) {
							case "A02030100": map.put("category3", "농.산.어촌 체험"); break;
							case "A02030200": map.put("category3", "전통체험"); break;
							case "A02030300": map.put("category3", "산사체험"); break;
							case "A02030400": map.put("category3", "이색체험"); break;
							case "A02030600": map.put("category3", "이색거리"); break;
						}
						break;
					}
					case "A0204": {
						map.put("category2", "산업관광지");
						switch (category3) {
							case "A02040400": map.put("category3", "발전소"); break;
							case "A02040600": map.put("category3", "식음료"); break;
							case "A02040800": map.put("category3", "기타"); break;
							case "A02040900": map.put("category3", "전자-반도체"); break;
							case "A02041000": map.put("category3", "자동차"); break;
						}
						break;
					}
					case "A0205": {
						map.put("category2", "건축/조형물");
						switch (category3) {
							case "A02050100": map.put("category3", "다리/대교"); break;
							case "A02050200": map.put("category3", "기념탑/기념비/전망대"); break;
							case "A02050300": map.put("category3", "분수"); break;
							case "A02050400": map.put("category3", "동상"); break;
							case "A02050500": map.put("category3", "터널"); break;
							case "A02050600": map.put("category3", "유명건물"); break;
						}
						break;
					}
					case "A0206": {
						map.put("category2", "문화시설");
						switch (category3) {
							case "A02060100": map.put("category3", "박물관"); break;
							case "A02060200": map.put("category3", "기념관"); break;
							case "A02060300": map.put("category3", "전시관"); break;
							case "A02060400": map.put("category3", "컨벤션센터"); break;
							case "A02060500": map.put("category3", "미술관/화랑"); break;
							case "A02060600": map.put("category3", "공연장"); break;
							case "A02060700": map.put("category3", "문화원"); break;
							case "A02060800": map.put("category3", "외국문화원"); break;
							case "A02060900": map.put("category3", "도서관"); break;
							case "A02061000": map.put("category3", "대형서점"); break;
							case "A02061100": map.put("category3", "문화전수시설"); break;
							case "A02061200": map.put("category3", "영화관"); break;
							case "A02061300": map.put("category3", "어학당"); break;
							case "A02061400": map.put("category3", "학교"); break;
						}
						break;
					}
					case "A0207": {
						map.put("category2", "축제");
						if(category3.equals("A02070100")) {
							map.put("category3", "문화관광축제");
						} else {
							map.put("category3", "일반축제");
						}
						break;
					}
					case "A0208": {
						map.put("category2", "공연/행사");
						switch (category3) {
							case "A02080100": map.put("category3", "전통공연"); break;
							case "A02080200": map.put("category3", "연극"); break;
							case "A02080300": map.put("category3", "뮤지컬"); break;
							case "A02080400": map.put("category3", "오페라"); break;
							case "A02080500": map.put("category3", "전시회"); break;
							case "A02080600": map.put("category3", "박람회"); break;
							case "A02080800": map.put("category3", "무용"); break;
							case "A02080900": map.put("category3", "클래식음악회"); break;
							case "A02081000": map.put("category3", "대중콘서트"); break;
							case "A02081100": map.put("category3", "영화"); break;
							case "A02081200": map.put("category3", "스포츠경기"); break;
							case "A02081300": map.put("category3", "기타행사"); break;
						}
						break;
					}
				}
			}
			case "A03": {
				map.put("category1", "레포츠");
				switch (category2) {
					case "A0301": {
						map.put("category2", "레포츠소개");
						if(category3.equals("A03010200")) {
							map.put("category3", "수상레포츠"); 
						} else {
							map.put("category3", "항공레포츠");
						}
					}
					break;
					case "A0302": {
						map.put("category2", "육상 레포츠");
						switch (category3) {
							case "A03020200": map.put("category3", "수련시설"); break;
							case "A03020300": map.put("category3", "경기장"); break;
							case "A03020400": map.put("category3", "인라인"); break;
							case "A03020500": map.put("category3", "자전거하이킹"); break;
							case "A03020600": map.put("category3", "카트"); break;
							case "A03020700": map.put("category3", "골프"); break;
							case "A03020800": map.put("category3", "경마"); break;
							case "A03020900": map.put("category3", "경륜"); break;
							case "A03021000": map.put("category3", "카지노"); break;
							case "A03021100": map.put("category3", "승마"); break;
							case "A03021200": map.put("category3", "스키/스노보드"); break;
							case "A03021300": map.put("category3", "스케이트"); break;
							case "A03021400": map.put("category3", "썰매장"); break;
							case "A03021500": map.put("category3", "수렵장"); break;
							case "A03021600": map.put("category3", "사격장"); break;
							case "A03021700": map.put("category3", "야영장,오토캠핑장"); break;
							case "A03021800": map.put("category3", "암벽등반"); break;
							case "A03022000": map.put("category3", "서바이벌게임"); break;
							case "A03022100": map.put("category3", "ATV"); break;
							case "A03022200": map.put("category3", "MTB"); break;
							case "A03022300": map.put("category3", "오프로드"); break;
							case "A03022400": map.put("category3", "번지점프"); break;
							case "A03022600": map.put("category3", "스키(보드) 렌탈샵"); break;
							case "A03022700": map.put("category3", "트래킹"); break;
						}
					}
					break;
					case "A0303": {
						map.put("category2", "수상 레포츠");
						switch (category3) {
							case "A03030100": map.put("category3", "윈드서핑/제트스키"); break;
							case "A03030200": map.put("category3", "카약/카누"); break;
							case "A03030300": map.put("category3", "요트"); break;
							case "A03030400": map.put("category3", "스노쿨링/스킨스쿠버다이빙"); break;
							case "A03030500": map.put("category3", "민물낚시"); break;
							case "A03030600": map.put("category3", "바다낚시"); break;
							case "A03030700": map.put("category3", "수영"); break;
							case "A03030800": map.put("category3", "래프팅"); break;
						}
					}
					break;
					case "A0304": {
						map.put("category2", "항공 레포츠");
						switch (category3) {
							case "A03040100": map.put("category3", "스카이다이빙"); break;
							case "A03040200": map.put("category3", "초경량비행"); break;
							case "A03040300": map.put("category3", "헹글라이딩/패러글라이딩"); break;
							case "A03040400": map.put("category3", "열기구"); break;
						}
					}
					break;
					case "A0305": {
						map.put("category2", "레포츠소개");
						map.put("category3", "수상레포츠"); 
						break;
					}
				}
			}
			case "A04": {
				map.put("category1", "쇼핑");
				map.put("category2", "쇼핑");
				switch (category3) {
					case "A04010100": map.put("category3", "5일장"); break;
					case "A04010200": map.put("category3", "상설시장"); break;
					case "A04010300": map.put("category3", "백화점"); break;
					case "A04010400": map.put("category3", "면세점"); break;
					case "A04010500": map.put("category3", "대형마트"); break;
					case "A04010600": map.put("category3", "전문매장/상가"); break;
					case "A04010700": map.put("category3", "공예/공방"); break;
					case "A04010900": map.put("category3", "특산물판매점"); break;
					case "A04011000": map.put("category3", "사후면세점"); break;
				}
				break;
			}
			case "A05": {
				map.put("category1", "음식");
				map.put("category2", "음식");
				switch (category3) {
					case "A05020100": map.put("category3", "한식"); break;
					case "A05020200": map.put("category3", "서양식"); break;
					case "A05020300": map.put("category3", "일식"); break;
					case "A05020400": map.put("category3", "중식"); break;
					case "A05020700": map.put("category3", "이색음식점"); break;
					case "A05020900": map.put("category3", "카페/전통찻집"); break;
					case "A05021000": map.put("category3", "클럽"); break;
				}
				break;
			}
		}
		return map;
	}
}
