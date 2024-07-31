<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.btn3 {
	border: 1px solid #696cff;
	border-radius: 8px; 
	color: #696cff;
	background: white;
	
} 

.btn3:hover {
	border: 1px solid #696cff;
	background: #696cff;  
	color: white;
}

.btn4 {
	border: 1px solid #6978AD;
	border-radius: 8px; 
	color: #6978AD;
	background: white;
	
} 

.btn4:hover {
	border: 1px solid #6978AD;
	background: #6978AD;  
	color: white;
}




</style>

<c:if test="${list.size() > 0}">
	<div id="accordionIcon" class="accordion mt-3 accordion-without-arrow">
		<c:forEach var="dto" items="${list}">
			<div class="accordion-item card">
				<h3 class="accordion-header text-body d-flex justify-content-between" id="accordionIcon-${dto.num}">
					<button type="button" class="accordion-button collapsed"
						data-bs-toggle="collapse" data-bs-target="#accordionIcon-collapse-${dto.num}"
						aria-controls="accordionIcon-collapse-${dto.num}">
						<span class="q"></span> <span class="subject" style="font-weight: bold;">Q. ${dto.subject}</span></button>
				</h3>
				<div id="accordionIcon-collapse-${dto.num}" class="accordion-collapse collapse" aria-labelledby="accordionIcon-${dto.num}"> 
					<div class="accordion-body"> 
						<div class="category">[분류] : ${dto.category}</div> 
						<hr>   
						<div class="content"> 
							<div>A. ${dto.content}</div> 
						</div>
					</div>
					<div class="text-end m-3"> 
						<button class="btn3"><a onclick="location.href='${pageContext.request.contextPath}/admin/faqManage/update?num=${dto.num}&pageNo=${pageNo}';">수정</a></button>
						<button class="btn4"><a onclick="deleteFaq('${dto.num}', '${pageNo}');">삭제</a></button> 
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</c:if>

