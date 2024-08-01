<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.companion-card-header {
	overflow-wrap : break-word;
	padding-top: 40px;
	}
</style>
<!-- 동행 탭 콘텐츠 -->
<div class="row">
	<c:forEach var="list4" items="${list}">
		<div class="col-md-4">
			<div class="companion-card">
				<div class="companion-card-header">${list4.subject}</div>
				<i class="bi bi-heart-fill heart-icon" id="wishlist-${list4.num}" onclick="removeFromWishlist(${list4.num}, 'companion')"></i>
				<div class="companion-card-body">
					<img src="${pageContext.request.contextPath}/uploads/mypage/${list4.photo}" alt="Profile Image"
						class="companion-card-img">
					<p class="companion-card-title">${list4.nickname}</p>
					<p class="companion-card-location">
						<i class="bi bi-geo-alt-fill"></i>${list4.mainRegion} 
						<i class="bi bi-people-fill"></i> ${list4.total_people}인
						<i class="bi bi-people-fill"></i>${list4.gender}
					</p>
					<p class="companion-card-date">
						<i class="bi bi-calendar-event"></i> ${list4.sdate} ~ ${list4.edate}
					</p>
					<span class="badge" onclick="location.href='${pageContext.request.contextPath}/companion/article?num=${list4.num}'">동행 신청</span>
				</div>
			</div>
		</div>
		<!-- 다른 동행 아이템들도 여기에 추가 -->
	</c:forEach>
</div>

<div class="page-navigation">${dataCount == 0 ? "위시리스트 동행 목록이 없습니다." : paging} </div>

