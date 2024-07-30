<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="list1" items="${list}">
<div class="mt-1 border-bottom">
	<h5 class="p-1 fw-semibold fs-4">${list1.subject}</h5>
	<h6 class="p-1 pb-1 fs-5">${list1.userName}</h6>
	<h6 class="p-1 fs-4">${list1.content}</h6>
	<div class="row p-2 fs-5">
		<div class="col-auto pt-2 pe-0">
			<span class="text-secondary">
				<c:choose>
					<c:when test="${not empty list1.answer}">
						답변완료
					</c:when>
					<c:otherwise>
						답변대기
					</c:otherwise>
				</c:choose>
			</span>
		</div>
		<div class="col-auto pt-2 px-0">
			&nbsp;|&nbsp;<span>${list1.reg_date}</span> |<span class="deleteQuestion"
				data-num="${list1.qna_num}">삭제</span>
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
				<label class="bg-primary text-white px-3 fs-5"> 관리자 </label> <label
					class="ps-2 fs-4">${list1.answer_date}</label>
			</div>
			<div class="p-3 pt-2 fs-4">${list1.answer}</div>
		</div>
	</div>
</div>
</c:forEach>

<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>