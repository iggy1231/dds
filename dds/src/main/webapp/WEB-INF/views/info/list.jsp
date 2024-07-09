<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
*	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
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
.carousel-item img {
	height: 700px;
}
</style>

<div class="container">
	<div class="body-title">
			<div id="carouselExampleCaptions" class="carousel slide">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>First slide label</h5>
			        <p>Some representative placeholder content for the first slide.</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Second slide label</h5>
			        <p>Some representative placeholder content for the second slide.</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Third slide label</h5>
			        <p>Some representative placeholder content for the third slide.</p>
			      </div>
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
	<div class="body-container">	
		<div class="body-main">
			<div>
				<form action="">
					<select>
						<option>지역</option>
						<option>태그</option>
					</select>
					<input type="text">
					<button>검색</button>
				</form>
				<p>인기글</p>
				<div class="row item-list">
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
				</div>
				<br>
				<div class="row item-list">
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
				</div>			
				<br>
				<div>
				<p>전체글</p>
				<div class="row item-list">
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
				</div>
				<br>
				<div class="row item-list">
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
				</div>
				<br>
				<div class="row item-list">
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
				</div>
				</div>
				
				<br>
				<div class="row item-list">
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
				</div>
				<br>
				<div class="row item-list">
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
	  					<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
	  					<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
					<div class="col card">
		  				<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">
		  				<div class="card-body">
	      					<p>이름</p>
	    					<p class="card-text">지역, 시군구</p>
	    					<footer>태그(콘텐츠타입, 대분류, 중분류, 소분류)</footer>
	  					</div>
					</div>
				</div>
				<p>더보기(무한스크롤)</p>
			</div>
		</div>
	</div>
</div>