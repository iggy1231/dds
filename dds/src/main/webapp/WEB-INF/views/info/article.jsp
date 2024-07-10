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
			<h3><i class="bi bi-app"></i> 이름 </h3>
			<p>지역코드, 시군구코드에 따른 지역 이름</p>
			<div class="row">
				<button class="col-1">#태그</button>
				<button class="col-1">#태그</button>
				<button class="col-1">#태그</button>
				<button class="col-1">#태그</button>
			</div>
		</div>
		<div class="body-main">
			<p>이미지 목록 가져와서 캐러셀 사용</p>
			<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt="...">
			<br>
			<h3>소개</h3>
			<hr>
			<p>소개 텍스트 가져오기</p>
			<div class="bg-primary" style="height: 500px;">gps 위치 가져와서 지도 api로 위치 찍기</div>
			<h3>상세정보</h3>
			<p>연락처, 주소, 홈페이지 등 기타 정보</p>
		</div>
		<div>
			<h3>댓글 0</h3>
			<div>댓글창</div>
		</div>
	</div>
</div>