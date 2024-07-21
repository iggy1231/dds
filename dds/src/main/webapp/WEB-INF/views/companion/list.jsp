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
.scroll-list .card img {
	width: 25%;
}
.scroll-list {
	overflow-y: auto;
	height: 600px;
}
.carousel-item {
	text-align: center;
}
</style>

<div class="container">
    <div class="body-container">
    		<div class="search-form-container">
				<form class="d-flex" name="searchForm" action="${pageContext.request.contextPath}/companion/search">
					<div class="input-group">
						<span class="input-group-text"><i class="p-2 bi bi-search"></i></span>
						<input name="kwd" type="text" class="p-3 form-control" placeholder="">
						<select class="input-group-text" name="schType">
						</select>
						<input name="mainRegion" type="hidden" value="전체">
						<button type="button" onclick="kwdCheck();" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
    	<hr>
    	<div id="selectAreabtn" class="carousel slide">
		  <div class="carousel-inner" data-pageNo="0" data-totalPage="0">
		    <div class="carousel-item active">
		      <button class="btn btn-outline-secondary active" value="전체">전체</button>
		      <button class="btn btn-outline-secondary" value="서울">서울</button>
		      <button class="btn btn-outline-secondary" value="인천">인천</button>
		      <button class="btn btn-outline-secondary" value="대전">대전</button>
		      <button class="btn btn-outline-secondary" value="대구">대구</button>
		      <button class="btn btn-outline-secondary" value="광주">광주</button>
		      <button class="btn btn-outline-secondary" value="부산">부산</button>
		      <button class="btn btn-outline-secondary" value="울산">울산</button>
		      <button class="btn btn-outline-secondary" value="세종">세종</button>
		    </div>
		    <div class="carousel-item">
		      <button class="btn btn-outline-secondary" value="경기">경기</button>
		      <button class="btn btn-outline-secondary" value="강원">강원</button>
		      <button class="btn btn-outline-secondary" value="충북">충북</button>
		      <button class="btn btn-outline-secondary" value="충남">충남</button>
		      <button class="btn btn-outline-secondary" value="경상">경상</button>
		      <button class="btn btn-outline-secondary" value="경남">경남</button>
		      <button class="btn btn-outline-secondary" value="전북">전북</button>
		      <button class="btn btn-outline-secondary" value="전남">전남</button>
		      <button class="btn btn-outline-secondary" value="제주">제주</button>
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
    	<p>지역 별 최신 글
    	<div id="areaList-carousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active"></div>
				<div class="carousel-item"></div>
				<div class="carousel-item"></div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#areaList-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#areaList-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<hr>
		<p>지역 별 인기 글
    	<div id="areaPopularList-carousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active"></div>
				<div class="carousel-item"></div>
				<div class="carousel-item"></div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#areaList-carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#areaList-carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<hr>
		<button onclick="writeForm();">동행 구인 작성</button>
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
$(function(){
	$('.carousel-item .btn').click(function(){
		let mainRegion=$(this).val();
		
		$('.carousel-item .btn').removeClass('active');
		$(this).addClass('active');
		
		const f=document.searchForm;
		f.mainRegion.value=mainRegion;
		
		nextPage(mainRegion);
		nextPage2(mainRegion);
	}); 
});
function kwdCheck() {
	const f=document.searchForm;
	if(f.kwd.value=="") {
		f.kwd.focus();
		alert("검색어를 입력하세요");
		return;
	}
	
	if( !/^[ㄱ-ㅎ가-힣a-zA-Z0-9]+$/i.test(f.kwd.value) ) { 
		alert("한글, 영어 또는 숫자만 입력 가능합니다");
		f.kwd.focus();
		return;
	}
	
	f.submit();
}

function nextPage(mainRegion) {
	let url="${pageContext.request.contextPath}/companion/areaCompanionList";
	let query="&mainRegion="+mainRegion;
	
	const fn=function(data) {
		addNextPage(data);
	};
	
	ajaxFun(url, 'get', query, 'json', fn);
} 

function nextPage2(mainRegion) {
	let url="${pageContext.request.contextPath}/companion/areaPopularList";
	let query="&mainRegion="+mainRegion;
	
	const fn=function(data) {
		addNextPage2(data);
	};
	
	ajaxFun(url, 'get', query, 'json', fn);
} 

function addNextPage(data) {
	console.log(data);
	$("#areaList-carousel .carousel-item:first").addClass('areaNewList');
	$("#areaList-carousel .carousel-item").html("");
	
	let htmlText='<div class="row">';
	for(let i=0;i<12;i++) {
		if(i%4==0&&i>=data.list.length) {
			break;
		}
		if(i%4==0&&i!=0) {
			htmlText+='</div>';
			$(".areaNewList").append(htmlText);
			htmlText="";
			$(".areaNewList").next().addClass('areaNewList');
			$(".areaNewList:first").removeClass('areaNewList');
			htmlText+='<div class="row">';
		}
		if(i<data.list.length) {
			htmlText+='<div class="col card" onclick="article('+data.list[i].num+')">';
			htmlText+='<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">';
			htmlText+='<div class="card-body"><p>'+data.list[i].subject+'</p>';
			data.list[i].age.forEach((ages)=>{
				htmlText+='<a href="#">'+ages+'대 </a>';
				})
				htmlText+='<a href="">'+data.list[i].gender+'</a>';
			htmlText+='		<h3>'+data.list[i].subject+'</h2>';
			htmlText+='		<p>'+data.list[i].content+'</p>';
			for(let j=0;j<data.list[i].region_main.length;j++) {
				htmlText+='<span class="card-text">'+data.list[i].region_main[j]+' '+data.list[i].region_sub[j]+'</span>';
			}
			htmlText+='</div></div>';
		} else {
			htmlText+='<div class="col"></div>';
		}
	}
	htmlText+='</div>';
	$(".areaNewList").append(htmlText);
	$(".areaNewList:first").removeClass('areaNewList');
}

function addNextPage2(data) {
	console.log(data);
	$("#areaPopularList-carousel .carousel-item:first").addClass('popularNewList');
	$("#areaPopularList-carousel .carousel-item").html("");
	
	let htmlText='<div class="row">';
	for(let i=0;i<12;i++) {
		if(i%4==0&&i>=data.list.length) {
			break;
		}
		if(i%4==0&&i!=0) {
			htmlText+='</div>';
			$(".popularNewList").append(htmlText);
			htmlText="";
			$(".popularNewList").next().addClass('popularNewList');
			$(".popularNewList:first").removeClass('popularNewList');
			htmlText+='<div class="row">';
		}
		if(i<data.list.length) {
			htmlText+='<div class="col card" onclick="article('+data.list[i].num+')">';
			htmlText+='<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">';
			htmlText+='<div class="card-body"><p>'+data.list[i].subject+'</p>';
			data.list[i].age.forEach((ages)=>{
				htmlText+='<a href="#">'+ages+'대 </a>';
				})
				htmlText+='<a href="">'+data.list[i].gender+'</a>';
			htmlText+='		<h3>'+data.list[i].subject+'</h2>';
			htmlText+='		<p>'+data.list[i].content+'</p>';
			for(let j=0;j<data.list[i].region_main.length;j++) {
				htmlText+='<span class="card-text">'+data.list[i].region_main[j]+' '+data.list[i].region_sub[j]+'</span>';
			}
			htmlText+='</div></div>';
		} else {
			htmlText+='<div class="col"></div>';
		}
	}
	htmlText+='</div>';
	$(".popularNewList").append(htmlText);
	$(".popularNewListLfirst").removeClass('popularNewList');
}

const sentinel = document.querySelector('.sentinel');
const scroll = document.querySelector('.scroll-list ul');

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
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
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	scroll.setAttribute('data-pageNo', pageNo);
	scroll.setAttribute('data-totalPage', total_page);
	
	sentinel.style.display = 'none';
	
	
	for(let item of data.list) {
		let htmlText="";
		htmlText='<li><div class="card flex-row" onclick="article('+item.num+')">';
		htmlText+='	<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">';
		htmlText+='		<div class="card-body">';
		item.age.forEach((ages)=>{
			htmlText+='<a href="#">'+ages+'대 </a>';
			})
			htmlText+='<a href="">'+item.gender+'</a>';
		htmlText+='		<h3>'+item.subject+'</h2>';
		htmlText+='		<p>'+item.content+'</p>';
		for(let idx=0;idx<item.region_main.length;idx++) {
			htmlText+='<span class="card-text">'+item.region_main[idx]+' '+item.region_sub[idx]+'</span>';
		}
		htmlText+='		<footer><p>'+item.sdate+'~'+item.edate+'</p>';
		htmlText+='		</footer></div>';
		htmlText+='	</div>';
		htmlText+='</li>';
		$(".list-group").append(htmlText);	
	}
	
	
	
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
				listPage(pageNo);
			}
		}
	});
};

const io = new IntersectionObserver(ioCallback);
io.observe(sentinel);

$(function(){
	listPage(1);
	nextPage('전체');
	nextPage2('전체');
});

function writeForm() {
	location.href='${pageContext.request.contextPath}/companion/write';
}

function article(num) {
	location.href='${pageContext.request.contextPath}/companion/article?num='+num;
}
</script>