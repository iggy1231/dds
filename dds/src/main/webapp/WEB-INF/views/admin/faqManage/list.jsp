<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:if test="${list.size() > 0}">
	<div id="accordionIcon" class="accordion mt-3 accordion-without-arrow">
		<c:forEach var="dto" items="${list}">
			<div class="accordion-item card">
				<h3 class="accordion-header text-body d-flex justify-content-between" id="accordionIconOne">
					<button type="button" class="accordion-button collapsed"
						data-bs-toggle="collapse" data-bs-target="#accordionIcon-1"
						aria-controls="accordionIcon-1">
						<span class="q">Q.</span> <span class="subject">${dto.subject}</span></button>
				</h3>
				<div id="accordionIcon-1" class="accordion-collapse collapse">
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

<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>
