<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.delete-button {
	border-radius: 20px;
	width: 50px; 
	font-size: 16px;
	background: #EAEAEA;
	border: 1px solid #EAEAEA;
}


.delete-button:hover {
	background: gray;
	border: 1px solid gray;
	color: white;
	transform: translateY(2px);
	transition: 0.3s;   
}

.color-text {
        color: #18A8F1;
    }
    
    .btn-custom {
        background-color: #f8f9fa; /* 기본 배경색 */
        color: #000; /* 기본 텍스트 색상 */
    }
    .btn-custom.active {
        background-color: #18A8F1; /* 활성화 배경색 */
        color: #fff; /* 활성화 텍스트 색상 */
    }
</style>

<div class="row justify-content-between">
	<h5 class="col">전체 <span class="color-text">${dataCount}</span>건</h5>
		<div class="col text-end" style="margin-bottom: .5rem;">
				<button id="listQnArecent" type="button" class="btn btn btn-custom ${mode=='newest'?'active':''}" data-bs-toggle="button">최신순</button>
				<button id="listQnApast" type="button" class="btn btn btn-custom ${mode=='oldest'?'active':''}" data-bs-toggle="button">과거순</button>
		</div>
</div>

<c:forEach var="list1" items="${list}">
<div class="mt-1 border-bottom">
	<span class="p-1 fw-semibold" style="font-size: 25px;">${list1.subject}</span>
	<span class="text-end"> 
		<c:choose>
			<c:when test="${not empty list1.answer}">
				<span class="text-secondary" style="font-weight: bold; font-size: 20px;">[답변완료]</span>
			</c:when>
			<c:otherwise>
				<span class="waitingAnswer" style="font-weight: bold; font-size: 20px;">[답변대기]</span>
			</c:otherwise>
		</c:choose> 
	</span>
	
	<div style="font-size: 17px;" class="p-1">${list1.content}</div>
	<div class="row p-2 fs-5">
		
		<div class="col-auto pt-2 px-0"> 
			&nbsp;&nbsp;<span>${list1.reg_date}</span>  
			<button class="deleteQuestion delete-button"
				data-num="${list1.qna_num}" style="margin-left: 10px;">삭제</button> 
		</div>
		<div class="col pt-2 text-end">
			<button class="btn btnAnswerView">
				<i class="bi bi-chevron-down"></i> 
			</button>
		</div>
	</div>
	<div class="p-4 pt-0 answer-content nav-item">
		<div class="bg-light">
			<div class="p-3 pb-0">
				<label class="bg-primary text-white px-3 fs-6" style="font-weight: bold;"> 관리자 </label> 
				<label style="font-size: 16px;" class="ps-2">${list1.answer_date}</label> 
			</div>  
			<div style="font-size: 16px;" class="p-3 pt-2">${list1.answer}</div>
		</div> 
	</div>
</div>
</c:forEach>

<div class="page-navigation">${dataCount == 0 ? "작성한 문의가 없습니다." : paging}
</div>