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
.headerImage {
	width: 100%;
	height: 400px;
}
p {
	margin: 0;
}

</style>

<div class="container">
	<div class="body-container">	
		<img class="headerImage" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt="...">
		<div class="body-title">
			<h3>${dto.subject}</h3>
			<p>조회수 :${dto.hitcount} 작성일 :${dto.reg_date}
		</div>
			
		<div class="body-main">
			<h3>여행 일정</h3>
			<div>
				<p>${dto.sdate} ~ ${dto.edate}
				<c:forEach var="area" items="${dto.region_main}" varStatus="stat">
					<span>${dto.region_main[stat.index]}/${dto.region_sub[stat.index]}</span>
				</c:forEach>
			</div>
			<hr>
			<h3>여행 소개</h3>
			<div>
				<p>${dto.content}
			</div>
			<hr>
			<h3>상세 정보</h3>
			<div>
				<p>#${dto.theme}</p>
				<p>#${dto.gender}</p>
				<c:forEach var="ages" items="${dto.age}">
					<span>${ages}대</span>
				</c:forEach>
				<p>현재 인원 : ${dto.current_people}/${dto.total_people} 명
				<p>예상 비용 : ${dto.estimate_cost} 원
			</div>
			<hr>
			<h3>동행자 정보</h3>
			<div>
				<p>${dto.nickname}
				<p>현재 동행에 참여중인 사람 정보
			</div>
			<hr>
			<button>좋아요</button>
			<button>동행 요청</button>
			<hr>
			<h3>댓글</h3>
			<div>
				<p>댓글
			</div>
			<hr>
			<h3>비슷한 동행 보기</h3>
			<div>
				<div id="carouselExample" class="carousel slide">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	
});
</script>