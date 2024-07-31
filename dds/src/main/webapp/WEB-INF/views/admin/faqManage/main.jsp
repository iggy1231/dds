<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">



<style type="text/css">
.accordion {
	box-sizing: border-box;
	width: 100%;
	min-height: 50px;
	margin: 15px auto 5px;
	padding: 10px; /* 수정된 부분 */
}

.accordion h3.question {
	box-sizing: border-box;
    color:#333;
    font-weight:500;
    border:1px solid #ccc;
    background-color:#fff;
    padding:10px 15px; /* 패딩 수정 */
    border-radius:4px;	
    cursor:pointer;
    margin: 3px 0 0;
}
.accordion h3.question:hover {
	 background-color: #F8FFFF;
}

.accordion h3.question .q {
	font-weight: 600;
}
.accordion h3.question .subject:hover {
	color: #0d58ba;
}

.accordion div.answer {
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-top: none;
	min-height: 50px;
	padding: 15px; /* 패딩 추가 */
	display: none;
}

.accordion div.answer > .category {
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #eee;
}

.accordion div.answer > .content {
	padding: 10px 15px 5px;
}
.accordion div.answer > .content div:first-child {
	font-weight: 700;
	display: inline-block;
	vertical-align: top;
	padding-left: 5px;
}
.accordion div.answer > .content div:last-child {
	display: inline-block;
}

.accordion div.answer > .update {
	text-align: right;
	padding: 5px 15px; /* 패딩 추가 */
}

.accordion h3.active {
	font-weight: 600;
	background-color: #f8f9fa;
}

ul.tabs li.active {
	background-color: #007bff;
	color: #fff;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

ul.tabs li.active:hover {
	color: #fff;
}

/* 새로운 컨테이너 스타일 */
.tabs-container, .accordion-container {
	width: 100%; /* 수정된 부분 */
	margin: 0 auto; /* 수정된 부분 */
	padding: 0; /* 수정된 부분 */
}

/* tabs 스타일 */
ul.tabs {
	list-style: none;
	padding: 0; /* 수정된 부분 */
	margin: 0; /* 수정된 부분 */
	display: flex;
}

ul.tabs li {
	padding: 10px 15px; /* 패딩 추가 */
	margin-right: 5px; /* 탭 간 간격 추가 */
	cursor: pointer; 
}


.btn1 {
	border: 1px solid #566a7f !important;
	border-radius: 8px; 
	color: #566a7f !important;
	background: white;
	
} 

.btn1:hover {
	border: 1px solid #566a7f !important; 
	background: #566a7f !important;  
	color: white;
}


.btn2 {
	border: 1px solid #696cff;
	border-radius: 8px; 
	background: #696cff;  
	color: white;
	padding: 5px 10px;
}



</style>

<script type="text/javascript">
$(function(){
	$("#tab-content").on("click", ".accordion h3.question", function(){
		 const $answer = $(this).next(".accordion div.answer");
		 let isVisible = $answer.is(':visible');
		 if(isVisible) {
			 $(this).next(".accordion div.answer").hide();
			 $(this).removeClass("active");
		 } else {
			 $(".accordion div.answer").hide();
			 $(".accordion h3.question").removeClass("active");
			 
			 $(this).next(".accordion div.answer").show();
			 $(this).addClass("active");
		 }
	});
});

$(function(){
	let categoryNum = "${categoryNum}";
	let pageNo = "${pageNo}";
	if(pageNo === "") {
		pageNo = 1;
	}
	$("#tab-"+categoryNum).addClass("active bg-primary");
	listPage(pageNo);

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active bg-primary");
		});
		
		$("#tab-"+categoryNum).addClass("active bg-primary");
		
		listPage(1);
	});
});

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

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $(".tabs .active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/admin/faqManage/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#tab-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 검색
function searchList() {
	const f = document.faqSearchForm;
	f.schType.value = $("#schType").val();
	f.kwd.value = $("#kwd").val().trim();

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	$("#schType").val("all");
	$("#kwd").val("");
	
	listPage(1);
}

// 글 삭제
function deleteFaq(num, page) {
	var url = "${pageContext.request.contextPath}/admin/faqManage/delete";
	var query = "num="+num;
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? ")) {
		  return;
	}
	
	const fn = function(data){
		listPage(page);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}
</script>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
    
    <div class="body-title mb-3">
		<span class="ps-3 fw-semibold fs-3 text-center mb-3 text-primary"><i class='fs-3 bx bx-clipboard'></i> 자주하는 질문 </span>
    </div>
    
    <div class="card">
		<div class="card-header pb-0 ">
			<ul class="tabs">
				<li id="tab-0" data-categoryNum="0">모두</li>
				<c:forEach var="dto" items="${listCategory}">
					<li id="tab-${dto.categoryNum}" data-categoryNum="${dto.categoryNum}">${dto.category}</li>
				</c:forEach>
			</ul>
		<div id="tab-content" class="table-responsive text-nowrap accordion-container">
		</div>
		<div class="mb-3"> 
			<span style="margin-left: 140px;">   
				<select id="schType" name="schType" class="col-auto p-1" style="width: 130px; border: 1px solid #566a7f; border-radius: 8px; color: #566a7f;">   
					<option value="all" ${schType=="all"?"selected":""}>제목+내용</option> 
					<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
					<option value="content" ${schType=="content"?"selected":""}>내용</option>
				</select>
				<input type="text" id="kwd" name="kwd" class="col-auto p-1" value="${kwd}" style="width: 400px; border: 1px solid #566a7f; border-radius: 8px;">
			  
				<button type="button" class="btn1" onclick="searchList();"><i class="bi bi-search"></i></button> 
				<button type="button" class="btn2" onclick="location.href='${pageContext.request.contextPath}/admin/faqManage/write';" style="margin-left: 60px;">글올리기</button>
			</span>  
		</div>
		</div>
		
	</div>
	</div>
</div>
<form name="faqSearchForm" method="post">
	<input type="hidden" name="schType" value="all">
    <input type="hidden" name="kwd" value="">
</form>

<div class="page-navigation">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>

