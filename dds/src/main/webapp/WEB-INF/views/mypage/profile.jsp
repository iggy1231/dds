<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.profile-container {
	border: 1px solid #fff;
	border-radius: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	width: 600px;
	height: 300px; 

}

.good {
margin : 30px;
}


</style>



<div class="my-info">
	<div class="page-title">
		<div class="spacing-top"></div>
		 <div class="content"> 
		 	<div class="">
		 	 
		 		<div class="title title--show">
		 			<h3 style="font-weight: bold; color: #18A8F1;"><i>내 정보 관리</i></h3>
			 	</div> 
			 	
			 	<div class="profile-container" style="display: flex">
			 		<div style="width: 100px; height: 100px; border-radius: 50px; background: red; margin: 20px;">
			 			  <c:choose>
			 			  	<c:when test="${picture != null}">
			 			  	알아서 넣으시고
			 			  	</c:when> 
			 			  	<c:otherwise>
			 			  		<img src="${pageContext.request.contextPath}/사진위치/기본프로필.jpg">
			 			  	</c:otherwise>
			 			  </c:choose>
			 		</div>  
			 		<div class="good">
						<div>그러시든가요:)</div>
						<div>싫어요! 니 똥 굵다!</div>
					</div>
			 			
			 		
			 		 
			 	</div> 
			 	
			 	
			 	
			 </div>
		</div>
	</div>
</div>

