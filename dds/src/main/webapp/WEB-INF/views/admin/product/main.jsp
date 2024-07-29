<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.nav-tabs .nav-link.active {
	background-color: var(--bs-primary);
	color: white !important;
}

.btn-update:hover {
	background-color: var(--bs-primary);
	color: white !important;
}
</style>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card">
			<div class="card-header">
			
		<ul class="nav nav-tabs px-4 mt-3 " id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab-content" type="button" role="tab" aria-controls="1" aria-selected="false"> 숙소 </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-content" type="button" role="tab" aria-controls="2" aria-selected="false"> 투어 </button>
            </li>
        </ul>

        <div class="tab-content m-1 p-1" id="nav-content"></div>
		</div>
	</div>
</div>

<input type="hidden" id="mainSearchType" value="all">
<input type="hidden" id="mainSearchKeyword" value="">


</div>
<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
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
	listRoom(1);
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("aria-controls");
		$('#mainSearchType').val('all');
		$('#mainSearchKeyword').val('');

		if(tab === "1") {
			listRoom(1);
		} else if(tab === "2") {
			listTour(1);
		}
    });
});
function listRoom(page) {
	let url = '${pageContext.request.contextPath}/admin/product/roomList';
	let schType = $('#mainSearchType').val();
	let kwd = $('#mainSearchKeyword').val();
	
	const fn = function(data) {
		$('.tab-content').html(data);
	};
	ajaxFun(url, "get", {page : page, schType: schType, kwd: kwd}, "text", fn);
}

function listTour(page) {
	let url = '${pageContext.request.contextPath}/admin/product/tourList';
	let schType = $('#mainSearchType').val();
	let kwd = $('#mainSearchKeyword').val();
	
	const fn = function(data) {
		$('.tab-content').html(data);
	};
	ajaxFun(url, "get", {page : page, schType: schType, kwd: kwd}, "text", fn);
	
}

$('.tab-content').on('click', '.btn-search', function(){
	let gubun = $(this).attr('data-gubun');
	let schType = $('#searchType').val()
	let kwd = $('#searchKeyword').val();

	$('#mainSearchType').val(schType);
	$('#mainSearchKeyword').val(kwd);

	if(gubun === 'room') {
		listRoom(1);
	} else if(gubun === 'tour') {
	    listTour(1);
	} 
});




// 검색
function listInit(gubun) {
		$('#mainSearchType').val('all');
		$('#mainSearchKeyword').val();

		if(gubun === 'room') {
			listRoom(1);
		} else if(gubun === 'tour') {
		    listTour(1);
		}
}


</script>
