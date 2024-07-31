<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:if test="${list.size() > 0}">
	<div id="accordionIcon" class="accordion mt-3 accordion-without-arrow">
		<c:forEach var="dto" items="${list}">
			<div class="accordion-item card">
				<h3 class="accordion-header text-body d-flex justify-content-between" id="accordionIcon-${dto.num}">
					<button type="button" class="accordion-button collapsed"
						data-bs-toggle="collapse" data-bs-target="#accordionIcon-collapse-${dto.num}"
						aria-controls="accordionIcon-collapse-${dto.num}">
						<span class="q"></span> <span class="subject">${dto.subject}</span></button>
				</h3>
				<div id="accordionIcon-collapse-${dto.num}" class="accordion-collapse collapse" aria-labelledby="accordionIcon-${dto.num}">
					<div class="accordion-body">
						<div class="category">분류 : ${dto.category}</div>
						<div class="content">
							<div>A.</div>
							<div>${dto.content}</div>
						</div>
					</div>
					<div class="update">
						<a
							onclick="location.href='${pageContext.request.contextPath}/admin/faqManage/update?num=${dto.num}&pageNo=${pageNo}';">수정</a>&nbsp;|
						<a onclick="deleteFaq('${dto.num}', '${pageNo}');">삭제</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</c:if>

