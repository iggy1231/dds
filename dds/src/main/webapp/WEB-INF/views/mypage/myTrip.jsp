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
    
    .review-form textarea { width: 100%; height: 75px; resize: none; }
.review-form .star { font-size: 0; letter-spacing: -4px; }
.review-form .star a {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	 color: #ccc; text-decoration: none;
}
.review-form .star a:first-child { margin-left: 0; }
.star a.on { color: #FFBB00; }

.review-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.review-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
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
			dataType: dataType,
			success: function(data) {
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
        var sale_num = this.getAttribute('data-sale_num');
        var detail_num = this.getAttribute('data-detail_num');
        var user_num = this.getAttribute('data-user_num');
        cancelReservation(sale_num, detail_num, user_num);
    });
});

function cancelReservation(sale_num, detail_num, user_num) {
    if (confirm("정말 예약을 취소하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/mypage/cancelReservation",
            data: {
                sale_num: sale_num,
                detail_num: detail_num,
                user_num: user_num
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


//---------- 리뷰

// 별 선택
$(document).on("click", ".review-form .star a", function(e){
    let b = $(this).hasClass("on");
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");

    if(b) {
        $(this).removeClass("on");
    }

    let s = $(this).closest(".review-form").find(".star .on").length;
    $(this).closest(".review-form").find("input[name=rating]").val(s);

    return false;
});


// 이미지 추가
$(document).on("click", ".review-form .img-add", function(){
    $(this).closest(".review-form").find("input[name=photoFile]").trigger("click");
});

$(document).on("change", "form[name^='reviewForm'] input[name=photoFile]", function(e){
    let sel_files = [];
    if(!this.files) {
        let dt = new DataTransfer();
        for(let f of sel_files) {
            dt.items.add(f);
        }

        this.files = dt.files;
        return false;
    }

    let $form = $(this).closest("form");

    // 유사 배열을 배열로 변환
    const fileArr = Array.from(this.files);

    fileArr.forEach((file, index) => {
        sel_files.push(file);

        const reader = new FileReader();
        const $img = $("<img>", {"class":"item img-item"});
        $img.attr("data-filename", file.name);
        reader.onload = e => {
            $img.attr("src", e.target.result);        
        };
        reader.readAsDataURL(file);
        $form.find(".img-grid").append($img);
    });

    let dt = new DataTransfer();
    for(let f of sel_files) {
        dt.items.add(f);
    }

    this.files = dt.files;
});

$(document).on("click", ".review-form .img-item", function(){
    if(!confirm("선택한 파일을 삭제 하시겠습니까?")) {
        return false;
    }

    let filename = $(this).attr("data-filename");
    let form = $(this).closest("form")[0];
    let files = form.photoFile.files;
    let dt = new DataTransfer();

    for(let i = 0; i < files.length; i++) {
        if(files[i].name !== filename) {
            dt.items.add(files[i]);
        }
    }

    form.photoFile.files = dt.files;
    $(this).remove();
});

//리뷰 작성 버튼 클릭 이벤트 위임 - ajax
$(document).on('click', '.btnReviewSend', function() {
    const roomId = $(this).data('room-id');
    let form = document.forms['reviewForm'];
    let formData = new FormData(form);

    // 여기에서 rating 변수를 초기화합니다.
    let rating = form.querySelector('input[name="rating"]').value; 
    let content = form.querySelector('textarea[name="content"]').value;  

    if (rating === "0") {
        alert("평점은 1점부터 가능합니다.");
        return false;
    }

    if (!content) {
        alert("리뷰를 입력하세요.");
        document.getElementById('content').focus();
        return false;
    }

    let url = "${pageContext.request.contextPath}/room/reviewWrite";

    const fn = function(data) {
        if (data.state === "true") {
            $('.btnReviewWriteForm').remove();
            $('.review-form').remove();
        } else {
            alert("리뷰 등록 중 오류가 발생했습니다.");
        }
    };

    ajaxFun(url, "POST", formData, "json", fn, true); // POST로 설정
});



// 모달이 닫힐 때마다 초기화
$(document).on('hidden.bs.modal', function(e) {
    $(this).find("form")[0].reset();
});

</script>

<script type="text/javascript">


function getToken(num, point,sale_num) {
    // ajaxFun 함수 정의    
    function ajaxFun(url, method, query, dataType, successCallback) {
        $.ajax({
            url: url,
            method: method,
            data: query,
            dataType: dataType,
            success: successCallback,
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", status, error);
                alert("AJAX 요청에 실패했습니다.");
            }
        });
    }

    let url = "${pageContext.request.contextPath}/mypage/token";
    let query = "";

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("불러오기 성공");
            console.log(data.access_token);
            console.log(sale_num);
            let access_token = data.access_token;
            cancel(num, access_token, point,sale_num);
        } else {
            alert("불러오기 실패");
        }
    };

    // ajaxFun 함수 호출
    ajaxFun(url, "post", query, "json", fn);
    
}

function cancel(num, access_token,point,sale_num) {
	console.log("셀넘" + sale_num)
	var sale_num = sale_num;
	 var cardNum = document.getElementById("card_num-"+sale_num).value;
	    var user_num = document.getElementById("user_num-"+sale_num).value;
	    var finalPrice = document.getElementById("final_price-"+sale_num).value;
	    var description = document.getElementById("description").value;
    
    var url = "${pageContext.request.contextPath}/mypage/cancel";
    
    var formData = {
        imp_uid: num,
        reason: description,
        access_token: access_token, // 액세스 토큰 추가
        sale_num : sale_num,
        card_num : cardNum,
        final_price : finalPrice,
        user_num : user_num,
    };

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("환불 성공");
            window.location.reload();
        } else {
            alert("환불 실패");
            console.log(data.message);
        }
    };

    // ajaxFun 함수 예시
    function ajaxFun(url, type, data, dataType, successFn) {
        $.ajax({
            url: url,
            type: type,
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: dataType,
            success: successFn,
            error: function(xhr, status, error) {
                alert("전송 실패: " + xhr.responseText);
            }
        });
    }

    ajaxFun(url, "post", formData, "json", fn);
};
</script>