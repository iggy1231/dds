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
.scroll-list {
	overflow-y: auto;
	height: 600px;
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
		<p>전체 글
		<div class="scroll-list">
			<ul class="list-group list-group-flush">
				 <li class="list-group-item">
					<div class="sentinel" data-loading="false"></div>
				 </li>
			</ul>
		</div>
		<hr>
    </div>
</div>

<script type="text/javascript">
const sentinel = document.querySelector('.sentinel');
const scroll = document.querySelector('.scroll-list ul');

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

function listPage(page) {
	let url="${pageContext.request.contextPath}/companion/companionList";
	let query="pageNo="+page;
	
	const fn=function(data) {
		scroll_load(data);
	};
	
	ajaxFun(url, 'get', query, 'json', fn);
}

function scroll_load(data) {
	console.log(data);
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	scroll.setAttribute('data-pageNo', pageNo);
	scroll.setAttribute('data-totalPage', total_page);
	
	sentinel.style.display = 'none';
	
	let htmlText="";
	for(let item of data.list) {
		htmlText+='<li class="list-group-item">';
			htmlText+='<div>';
				htmlText+='<p>'+item.subject+'</p>';
				htmlText+='<p>'+item.content+'</p>';
				htmlText+='<p>'+item.nickname+'</p>';
				item.region_main.forEach((mainRegion)=>{
				htmlText+='<span>'+mainRegion+'</span>';		
				})
				item.region_sub.forEach((subRegion)=>{
				htmlText+='<span>'+subRegion+'</span>';		
				})
				htmlText+='<p>'+item.theme+'</p>';
				htmlText+='<p>'+item.sdate+'~'+item.edate+'</p>';
				htmlText+='<p>'+item.current_people+'/'+item.total_people+'</p>';
				htmlText+='<p>'+item.estimate_cost+'</p>';
				htmlText+='<p>'+item.gender+'</p>';
				item.age.forEach((ages)=>{
				htmlText+='<span>'+ages+'</span>';		
				})
				htmlText+='<p>'+item.reg_date+'</p>';
			htmlText+='</div>';
		htmlText+='</li>';
	}
	$(".list-group").append(htmlText);	
	
	if(pageNo < total_page) {
		sentinel.setAttribute('data-loading', 'false');
		sentinel.style.display = 'block';
		
		io.observe(sentinel);
	}
}

const ioCallback = (entries, io) => {
	entries.forEach((entry) => {
		if(entry.isIntersecting) {
			let loading = sentinel.getAttribute('data-loading');
			if(loading !== 'false') {
				return;
			}
			
			io.unobserve(entry.target);
			
			let pageNo = parseInt(scroll.getAttribute('data-pageNo'));
			let total_page = parseInt(scroll.getAttribute('data-totalPage'));
			
			if(pageNo === 0 || pageNo < total_page) {
				pageNo++;
				scroll_load(pageNo);
			}
		}
	});
};

const io = new IntersectionObserver(ioCallback);
io.observe(sentinel);

$(function(){
	listPage(1);
});
</script>