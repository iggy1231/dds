<%@ page contentType="text/html; charset=UTF-8"%>
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
.card {
	margin: 0 5px;
	padding: 0px;
}
.card p {
	margin: 0px;
}
</style>

<div class="container">
    <div class="inner-page">
		동행 구인 게시판 입니다.
    </div>
    <div class="body-container">
    	<form action="#">
    		<p>검색창</p>
    		<input type="text">
    		<button>검색</button>
    	</form>
    	<hr>
    	<p>지역 리스트 서울 경기 부산 대전 대구 강원...
    	<p>지역 별 최신 글
    	<div id="carouselExampleIndicators" class="carousel slide">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <div class="row item-list">
	    	<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
		</div>
		    </div>
		    <div class="carousel-item">
		      <div class="row item-list">
	    	<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
		</div>
		    </div>
		    <div class="carousel-item">
		      <div class="row item-list">
	    	<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
		</div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		<hr>
		<p>지역 별 인기 글
    	<div class="row item-list">
	    	<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
		</div>
		<p>지역/테마 글 게시판으로 이동
		<hr>
		<p>전체 최신 글
    	<div class="row item-list">
	    	<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
			<div class="col card">
				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<p>이름</p>
					<p class="card-text">지역 시군구</p>
					<footer>
						<span>태그</span>		
					</footer>
				</div>
			</div>
		</div>
		<hr>
    </div>
</div>