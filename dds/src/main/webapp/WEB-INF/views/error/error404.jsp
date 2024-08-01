<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   response.setStatus(HttpServletResponse.SC_OK);
%>

<style type="text/css">
.body-container {
	width: 970px;
    margin: 0 auto; /* 수평 가운데 정렬 */
}
</style>

<div class="container">
	<div class="body-container">	
        <div class="row justify-content-md-center mt-5">
            <div class="col-md-8">
                <div class="border mt-5 p-4">
                       <h4 class="text-center fw-bold mb-3 mt-2"><i class="bi bi-exclamation-triangle"></i> 시스템 오류</h4>
                       <div class="text-center mt-2">
                           <img alt="" src="${pageContext.request.contextPath}/resources/images/404.png" class="img-fluid" style="width: 350px;">
                       </div>
	                <div class="d-grid pt-3">
						<p class="alert alert-primary text-center bg-light fs-6 py-4">
							앗! 존재하지 않는 페이지입니다.<br>
							요청하신 페이지의 주소를 찾을 수 없습니다.					
						</p>
	                </div>
                       
                       <div class="d-grid mt-1">
                           <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/';">메인화면으로 이동 <i class="bi bi-arrow-counterclockwise"></i> </button>
                       </div>
                </div>
            </div>
        </div>

	</div>
</div>
