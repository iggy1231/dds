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

</style>


<div class="mt-3 pt-3">
	<div class="mt-2 pt-1 pb-2">
		<p class="fs-4 fw-semibold">📝 나의 리뷰</p>
	</div>
	<div class="mb-4 p-2 row bg-light rounded">
		<div
			class="col p-2 text-center d-flex flex-column justify-content-center">
			<div class="fs-6 fw-semibold">상품만족도</div>
			<div class="score-star review-score-star">
				<c:forEach var="n" begin="1" end="5">
                    <span class="item fs-2 ${averageScore >= n ? 'on' : ''}"><i class="bi bi-star-fill"></i></span>
                </c:forEach>
			</div>
			<div class="fs-2">
				<label class="review-score">${averageScore} / 5</label>
			</div>
		</div>

		<div
			class="col p-3 text-center d-flex flex-column justify-content-center">
			<div class="fs-6 fw-semibold">리뷰수</div>
			<div class="fs-2">
				<i class="bi bi-chat-right-text"></i>
			</div>
			<div class="fs-2 review-reviewCount">${reviewCount}</div>
		</div>

		<div
			class="col p-3 text-center d-flex flex-column justify-content-center review-rate">
			<div class="fs-6 fw-semibold">평점비율</div>
			<c:forEach var="i" begin="1" end="5">
                <div class="p-1 score-${i}">
                    <span class="graph-title">${i}점</span> 
                    <span class="graph">
                        <c:set var="percentage" value="${(ratingCount[i - 1] * 100) / reviewCount}" />
                        <c:forEach var="n" begin="1" end="10">
                            <label class="one-space ${n <= percentage / 10 ? 'on' : ''}"></label>
                        </c:forEach>
                    </span> 
                    <span class="graph-rate">${percentage}%</span>
                </div>
            </c:forEach>
		</div>
	</div>


</div>
<c:forEach var="list2" items="${list}">
	<div class="mt-3 border-bottom">
		<div class="row p-2">
			<div class="col-md-8 order-md-1">
				<div class="row review-item">
					<div class="col-auto pt-0 ps-2 pe-1 score-star">
						<c:forEach var="i" begin="1" end="5">
							<span
								class="item fs-5 <c:if test="${list2.rating >= i}">on</c:if>">
								<i class="bi bi-star-fill"></i>
							</span>
						</c:forEach>
					</div>
					<div class="col-auto ps-0 fs-5 ps-2">
						 <c:choose>
                            <c:when test="${list2.boardName == 'room'}">
                                🏠 숙소
                            </c:when>
                            <c:when test="${list2.boardName == 'tour'}">
                                🌴 투어
                            </c:when>
                            <c:otherwise>
                                ${list2.boardName}
                            </c:otherwise>
                        </c:choose>
					</div>
						<div class="review-content col mt-2 p-2 fs-3 ps-3">${list2.content}</div>
					<div class="col-auto pt-3 text-start fs-4">
						<span class="fs-6">${list2.reg_date}</span>
						<button class="deleteReview delete-button"
							data-num="" style="margin-left: 10px;">삭제</button>
					</div>
				</div>
			</div>
			<c:if test="${not empty list2.photo}">
				<div class="col-md-4 text-end order-md-2">
					<div class="ratio ratio-4x3">
						<!-- 변환된 JSP 코드 -->
						<c:forEach var="photo" items="${list2.photo}">
							<img class="border rounded img-fluid"
								src="${pageContext.request.contextPath}/uploads/review/${photo}">
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</c:forEach>

<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>
