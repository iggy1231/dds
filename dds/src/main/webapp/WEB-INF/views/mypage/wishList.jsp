<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .wishlist-item {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        overflow: hidden;
        transition: box-shadow 0.3s;
        background-color: white;
        margin-bottom: 20px;
        position: relative;
    }
    .wishlist-item:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .wishlist-item img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
    .wishlist-item-body {
        padding: 16px;
    }
    .wishlist-item-title {
        font-size: 16px;
        font-weight: bold;
        margin: 0;
        color: #333;
    }
    .wishlist-item-text {
        font-size: 14px;
        color: #777;
        margin: 8px 0;
    }
    .wishlist-item-price {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }
    .wishlist-item-rating {
        display: flex;
        align-items: center;
        font-size: 14px;
        color: #f1c40f;
    }
    .wishlist-item-rating i {
        margin-right: 4px;
    }
    .badge-top-left {
        position: absolute;
        top: 10px;
        left: 10px;
        background-color: rgba(0, 0, 0, 0.6);
        color: white;
        padding: 5px 10px;
        border-radius: 3px;
        font-size: 12px;
    }
    .heart-icon {
        position: absolute;
	    top: 10px;
	    right: 10px;
	    font-size: 20px;
	    color: red;
	    z-index: 1;
    }
    .wishlist-item-footer {
        font-size: 12px;
        color: gray;
        padding: 0 16px 16px 16px;
    }
    .companion-card {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        overflow: hidden;
        background-color: white;
        margin-bottom: 20px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s;
        position: relative;
    }
    .companion-card:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
    .companion-card-header {
        background-color: #00AEEF;
        color: white;
        padding: 20px;
        font-size: 16px;
        height: 130px;
    }
    .companion-card-img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid white;
        position: absolute;
        top: 40%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
    }
    .companion-card-body {
        padding-top: 60px; /* 이미지 아래로 공간 확보 */
        padding-bottom: 20px;
    }
    .companion-card-title {
        font-size: 18px;
        font-weight: bold;
        margin: 10px 0;
    }
    .companion-card-location,
    .companion-card-date {
        font-size: 14px;
        color: #777;
    }
    .companion-card-location i,
    .companion-card-date i {
        color: #00AEEF;
        margin-right: 5px;
    }
    .companion-card .badge {
        font-size: 14px;
        background-color: #00AEEF;
        color: white;
        border-radius: 5px;
        padding: 5px 10px;
        margin-top: 10px;
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
    .heart-icon {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 20px;
        color: red;
    }
    
    .review-item {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        overflow: hidden;
        transition: box-shadow 0.3s;
        background-color: white;
        margin-bottom: 20px;
        position: relative;
        padding: 16px;
    }
    .review-item:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .review-item img {
        width: 100%;
        height: auto;
        border-radius: 8px 8px 0 0;
        object-fit: cover;
    }
    .review-item-body {
        padding: 16px;
    }
    .review-item-title {
        font-size: 16px;
        font-weight: bold;
        margin: 0;
        color: #333;
    }
    .review-item-text {
        font-size: 14px;
        color: #777;
        margin: 8px 0;
    }
    .review-item-location,
    .review-item-date {
        font-size: 12px;
        color: #999;
        margin-bottom: 5px;
    }
    .review-item-location i,
    .review-item-date i {
        color: #00AEEF;
        margin-right: 5px;
    }
    .heart-icon {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 20px;
        color: red;
    }
    .review-item-footer {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        font-size: 12px;
        color: gray;
    }
    .review-item-footer i {
        margin-right: 4px;
    }
</style>

<div class="my-info">
    <div class="page-title">
        <div class="spacing-top"></div>
        <div class="content">
            <div class="title-row">
                <div class="title title--show">
                    <h1 class="text">위시리스트</h1>
                </div>
                <div class="action-btn-area"></div>
            </div>
        </div>
        <div class="spacing-bottom"></div>
        <div>
            <div data-wow-delay="0.1s">
                <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary active" data-bs-toggle="pill" role="tab" href="#tab-1">숙소</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" role="tab" href="#tab-2">투어</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" role="tab" href="#tab-3">여행정보</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" role="tab" href="#tab-4">동행</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" role="tab" href="#tab-5">후기</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="tab-content" id="nav-content">
            
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
    $('.nav-pills a').on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
        const tab = $(this).attr("href").substring(1); // href 속성에서 탭 ID를 가져옴
        if(tab === "tab-1") {
            listWishRoom(1); // "숙소" 탭 클릭 시 호출
        } else if(tab === "tab-2") {
            listWishTour(1); // "투어" 탭 클릭 시 호출
        } else if(tab === "tab-3") {
            listWishInfo(1); // "여행정보" 탭 클릭 시 호출
        } else if(tab === "tab-4") {
            listWishCompanion(1); // "동행" 탭 클릭 시 호출
        } else if(tab === "tab-5") {
            listWishReview(1); // "후기" 탭 클릭 시 호출
        }
    });

    // 페이지 로드 시 기본으로 첫 번째 페이지의 위시리스트 항목을 불러옴
    listWishReview(1);
});

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

function listWishRoom(page) {
    let url = '${pageContext.request.contextPath}/mypage/wishRoom';
    
    const fn = function(data) {
        $('#nav-content').html(data);
    };
    ajaxFun(url, "get", {pageNo: page}, "text", fn);
}

function listWishTour(page) {
    let url = '${pageContext.request.contextPath}/mypage/wishTour';
    
    const fn = function(data) {
        $('#nav-content').html(data);
    };
    ajaxFun(url, "get", {pageNo: page}, "text", fn);
}

function listWishInfo(page) {
    let url = '${pageContext.request.contextPath}/mypage/wishInfo';
    
    const fn = function(data) {
        $('#nav-content').html(data);
    };
    ajaxFun(url, "get", {pageNo: page}, "text", fn);
}

function listWishCompanion(page) {
    let url = '${pageContext.request.contextPath}/mypage/wishCompanion';
    
    const fn = function(data) {
        $('#nav-content').html(data);
    };
    ajaxFun(url, "get", {pageNo: page}, "text", fn);
}

function listWishReview(page) {
    let url = '${pageContext.request.contextPath}/mypage/wishReview';
    
    const fn = function(data) {
        $('#nav-content').html(data);
    };
    ajaxFun(url, "get", {pageNo: page}, "text", fn);
}

function removeFromWishlist(num, table_name) {
    if(confirm("위시리스트에서 제거하시겠습니까?")) {
        $.ajax({
            url: '${pageContext.request.contextPath}/mypage/wishlist/remove', // 서버의 AJAX 요청을 처리할 URL
            type: 'POST',
            data: { num: num, table_name: table_name},
            success: function(response) {
                if(response.success) {
                    alert("위시리스트에서 제거되었습니다.");
                    // 성공 시 해당 항목을 화면에서 제거
                    $("#wishlist-" + num).closest('.col-md-4').remove();
                } else {
                    alert("제거하는 동안 오류가 발생했습니다.");
                }
                
            },
            error: function(xhr, status, error) {
                alert("AJAX 오류가 발생했습니다: " + error);
            }
        });
    }
}

</script>
</script>
