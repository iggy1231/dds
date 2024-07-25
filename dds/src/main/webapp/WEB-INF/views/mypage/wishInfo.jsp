<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 여행정보 탭 콘텐츠 -->
<div class="row">
	<c:forEach var="list3" items="${list}">
		<div class="col-md-4">
			<div class="travel-info-item">
				<i class="bi bi-heart-fill heart-icon" id="wishlist-${list3.num}" onclick="removeFromWishlist(${list3.num}, 'info')"></i>
				<img src="${list3.thumbnail}" alt="Info Image">
				<div class="travel-info-item-body">
					<a class="travel-info-item-title"
					href="${pageContext.request.contextPath}/info/load?num=${list3.num}&contentId=${list3.contentId}">${list3.name}</a>
					<p class="travel-info-item-location">
						<i class="bi bi-geo-alt-fill">${list3.region_Main} ${list3.region_Sub}</i> 
					</p>
					<c:forEach var="tag" items="${list3.tags}">
						<span class="travel-info-item-tags">#${tag}</span>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 다른 여행정보 아이템들도 여기에 추가 -->
	</c:forEach>
</div>
<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging} </div>
