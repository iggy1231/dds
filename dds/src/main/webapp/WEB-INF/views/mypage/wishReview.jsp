<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 후기 탭 콘텐츠 -->
<div class="row">
	<c:forEach var="list" items="list">
		<div class="col-md-4">
			<div class="review-item">
				<i class="bi bi-heart-fill heart-icon"></i> <img
					src="https://via.placeholder.com/300x200" alt="Review Image">
				<div class="review-item-body">
					<p class="review-item-title">순천 갔다온 썰 푼다</p>
					<p class="review-item-text">순천에 자랑 소금후추 보고 왔는데...</p>
					<p class="review-item-location">
						<i class="bi bi-geo-alt-fill"></i> 순천
					</p>
					<p class="review-item-date">
						<i class="bi bi-calendar-event"></i> 2024.07.21
					</p>
				</div>
				<div class="review-item-footer">
					<span><i class="bi bi-person-circle"></i> 닉네임</span>
				</div>
			</div>
		</div>
		<!-- 다른 여행후기 아이템들도 여기에 추가 -->
	</c:forEach>
</div>
