<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 여행정보 탭 콘텐츠 -->
<div class="row">
	<c:forEach var="list3" items="list">
		<div class="col-md-4">
			<div class="travel-info-item">
				<i class="bi bi-heart-fill heart-icon"></i> <img
					src="https://via.placeholder.com/300x200" alt="Travel Image">
				<div class="travel-info-item-body">
					<p class="travel-info-item-title">감악산(거창)</p>
					<p class="travel-info-item-location">
						<i class="bi bi-geo-alt-fill"></i> 경상남도 거창군
					</p>
					<p class="travel-info-item-tags">#관광지 #산 #자연관광지 #자연</p>
				</div>
			</div>
		</div>
		<!-- 다른 여행정보 아이템들도 여기에 추가 -->
	</c:forEach>
</div>