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
.item-list>div {
	margin: 0px;
	padding: 0px;
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
.hero-header {
	background-image: url('/dds/resources/images/숙소_예시.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}
</style>

<div class="container">
	<div class="body-title">
		<div class="container-fluid py-5 mb-3 hero-header">
			<div class="row m-2 g-5 align-items-center">
				<div class="col-md-12">
					<h2 class="mb-1 text-light display-5" style="font-weight: 600;">두둥실
						떠나는</h2>
					<h2 class="mb-1 text-light display-5" style="font-weight: 600;">신나는
						여행</h2>
					<div class="search-form-container">
						<div class="row m-2 gx-5 align-items-center">
							<div class="search-form-container">
								<form class="d-flex" name="searchForm"
									action="${pageContext.request.contextPath}/info/search">
									<div class="input-group">
										<span class="input-group-text"><i class="p-2 bi bi-search"></i></span>
										<input name="kwd" type="text" class="p-3 form-control" placeholder="원하는 여행 정보를 검색하세요">
										<select class="input-group-text" name="schType">
											<option value="all" selected>전체</option>
											<option value="name">이름</option>
											<option value="region">지역</option>
											<option value="tag">태그</option>
										</select>
										<button type="button" onclick="kwdCheck();" class="btn btn-primary">검색</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	<div class="body-container">	
		<div class="body-main">
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
			<div>
				<p>인기글</p>
				
				<div class="popular-list-content" data-pageNo="0" data-totalPage="0"></div>
				<div class="popular-list-footer mt-2 text-end">
					<span class="more-btn btn btn-light">&nbsp;더보기&nbsp;<i class="bi bi-chevron-down"></i>&nbsp;</span>
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
	popularListPage(1);
});
function popularListPage(page) {
	let url='${pageContext.request.contextPath}/info/popularInfoList';
	let formData="dataCount=${dataCount}&pageNo="+page;
	
	const fn=function(data) {
		nextPopularList(data);
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}


function listPage(page) {
	let url='${pageContext.request.contextPath}/info/infoList';
	let formData="dataCount=${dataCount}&pageNo="+page;
	
	const fn=function(data) {
		addNewContent(data);
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}

function nextPopularList(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	$('.popular-list-content').attr('data-pageNo', pageNo);
	$('.popular-list-content').attr('data-totalPage', total_page);

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
		
		htmlText+='<div class="col">';
		htmlText+='	<span class="card" onclick="article('+num+','+contentId+');">';
		htmlText+='		<img src="'+thumbnail+'" class="card-img-top" alt="...">';
		htmlText+='		<span class="card-body">';
		htmlText+='			<p>'+name+'</p>';
		htmlText+='			<p class="card-text">'+region_Main+' '+region_Sub+'</p><footer>';
		tags.forEach((tag)=>{
			htmlText+='			<span>#'+tag+'</span>';		
		})
		htmlText+='		</footer></span>';
		htmlText+='	</span>';
		htmlText+='</div>';
	}
	htmlText+='</div><br>';
	$(".popular-list-content").append(htmlText);	
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
		
		htmlText+='<div class="col">';
		htmlText+='	<span class="card" onclick="article('+num+','+contentId+');">';
		htmlText+='		<img src="'+thumbnail+'" class="card-img-top" alt="...">';
		htmlText+='		<span class="card-body">';
		htmlText+='			<p>'+name+'</p>';
		htmlText+='			<p class="card-text">'+region_Main+' '+region_Sub+'</p><footer>';
		tags.forEach((tag)=>{
			htmlText+='			<span>#'+tag+'</span>';		
		})
		htmlText+='		</footer></span>';
		htmlText+='	</span>';
		htmlText+='</div>';
	}
	htmlText+='</div><br>';
	$(".list-content").append(htmlText);	
}

$(function(){
	$('.list-footer .more-btn').click(function(){
		let pageNo = $('.list-content').attr('data-pageNo');		
		let total_page = $('.list-content').attr('data-totalPage');
		
		pageNo++;
		if(pageNo>=total_page) {
			$('.list-footer .more-btn').hide();
			listPage(pageNo);
		} else {
			listPage(pageNo);
		}
	});
	
	$('.popular-list-footer .more-btn').click(function(){
		let pageNo = $('.popular-list-content').attr('data-pageNo');
		let total_page = $('.popular-list-content').attr('data-totalPage');
		
		pageNo++;
		if(pageNo>=total_page) {
			$('.popular-list-footer .more-btn').hide();
			popularListPage(pageNo);
		} else {
			popularListPage(pageNo);
		}
	});
});

function article(num, contentId) {
	location.href="${pageContext.request.contextPath}/info/load?num="+num+"&contentId="+contentId;
}
</script>