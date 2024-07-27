<%@ page contentType="text/html; charset=UTF-8"%>
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
.card footer span, .card-body h3, .card-body p {
	font-weight: bold;
}
.carousel-control-prev-icon {
	background-color: gray;
}
.carousel-control-next-icon {
	background-color: gray;
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
.color-text {
    	color: #18A8F1;
    	font-weight: bold;
    }
</style>

<div class="container border border-top-0 border-bottom-0">
    <div class="body-container">
    		<div class="search-form-container">
				<form class="d-flex" name="searchForm" action="${pageContext.request.contextPath}/companion/search">
					<div class="input-group">
						<span class="input-group-text"><i class="p-2 bi bi-search"></i></span>
						<input name="kwd" type="text" class="p-3 form-control" placeholder="">
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
		      <button class="btn btn-outline-secondary" value="경북">경북</button>
		      <button class="btn btn-outline-secondary" value="경남">경남</button>
		      <button class="btn btn-outline-secondary" value="전북">전북</button>
		      <button class="btn btn-outline-secondary" value="전남">전남</button>
		      <button class="btn btn-outline-secondary" value="제주">제주</button>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button">
		    <span class="carousel-control-prev-icon" aria-hidden="true" data-bs-target="#selectAreabtn" data-bs-slide="prev"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button">
		    <span class="carousel-control-next-icon" aria-hidden="true" data-bs-target="#selectAreabtn" data-bs-slide="next"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		<hr>
    	<h2 class="color-text">지역 별 최신 글</h2>
    	<div id="areaList-carousel" class="carousel slide">
			<div class="carousel-inner px-3">
				<div class="carousel-item active"></div>
				<div class="carousel-item"></div>
				<div class="carousel-item"></div>
			</div>
			<button class="carousel-control-prev" type="button">
				<span class="carousel-control-prev-icon" aria-hidden="true"  data-bs-target="#areaList-carousel" data-bs-slide="prev"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button">
				<span class="carousel-control-next-icon" aria-hidden="true"  data-bs-target="#areaList-carousel" data-bs-slide="next"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<hr>
		<h2 class="color-text">지역 별 인기 글</h2>
    	<div id="areaPopularList-carousel" class="carousel slide">
			<div class="carousel-inner px-3">
				<div class="carousel-item active"></div>
				<div class="carousel-item"></div>
				<div class="carousel-item"></div>
			</div>
			<button class="carousel-control-prev " type="button">
				<span class="carousel-control-prev-icon" aria-hidden="true" data-bs-target="#areaPopularList-carousel" data-bs-slide="prev"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button">
				<span class="carousel-control-next-icon" aria-hidden="true"  data-bs-target="#areaPopularList-carousel" data-bs-slide="next"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<hr>
		<div class="row">
			<button class="col btn btn-outline-secondary"onclick="writeForm();" data-bs-toggle="modal" data-bs-target="#alertModal">동행 구인 작성</button>
			<button class="col btn btn-outline-secondary"onclick="myArticle();" data-bs-toggle="modal" data-bs-target="#alertModal">내 동행 확인하기</button>
		</div>
		<hr>
		<div class="row">
			<h2 class="col color-text">전체 글</h2>
			<div class="col color-text">
				성별
				<input type="radio" value="all" name="gender" checked>남/여
				<input type="radio" value="male" name="gender">남자만
				<input type="radio" value="female" name="gender">여자만
			</div>
			<div class="col color-text">
				연령대
				<select name="age">
					<option value="all" selected>모두</option>
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대 이상</option>
				</select>
			</div>
		</div>
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
<div class="modal" id="alertModal" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
<script type="text/javascript">
$(function(){
	$("input[name=gender]").change(function(){
		$('.list-group-item').prevAll().remove();
		listPage(1);
	});
	
	
	$("select[name=age]").change(function(){
		$('.list-group-item').prevAll().remove();		
		listPage(1);	
	});
	
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
	console.log(data)
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
			htmlText+='<div class="col">';
			htmlText+='	<div class="travel-info-item" onclick="article('+data.list[i].num+');">';
			htmlText+='	<img src="${pageContext.request.contextPath}/uploads/companion/'+data.list[i].saveFilename+'" onerror=this.src="${pageContext.request.contextPath}/resources/images/noimage.png">';
			htmlText+='	<div class="travel-info-item-body">';
			htmlText+='		<a class="travel-info-item-title" href="">'+data.list[i].subject+'</a>';
			htmlText+='		<p class="travel-info-item-location">';
			for(let j=0;j<data.list[i].region_main.length;j++) {
				htmlText+='		<i class="bi bi-geo-alt-fill">'+data.list[i].region_main[j]+' '+data.list[i].region_sub[j]+'</i></p>';
			}	
			htmlText+='		<span class="travel-info-item-tags">#'+data.list[i].theme+' #'+data.list[i].age+'대 #';
			switch (data.list[i].gender) {
				case "male" : htmlText+='남자만</span>'; break;
				case "female" : htmlText+='여자만</span>'; break;
				default : htmlText+='남/여</span>'; break;
			}
			htmlText+='</div></div></div>';
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
			htmlText+='<div class="col">';
			htmlText+='	<div class="travel-info-item" onclick="article('+data.list[i].num+');">';
			htmlText+='	<img src="${pageContext.request.contextPath}/uploads/companion/'+data.list[i].saveFilename+'" onerror=this.src="${pageContext.request.contextPath}/resources/images/noimage.png">';
			htmlText+='	<div class="travel-info-item-body">';
			htmlText+='		<a class="travel-info-item-title" href="">'+data.list[i].subject+'</a>';
			htmlText+='		<p class="travel-info-item-location">';
			for(let j=0;j<data.list[i].region_main.length;j++) {
				htmlText+='		<i class="bi bi-geo-alt-fill">'+data.list[i].region_main[j]+' '+data.list[i].region_sub[j]+'</i></p>';
			}	
			htmlText+='		<span class="travel-info-item-tags">#'+data.list[i].theme+' #'+data.list[i].age+'대 #';
			switch (data.list[i].gender) {
				case "male" : htmlText+='남자만</span>'; break;
				case "female" : htmlText+='여자만</span>'; break;
				default : htmlText+='남/여</span>'; break;
			}
			htmlText+='</div></div></div>';
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
	let gender=$("input[name=gender]:checked").val();
	let age=$("select[name=age] option:selected").val();
	let query="pageNo="+page+"&gender="+gender+"&age="+age;

	
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
		htmlText+='	<img src="${pageContext.request.contextPath}/uploads/companion/'+item.saveFilename+'" class="card-img-top" onerror=this.src="${pageContext.request.contextPath}/resources/images/noimage.png">';
		htmlText+='		<div class="card-body">';
		htmlText+='<a href="#">#'+item.age+'대 </a>';
		switch (item.gender) {
			case "male" : htmlText+='<a href="#">#남자만 </a>'; break;
			case "female" : htmlText+='<a href="#">#여자만 </a>'; break;
			default : htmlText+='<a href="#">#남/여 </a>'; break;
		}
		htmlText+='<a href="#">#'+item.theme+' </a>';
		htmlText+='		<h3>'+item.subject+'</h2>';
		htmlText+='		<p>'+item.content+'</p>';
		for(let idx=0;idx<item.region_main.length;idx++) {
			htmlText+='<span class="card-text">'+item.region_main[idx]+' '+item.region_sub[idx]+' </span>';
		}
		htmlText+='		<footer><p>'+item.sdate+'~'+item.edate+'</p>';
		htmlText+='		</footer></div>';
		htmlText+='	</div>';
		htmlText+='</li>';
		$(".list-group").prepend(htmlText);	
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
	if(${empty sessionScope.member}) {
		$('#alertModal .modal-title').text("글 작성은 로그인 후에만 가능합니다.");
		return;
	}
	$('#alertModal').html('');
	location.href='${pageContext.request.contextPath}/companion/write';
}
function myArticle() {
	if(${empty sessionScope.member}) {
		$('#alertModal .modal-title').text("내 동행 확인은 로그인 후에만 가능합니다.");
		return;
	}
	$('#alertModal').html('');
	location.href='${pageContext.request.contextPath}/mypage/companion';
}
function article(num) {
	location.href='${pageContext.request.contextPath}/companion/article?num='+num;
}
</script>