<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.nav-tabs .nav-link.active {
	background-color: var(--bs-primary);
	color: white !important;
}
</style>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">상품관리 /</span> 상품 리스트
		</h4>
		<div class="card">
			<div class="card mt-2">
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
		if(tab === "1") {
			listRoom(1);
		} else if(tab === "2") {
			listTour(1);
		}
    });
});
function listRoom(page) {
	let url = '${pageContext.request.contextPath}/admin/product/roomList';
	
	const fn = function(data) {
		$('.tab-content').html(data);
	};
	ajaxFun(url, "get", {pageNo : page}, "text", fn);
}

function listTour(page) {
	let url = '${pageContext.request.contextPath}/admin/product/tourList';
	
	const fn = function(data) {
		$('.tab-content').html(data);
	};
	ajaxFun(url, "get", {pageNo : page}, "text", fn);
	
}

const productStockModalEl = document.getElementById('productStockDialogModal');
productStockModalEl.addEventListener('show.bs.modal', function(){
	// 모달 대화상자가 보일때
});

productStockModalEl.addEventListener('hidden.bs.modal', function(){
	// 모달 대화상자가 안보일때
	searchList();
});

</script>
