package com.fly.dds.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fly.dds.domain.SessionInfo;

/*
  - HandlerInterceptor
    : 컨트롤러가 요청을 받기 전과 요청을 처리한후에 반복적인 기능을 수행할 수 있도록 하기 위한 인터페이스
    : 서블릿의 필터와 유사
    : 인터셉터를 적용하기 위해서는 HandlerInterceptor를 등록해야 한다.
*/

public class LoginCheckInterceptor implements HandlerInterceptor {
	private final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	/*
	 * 클라이언트 요청 처리 전에 실행
	 * false를 반환하면 다른 HandlerInterceptor 또는 Controller를 실행하지 않음
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean flag = true;
		
		try {
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String cp = request.getContextPath();
			String uri = request.getRequestURI();
			String queryString = request.getQueryString();
			
			if(info == null) {
				// 로그인 안된 경우
				flag = false;
				
				if(isAjaxRequest(request)) {
					// AJAX 인 경우
					response.sendError(403);
				} else {
					// AJAX 가 아닌 경우
					if(uri.indexOf(cp) == 0) {
						// ContextPath 제거
						uri = uri.substring(cp.length());
					}
					
					if(queryString != null) {
						uri += "?" + queryString;
					}
					
					session.setAttribute("preLoginURI", uri);
					response.sendRedirect(cp + "/member/login");
				}
				
			} else {
				// 로그인 된 경우
				
				
				
				if(uri.indexOf("admin") != -1 && ! info.getUserId().equals("admin")) {
					
					flag = false;
					response.sendRedirect(cp + "/member/noAuthorized");
				}
			}
			
		} catch (Exception e) {
			logger.info("pre : " + e.toString());
		}
		
		
		return flag;
	}

	/*
	 * 클라이언트 요청 처리 후 실행
	 * 클라이언트 요청 처리 중 예외가 발생하면 실행 하지 않음
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	/*
	 * 클라이언트 요청 처리 후 실행
	 * 클라이언트 요청 처리 중 또는 뷰를 생성하는 과정에서 예외가 발생해도 실행
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
	// AJAX 요청인지를 확인하기 위한 메소드
	private boolean isAjaxRequest(HttpServletRequest req) {
		String h = req.getHeader("AJAX");
		return h != null && h.equals("true");
	}

}
