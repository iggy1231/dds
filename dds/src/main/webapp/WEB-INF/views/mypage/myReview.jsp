<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="list2" items="${list}">
<div class="mt-3 border-bottom">
	<div class="row p-2">
		<div class="col-md-8 order-md-1">
			<div class="row">
				<div class="col-auto pt-0 ps-2 pe-1 score-star">
					<c:forEach var="i" begin="1" end="5">
						<span
							class="item fs-6 <c:if test="${list2.score >= i}">on</c:if>">
							<i class="bi bi-star-fill"></i>
						</span>
					</c:forEach>
				</div>
				<div class="col-auto ps-0 fs-5 ps-2">
					<span>${list2.nickName}</span>
				</div>
				<div class="pt-3 text-start fs-6">
					<span class="fs-6">${list2.nickName}</span> | <span
						class="notifyReview fs-6" data-num="' + num + '">신고</span>
				</div>
				<div class="row">
					<div class="col mt-2 p-2 fs-5 ps-3">${list2.content}</div>
				</div>
			</div>
		</div>
		<c:if test="${not empty list2.photo}">
                <div class="col-md-4 text-end order-md-2">
                    <div class="ratio ratio-4x3">
                        <!-- 변환된 JSP 코드 -->
                        <c:forEach var="photo" items="${list2.photo}">
                            <img class="border rounded img-fluid" src="${pageContext.request.contextPath}/uploads/review/${photo}">
                        </c:forEach>
                    </div>
                </div>
            </c:if>
	</div>
</div>
</c:forEach>

<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>
