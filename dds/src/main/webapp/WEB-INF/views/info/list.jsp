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
	height: 500px;
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
				<form action="${pageContext.request.contextPath}/info/search">
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
				<div>
				<p>전체글</p>
				<div class="list-content" data-pageNo="0" data-totalPage="0"></div>
				<div class="list-footer mt-2 text-end">
					<span class="more-btn btn btn-light">&nbsp;더보기&nbsp;<i class="bi bi-chevron-down"></i>&nbsp;</span>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<script>
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;
		settings.contentType = false;
	}
	$.ajax(url, settings);
}


$(function(){
	listPage(1);
});

function listPage(page) {
	let url='${pageContext.request.contextPath}/info/list';
	let formData='pageNo='+page;
	
	const fn=function(data) {
		addNewContent(data);
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}

function addNewContent(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	$('.list-content').attr('data-pageNo', pageNo);
	$('.list-content').attr('data-totalPage', total_page);

	let htmlText='<div class="row item-list">';
	for(let item of data.list) {
		let num = item.num;
		let region_Main = item.region_Main;
		let region_Sub = item.region_Sub;
		let contentId = item.contentId;
		let contentType = item.contentType;
		let name=item.name;
		let thumbnail=item.thumbnail;
		let main_Category=item.main_Category;
		let middle_Category=item.middle_Category;
		let sub_Category=item.sub_Category;
		let tags=item.tags;
		
		htmlText+='	<div class="col card" onclick="article(\''+contentId+'\'\,\''+contentType+'\'\,\''+thumbnail+'\');">';
		htmlText+='		<img src="'+thumbnail+'" class="card-img-top" alt="...">';
		htmlText+='		<div class="card-body">';
		htmlText+='			<p>'+name+'</p>';
		htmlText+='			<p class="card-text">'+region_Main+' '+region_Sub+'</p><footer>';
		tags.forEach((tag)=>{
			htmlText+='			<span>#'+tag+'</span>';		
		})
		htmlText+='		</footer></div>';
		htmlText+='	</div>';
	}
	htmlText+='</div><br>';
	$(".list-content").append(htmlText);	
}

$(function(){
	$('.list-footer .more-btn').click(function(){
		let pageNo = $('.list-content').attr('data-pageNo');
		let total_page = $('.list-content').attr('data-totalPage');
		
		pageNo++;
		if(pageNo==total_page) {
			$('.list-footer .more-btn').hide();
		} else {
			listPage(pageNo);
		}
	});
});

function article(contentId, contentType, thumbnail) {
	location.href="${pageContext.request.contextPath}/info/load?contentId="+contentId+"&contentType="+contentType+"&thumbnail="+thumbnail;
}
</script>