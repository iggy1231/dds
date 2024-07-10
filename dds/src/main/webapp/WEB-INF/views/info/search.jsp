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
</style>

<div class="container">
	<div class="body-container">	
		<div>
			<h3><i class="bi bi-app"></i> 검색어 보여주기 </h3>
			<hr>
			<div class="row justify-content-between">
				<span class="col">검색 결과 ?건</span>
				<div class="col text-end">
					<button>가나다순</button> | <button>인기순</button>
				</div>
			</div>
			<br>
		</div>
		
		<div class="body-main">
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
		</div>
	</div>
</div>