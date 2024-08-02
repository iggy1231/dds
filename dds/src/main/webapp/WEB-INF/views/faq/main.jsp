<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
p {
	margin: 0px;
}

@media (max-width: 911.98px) {
	a, input, button, div, li, textarea, form, label, select {
		outline: 2px solid transparent;
		outline-offset: 2px;
		outline-width: 0px;
	}
	
	.css-1ptfr4r {
		width: 100%;
		padding-top: 8px;
	}
	
	.css-xbigzi {
		padding-left: 20px;
		padding-right: 20px;
	}
	
	.css-4ic6fj {
		display: flex;
		padding-top: 24px;
		padding-bottom: 24px;
	}
	
	.css-4ic6fj .gc-box-button {
		margin-top: 20px;
	}
	
	.css-140ci6h {
		margin-top: 16px;
		padding-left: 20px;
		padding-right: 20px;
	}
}

a, input, button, div, li, textarea, form, label, select {
		-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
		outline: 2px solid transparent;
		outline-offset: 2px;
		outline-width: 0px;
	}
	
.css-4ic6fj .gc-box-button {
		width: 148px;
		margin-top: 20px;
	}
	
.css-4ic6fj .gc-box-button svg{
		fill: rgb(194, 194, 194);
	}

.css-a1gmol svg {
	height: 20px;
	width: 20px;
	fill: rgb(51, 51, 51);
}
	
.css-xbigzi {
		padding-left: 20px;
		padding-right: 20px;
	}
	
.css-a1gmol {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	curosr: pointer;
	height: 48px;
	border-radius: 10px;
	border-width: 2px;
	font-size: 1rem;
	line-height: normal;
	letter-spacing: 0px;
	font-weight: 600;
	width: 100%;
	background-color: rgb(255, 255, 255);
	--tw-text-opacity: 1;
	color: rgb(51 51 51 / var(--tw-text-opacity));
	--tw-border-opacity: 1;
	border-color: rgb(235 235 235 / var(--tw-border-opacity));
	padding: 10px; 18px; 10px; 16px;
	
}

.css-1ptfr4r {
		margin-left: auto;
		margin-right: auto;
		max-width: 894px;
		padding-bottom: 96px;
		width: 100%;
		padding-top: 8px;
	}


.css-6dsmwj {
	padding-top: 16px;
	padding-bottom: 20px; 
}


.css-4ic6fj {
		width: 100%;
		-webkit-box-align: center;
		align-items: center;
		-webkit-box-pack: justify;
		justify-content: space-between;
		border-radius: 10px;
		--tw-bg-opacity: 1;
		background-color: rgb(245 247 250 / var(--tw-bg-opacity));
		padding-left: 24px;
		padding-right: 24px;
		display: flex;
		padding-top: 24px;
		padding-bottom: 24px;
	}
	
.css-1j5gilz {
	margin-bottom: 8px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	font-size: 1.25rem;
	line-height: normal;
	letter-spacing: 0px;
	font-weight: 700;
	--tw-text-opacity: 1;
	color: rgb(51 51 51 / var(--tw-text-opacity));
}

.css-1j5gilz svg{
	margin-right: 8px;
	fill : rgb(194, 194, 194);
	display: block;
	vertical-align: middle;
}

.css-7qtftm {
	font-size: 0.8125rem;
	line-height: 1.25rem;
	letter-spacing: 0px;
	--tw-text-opacity: 1;
	color: rgb(153 153 153 / var(--tw-text-opacity));
}
	
.css-117epsa {
	margin-top: 2px;
	margin-bottom: 2px;
	font-size: 1.5rem;
	line-height: normal;
	letter-spacing: 0px;
	font-weight: 700;
	--tw-text-opacity: 1;
	color: rgb(51 51 51 / var(--tw-text-opactiy));
}

.css-1cjo2yk {
	margin-top: 4px;
	font-size: 1rem;
	line-height: 1.5rem;
	letter-spacing: 0px;
	--tw-text-opacity: 1;
	color: rgb(153 153 153 / var(--tw-text-opacity));
}

.css-140ci6h {
	margin-top: 16px;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 16px;
	padding-bottom: 16px;
	font-size: 1.125rem;
	line-height: normal;
	letter-spacing: 0px;
	font-weight: 700;
	--tw-text-opacity: 1;
	color: rgb(51 51 51 / var(--tw-text-opactiy));
}

.css-faq{
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 16px;
}

.css-1sppzbr {
	margin-bottom: 8px;
}

.css-1l5q1e2 {
	display:flex;
	width: 100%;
	padding-bottom: 12px;
}

.css-rejq6k {
	display:flex;
	width: 100%;
	overflow-x: auto;
	overscroll-behavior: none;
	gap: 6px 8px;
	flex-wrap: wrap;
}

.css-1ax683h {
	height: 32px;
	max-width: 212px;
	padding: 8px; 16px;
	font-size: 0.8125rem;
	line-height: 0.8125rem;
	letter-spacing: 0px;
	font-weight: 600;
	flex: 0 0 auto;
	cursor: pointer;
	-webkit-box-align: center;
	display: block;
	overflow: ellipsis;
	white-space: nowrap;
	border-radius: 100px;
	border-width: 1.5px;
	--tw-bg-opacity: 1;
	background-color: #18A8F1;
	color: #ffffff;
}

.css-12z0wuy {
	margin-right: 8px;
}

ol, ul {
    padding-left: 0rem;
}
</style>

<section class="css-1ptfr4r">
	<div class="css-xbigzi">
		<div class="css-6dsmwj">
			<h1 class="css-117epsa">고객센터</h1>
			<p class="css-1cjo2yk">어려움이나 궁금한 점이 있으신가요?</p>
		</div>
		<article class="css-4ic6fj">
			<div>
				<div class="css-1j5gilz">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" class="bi bi-telephone-fill" viewBox="0 0 16 16">
  						<path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
					</svg>
					1588-2580
				</div>
				<section class="css-7qtftm">
					<p>예약·취소 문의</p>
					<p>오전 9시 ~ 새벽 3시</p>
				</section>
			</div>
			<button class="gc-box-button css-a1gmol" type="button">
				<span class="css-12z0wuy">
					<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" class="bi bi-chat-fill" viewBox="0 0 20 20">
  						<path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9 9 0 0 0 8 15"/>
					</svg>	
				</span>
				<span>카카오 문의</span>
			</button>
		</article>
		</div>
		<h2 class="css-140ci6h">자주 묻는 질문</h2>
		<div class="css-faq">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="0" aria-selected="true" data-category_Num="0">모두</button>
				</li>
				<c:forEach var="dto" items="${listCategory}" varStatus="status">
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-${status.count}" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="${status.count}" aria-selected="true" data-category_Num="${dto.categoryNum}">${dto.category}</button>
					</li>
				</c:forEach>
			</ul>
			
			<div class="tab-content pt-2" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content"></div>
				
				<div class="row py-3">
					<div class="col">
						<button type="button" class="btn btn-light" onclick="reloadFaq();" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
					</div>
					<div class="col-6 text-center">
						<form class="row" name="searchForm" method="post">
							<div class="col-auto p-1">
								<select name="schType" id="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
									<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
									<option value="content" ${schType=="content"?"selected":""}>내용</option>
								</select>
							</div>
							<div class="col-auto p-1">
								<input type="text" name="kwd" id="kwd" value="${kwd}" class="form-control">
							</div>
							<div class="col-auto p-1">
								<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
							</div>
						</form>
					</div>
					<div class="col text-end">&nbsp;</div>
				</div>				
			</div>
              
     </div>
</section>

<form name="faqSearchForm" method="post">
	<input type="hidden" name="schType" value="all">
    <input type="hidden" name="kwd" value="">
</form>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
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
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

$(function(){
	listPage(1);
	
    $("button[role='tab']").on("click", function(e){
		// const tab = $(this).attr("aria-controls");
    	listPage(1);
    	
    });
});

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $("button[role='tab'].active");
	let category_Num = $tab.attr("data-category_Num");
	
	let url = "${pageContext.request.contextPath}/faq/list";
	let query = "pageNo="+page+"&categoryNum="+category_Num;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}

// 검색
function searchList() {
	const f = document.faqSearchForm;
	f.schType.value = $("#schType").val();
	f.kwd.value = $.trim($("#kwd").val());

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	listPage(1);
}
</script>