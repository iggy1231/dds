<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 동행 탭 콘텐츠 -->
<div class="row">
	<c:forEach var="list4" items="list">
		<div class="col-md-4">
			<div class="companion-card">
				<div class="companion-card-header">제주도 힐링 투어 같이 가실 분 구해요! 함께
					즐거운 여행 합시다 :-)</div>
				<div class="companion-card-body">
					<img src="https://via.placeholder.com/80" alt="Profile Image"
						class="companion-card-img">
					<p class="companion-card-title">닉네임</p>
					<p class="companion-card-location">
						<i class="bi bi-geo-alt-fill"></i> 제주도 <i
							class="bi bi-people-fill"></i> 5인
					</p>
					<p class="companion-card-date">
						<i class="bi bi-calendar-event"></i> YY/MM/DD ~ YY/MM/DD
					</p>
					<span class="badge">동행 신청</span>
				</div>
			</div>
		</div>
		<!-- 다른 동행 아이템들도 여기에 추가 -->
	</c:forEach>
</div>
