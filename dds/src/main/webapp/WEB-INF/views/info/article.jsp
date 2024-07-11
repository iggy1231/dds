<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
*	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
body {
	background-color: #18A8F1;
}
.container {
	background-color: white;
}
.body-container {
	max-width: 800px;
}
</style>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-app"></i> ${dto.name} </h3>
			<p> ${dto.region_Main} ${dto.region_Sub} </p>
			<div class="row">
				<c:forEach var="tag" items="${tagList}">
					<button class="col-1">${tag}</button>
				</c:forEach>
			</div>
		</div>
		<div class="body-main">
			<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt="...">
			<p>이미지 목록 가져와서 캐러셀 사용</p>
			<hr>
			<h3>소개</h3>
			<hr>
			<p>${dto.overview}</p>
			<h3>지도</h3>
			<div class="bg-primary" style="height: 500px;">GPS 주소 : ${dto.mapx}, ${dto.mapy}</div>
			<hr>
			<h3>상세정보</h3>
			<hr>
			<p>주소 : ${dto.addr1} ${dto.addr2} (우편번호 : ${dto.zipcode})</p>
			<p>전화번호 : ${dto.tel}</p>
			<p>홈페이지 : ${dto.homepage}</p>
		</div>
		<div>
			<h3>댓글 0</h3>
			<div>댓글창</div>
		</div>
	</div>
</div>