<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
*	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
 * @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
} }
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
.scroll-list {
	height: 600px;
	margin-top: 10px;
	overflow-y: auto;
}
.scroll-list ul {
	padding: 0px;
}
.scroll-list li {
	margin-bottom: 10px;
}
.scroll-list .card img {
	width: 25%;
}
.card p {
	margin: 0px;
}
.card-body * {
	word-break: keep-all;
}
.carousel-item img {
	border-radius: 10%;
	height: 500px;
}
.list-content {
	margin-top: 10px;
}
.hero-header {
	background-image: url('/dds/resources/images/infomain.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}
.card footer span, .card-body h3, .card-body p {
	font-weight: bold;
}
    .travel-info-item {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        overflow: hidden;
        transition: box-shadow 0.3s;
        background-color: white;
        margin-bottom: 20px;
        position: relative;
    }
    .travel-info-item:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .travel-info-item img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
    .travel-info-item-body {
        padding: 16px;
    }
    .travel-info-item-title {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }
    .travel-info-item-location {
        font-size: 14px;
        color: #777;
        margin: 8px 0;
    }
    .travel-info-item-location i {
        color: #00AEEF;
        margin-right: 5px;
    }
    .travel-info-item-tags {
        font-size: 12px;
        color: #999;
    }
</style>
		<div class="container-fluid py-5 mb-3 hero-header">
			<div class="row m-2 g-5 align-items-center">
				<div class="col-md-12">
					<h2 class="mb-1 text-light display-5" style="font-weight: 600;">두둥실
						떠나는</h2>
					<h2 class="mb-1 text-light display-5" style="font-weight: 600;">신나는
						여행</h2>
					<div class="container mt-4">
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
	<div class="container border border-top-0 border-bottom-0">
			<div id="info-carousel" class="carousel slide">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#info-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#info-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#info-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="${pageContext.request.contextPath}/resources/images/infobanner1.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/images/infobanner2.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="${pageContext.request.contextPath}/resources/images/infobanner3.png" class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#info-carousel" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#info-carousel" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			<hr>
	<div class="body-container">	
		<div class="body-main">
			<div>
				<h3>인기글</h3>
				<div class="scroll-list">
					<ul>
						<li>
							<div class="sentinel-1" data-loading="false"></div>
						</li>
					</ul>
				</div>
				<hr>
				<div>
				<div class="row justify-content-between">
					<h3 class="col">전체 글 ${dataCount}건</h3>
					<div class="col text-end">
						<button type="button" class="btn listTypebtn1 active" data-bs-toggle="button">가나다순</button>
						<button type="button" class="btn listTypebtn2" data-bs-toggle="button">인기순</button>
					</div>
				</div>
				<div class="list-content" data-pageNo="0" data-totalPage="0"></div>
				<div class="list-footer mt-2 text-end">
					<span class="more-btn btn btn-light">&nbsp;더보기&nbsp;<i class="bi bi-chevron-down"></i>&nbsp;</span>
				</div>
				<br>
			</div>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
const sentinel_1 = document.querySelector('.sentinel-1')
const scroll_1 = document.querySelector('.scroll-list ul');

function loadContent1(page) {
	let url="${pageContext.request.contextPath}/info/popularInfoList";
	let query="pageNo="+page;
	
	const fn = function(data) {
		scroll_1_load(data);
	};
	
	ajaxFun(url, "get", query, "json", fn);
}

function scroll_1_load(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	scroll_1.setAttribute('data-pageNo', pageNo);
	scroll_1.setAttribute('data-totalPage', total_page);
	
	sentinel_1.style.display = 'none';
	
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
		
		htmlText='<li><div class="card flex-row" onclick="article('+num+','+contentId+');">';
		htmlText+='	<img src="'+thumbnail+'" class="card-img-top" alt="...">';
		htmlText+='		<div class="card-body">';
		htmlText+='			<h3>'+name+'</h3>';
		htmlText+='			<span class="card-text">'+region_Main+' '+region_Sub+'</span><footer>';
		tags.forEach((tag)=>{
			htmlText+='			<span>#'+tag+'</span>';		
		})
		htmlText+='		</footer></div>';
		htmlText+='	</div>';
		htmlText+='</li>';
		
		sentinel_1.insertAdjacentHTML('beforebegin', htmlText);
	}
		
	if(pageNo < total_page) {
		sentinel_1.setAttribute('data-loading', 'false');
		sentinel_1.style.display = 'block';
		
		io1.observe(sentinel_1);
	}
}

const ioCallback1 = (entries, io1) => {
	entries.forEach((entry) => {
		if(entry.isIntersecting) { // 관찰자가 화면에 보이면
			// 현재 페이지가 로딩중이면 빠져 나감
			let loading = sentinel_1.getAttribute('data-loading');
			if(loading !== 'false') {
				return;
			}
			
			// 기존 관찰하던 요소는 더이상 관찰하지 않음
			io1.unobserve(entry.target);
			
			let pageNo = parseInt(scroll_1.getAttribute('data-pageNo'));
			let total_page = parseInt(scroll_1.getAttribute('data-totalPage'));
			
			if(pageNo === 0 || pageNo < total_page) {
				pageNo++;
				loadContent1(pageNo);
			}
		}
	});
};

const io1 = new IntersectionObserver(ioCallback1); // 관찰자 초기화
io1.observe(sentinel_1); // 관찰할 요소 등록 
</script>

<script type="text/javascript">
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
	loadContent1(1);
	listPage(1);
});

function popularListPage(page) {
	$('.listTypebtn2').addClass("active");
	
	let url='${pageContext.request.contextPath}/info/popularInfoListall';
	let formData="dataCount=${dataCount}&pageNo="+page;
	
	const fn=function(data) {
		nextPopularList(data);
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}


function listPage(page) {
	$('.listTypebtn1').addClass("active");
	
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
	
	$('.list-content').attr('data-pageNo', pageNo);
	$('.list-content').attr('data-totalPage', total_page);

	let htmlText='<div class="row item-list">';
	
	for(let index=0;index<data.list.length;index++) {
		if(index%4==0&&index>0) {
			htmlText+='</div><br>';
			htmlText+='<div class="row item-list">';
		}
		let num = data.list[index].num;
		let region_Main = data.list[index].region_Main;
		let region_Sub = data.list[index].region_Sub;
		let contentId = data.list[index].contentId;
		let contentType = data.list[index].contentType;
		let name=data.list[index].name;
		let thumbnail=data.list[index].thumbnail;
		let main_Category=data.list[index].main_Category;
		let middle_Category=data.list[index].middle_Category;
		let sub_Category=data.list[index].sub_Category;
		let tags=data.list[index].tags;
		
		htmlText+='<div class="col">';
		htmlText+='	<div class="travel-info-item" onclick="article('+num+','+contentId+');">';
		htmlText+='	<img src="'+thumbnail+'" alt="...">';
		htmlText+='	<div class="travel-info-item-body">';
		htmlText+='		<a class="travel-info-item-title" href="">'+name+'</a>';
		htmlText+='		<p class="travel-info-item-location">';
		htmlText+='		<i class="bi bi-geo-alt-fill">'+region_Main+' '+region_Sub+'</i></p>';
		tags.forEach((tag)=>{
		htmlText+='		<span class="travel-info-item-tags">#'+tag+'</span>';
		});
		htmlText+='</div></div></div>';
	}
	htmlText+='</div><br>';
	$(".list-content").append(htmlText);
}

function addNewContent(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	$('.list-content').attr('data-pageNo', pageNo);
	$('.list-content').attr('data-totalPage', total_page);

	let htmlText='<div class="row item-list">';
	
	for(let index=0;index<data.list.length;index++) {
		if(index%4==0&&index>0) {
			htmlText+='</div><br>';
			htmlText+='<div class="row item-list">';
		}
		let num = data.list[index].num;
		let region_Main = data.list[index].region_Main;
		let region_Sub = data.list[index].region_Sub;
		let contentId = data.list[index].contentId;
		let contentType = data.list[index].contentType;
		let name=data.list[index].name;
		let thumbnail=data.list[index].thumbnail;
		let main_Category=data.list[index].main_Category;
		let middle_Category=data.list[index].middle_Category;
		let sub_Category=data.list[index].sub_Category;
		let tags=data.list[index].tags;
		
		htmlText+='<div class="col">';
		htmlText+='	<div class="travel-info-item" onclick="article('+num+','+contentId+');">';
		htmlText+='	<img src="'+thumbnail+'" alt="...">';
		htmlText+='	<div class="travel-info-item-body">';
		htmlText+='		<a class="travel-info-item-title" href="">'+name+'</a>';
		htmlText+='		<p class="travel-info-item-location">';
		htmlText+='		<i class="bi bi-geo-alt-fill">'+region_Main+' '+region_Sub+'</i></p>';
		tags.forEach((tag)=>{
		htmlText+='		<span class="travel-info-item-tags">#'+tag+'</span>';
		});
		htmlText+='</div></div></div>';
	}
	htmlText+='</div><br>';
	$(".list-content").append(htmlText);	
}

$(function(){
	$('.listTypebtn1').click(function() {
		$('.listTypebtn2').removeClass("active");
		$('.list-content').html("");
		listPage(1);
	});
	
	$('.listTypebtn2').click(function() {
		$('.listTypebtn1').removeClass("active");
		$('.list-content').html("");
		popularListPage(1);
	});
	
	$('.list-footer .more-btn').click(function(){
		let pageNo = $('.list-content').attr('data-pageNo');
		let total_page = $('.list-content').attr('data-totalPage');
		pageNo++;
		
		if($(".listTypebtn1").hasClass("active") === true) {
			if(pageNo>=total_page) {
				$('.list-footer .more-btn').hide();
				listPage(pageNo);
			} else {
				listPage(pageNo);
			}
		} else if($(".listTypebtn2").hasClass("active") === true) {	
			if(pageNo>=total_page) {
				$('.list-footer .more-btn').hide();
				popularListPage(pageNo);
			} else {
				popularListPage(pageNo);
			}
		}
	});
});

function article(num, contentId) {
	location.href="${pageContext.request.contextPath}/info/load?num="+num+"&contentId="+contentId;
}
</script>