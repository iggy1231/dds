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
                       <div class="text-center mt-2">
                           <img alt="" src="${pageContext.request.contextPath}/resources/images/comming_soon.png" class="img-fluid" style="height : 370px;">
                       </div>
	                <div class="d-grid pt-3">
						<p class="alert alert-primary text-center bg-light fs-6 py-4">
							현재 서비스 준비중입니다.<br>
							잠시만 기다려 주세요~ 금방 돌아올게요! 🐥					
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
