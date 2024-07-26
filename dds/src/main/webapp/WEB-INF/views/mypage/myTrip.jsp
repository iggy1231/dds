<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    .hero-header {
        background-image: url('${pageContext.request.contextPath}/resources/images/main_header.png');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }
    .search-form-container {
        max-width: 1200px;
        margin: auto;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        padding: 20px;
        border-radius: 8px;
        background-color: white;
    }
    .nav-tabs .nav-link {
        border: none;
        border-bottom: 2px solid transparent;
    }
    .nav-tabs .nav-link.active {
        border-bottom-color: #007bff;
        color: #007bff;
    }
    .form-control {
        border-radius: 0.375rem;
    }
    .btn-custom {
        border-radius: 0.375rem;
    }
    .btn-outline-secondary, .btn-primary {
        white-space: nowrap;
    }
    .text-primary {
        color: #18A8F1 !important;
    }
    .bg-primary {
        background-color: #18A8F1 !important;
    }
    .property-item {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        padding: 16px;
    }
    .property-item:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
    .carousel-caption {
        top: 50%;
        transform: translateY(-22%);
    }
    .testimonial-item {
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 50px;
        background-color: white;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .testimonial-img {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 10;
        background-color: white;
        border: 5px solid white;
        border-radius: 50%;
    }
    .testimonial-comment {
        width: 100%;
        text-align: center;
        background-color: #18A8F1;
        color: white;
        padding: 50px 20px 20px 20px;
        border-radius: 10px;
        margin-bottom: 50px;
    }
    .testimonial-comment::after {
        content: "";
        display: block;
        height: 30px;
    }
    .testimonial-item h5,
    .testimonial-item p {
        margin: 5px 0 0 0;
        padding-top: 15px;
    }
    .ratio-4x3 {
        aspect-ratio: 4 / 3;
        width: 100%;
        object-fit: cover;
    }
    .testimonial .testimonial-carousel {
        position: relative;
    }
    .testimonial .testimonial-carousel .testimonial-item .testimonial-img {
        position: relative;
        width: 100px;
        height: 100px;
        top: 0; left: 50%;
        transform: translate(-50%, -50%);
        border: 3px solid var(--bs-primary);
        border-style: dotted;
        border-radius: 50%;
    }
    .testimonial .testimonial-carousel .owl-dots {
        margin-top: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .testimonial .testimonial-carousel .owl-dot {
        position: relative;
        display: inline-block;
        margin: 0 5px;
        width: 15px;
        height: 15px;
        background: var(--bs-light);
        border: 1px solid var(--bs-primary);
        border-radius: 10px;
        transition: 0.5s;
    }
    .testimonial .testimonial-carousel .owl-dot.active {
        width: 40px;
        background: var(--bs-primary);
    }
    .testimonial .testimonial-carousel .owl-nav .owl-prev {
        position: absolute;
        top: -55px;
        left: 0;
        padding: 5px 30px;
        border: 1px solid var(--bs-primary);
        border-radius: 30px;
        transition: 0.5s;
    }
    .testimonial .testimonial-carousel .owl-nav .owl-next {
        position: absolute;
        top: -55px;
        right: 0;
        padding: 5px 30px;
        border: 1px solid var(--bs-primary);
        border-radius: 30px;
        transition: 0.5s;
    }
    .testimonial .testimonial-carousel .owl-nav .owl-prev i,
    .testimonial .testimonial-carousel .owl-nav .owl-next i {
        color: var(--bs-primary);
        font-size: 17px;
        transition: 0.5s;
    }
    .testimonial .testimonial-carousel .owl-nav .owl-prev:hover,
    .testimonial .testimonial-carousel .owl-nav .owl-next:hover {
        background: var(--bs-primary);
    }
    .testimonial .testimonial-carousel .owl-nav .owl-prev:hover i,
    .testimonial .testimonial-carousel .owl-nav .owl-next:hover i {
        color: var(--bs-white);
    }
    .testimonial .testimonial-carousel .owl-item.center .testimonial-item .testimonial-comment {
        background: var(--bs-primary) !important;
        color: var(--bs-white);
        transition: 0.5s;
    }
    .testimonial .testimonial-carousel .owl-item.center .testimonial-item .testimonial-img {
        border: 3px solid var(--bs-white);
        border-style: dotted;
        transition: 0.5s;
    }
    .flex-container {
        display: flex;
        gap: 20px;
    }
    .flex-item img {
        max-width: 150px;
        height: auto;
        border-radius: 8px;
    }
    .dropdown {
        position: relative;
        display: inline-block;
    }
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown-content a:hover {
        background-color: #f1f1f1;
    }
    .show {
        display: block;
    }
</style>

<div class="my-info">
	<div class="page-title">
		<div class="spacing-top"></div>
		 <div class="content"> 
		 	<div class="title-row">
		 		<div class="title title--show">
		 			<h1 class="text">내 여행</h1>
			 	</div> 
			 	<div class="action-btn-area"></div>
			 </div>
		</div>
		<div class="spacing-bottom"></div>
		
		<ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 숙소 </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 투어 </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane-3" type="button" role="tab" aria-controls="3" aria-selected="false"> 일정 </button>
            </li>
        </ul>
        
        <div class="tab-content mt-3">
	        
					</div>
			</div>
        </div>


<script type="text/javascript">
function toggleDropdown() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// 드롭다운 외부를 클릭하면 닫히게 하는 스크립트
window.onclick = function(event) {
    if (!event.target.matches('.btn-outline-secondary')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
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
	listMyRoom(1);
	
    $("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("aria-controls");
		if(tab === "1") {
			listMyRoom(1);
		} else if(tab === "2") {
			listReply(1);
		}
    });
});

function listMyRoom(page) {
	let url = '${pageContext.request.contextPath}/mypage/myRoom';
	
	const fn = function(data) {
		$('.tab-content').html(data);
	};
	ajaxFun(url, "get", {pageNo : page}, "text", fn);
}

function listReply(page) {
	let url = '${pageContext.request.contextPath}/mypage/reply';
	
	const fn = function(data) {
		$('.tab-content').html(data);
	};
	ajaxFun(url, "get", {pageNo : page}, "text", fn);
}

// 페이지 로드 시점에서 각 버튼에 이벤트 리스너 추가
document.querySelectorAll('.btn.btn-primary').forEach(function(button) {
    button.addEventListener('click', function() {
        var saleNum = this.getAttribute('data-saleNum');
        var detailNum = this.getAttribute('data-detailNum');
        var userNum = this.getAttribute('data-userNum');
        cancelReservation(saleNum, detailNum, userNum);
    });
});

function cancelReservation(saleNum, detailNum, userNum) {
    if (confirm("정말 예약을 취소하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/mypage/cancelReservation",
            data: {
                saleNum: saleNum,
                detailNum: detailNum,
                userNum: userNum
            },
            success: function(response) {
                if (response === "success") {
                    alert("예약이 취소되었습니다.");
                    location.reload(); // 페이지 새로고침
                } else {
                    alert("예약 취소 중 오류가 발생했습니다.");
                }
            },
            error: function() {
                alert("예약 취소 중 오류가 발생했습니다.");
            }
        });
    }
}

<!-- 문의사항 모달 -->
<div class="modal fade" id="questionDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="questionDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="questionDialogModalLabel">상품 문의 하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
<div class="modal-body">
	<div class="qna-form p-2">
		<form name="questionForm" action="${pageContext.request.contextPath}/room/writeQnA" method="post">
			<div class="row">
				<div class="col">
					<span class="fw-bold fs-6">문의사항 쓰기</span><span>&nbsp;&nbsp;&nbsp;※ 상품 및 상품 구매 과정과 관련없는 글은 삭제 될 수 있습니다.</span>
				</div>
				<div class="col-2 text-end">
					<input type="checkbox" name="anonymous" id="secret1" class="form-check-input" value="1">
					<label class="form-check-label" for="secret1"> 🔒 비공개</label>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-2">
					<h5>제목 :</h5>
				</div>
				<div class="col-10">
					<input name="subject" id="subject" type="text" placeholder="문의사항 제목 입력" class="form-control">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-2">
					<h5>내용 :</h5>
				</div>
				<div class="col-10">
					<textarea name="content" id="question" class="form-control" rows="5"></textarea>
				</div>
			</div>
			<input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="page" value="1">
		</form>
	</div>
</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnQuestionSendOk">문의등록 <i class="bi bi-check2"></i> </button>
				<button type="button" class="btn btn-secondary btnQuestionSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>
</script>