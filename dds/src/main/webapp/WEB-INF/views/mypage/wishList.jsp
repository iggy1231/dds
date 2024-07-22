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
                        <a class="py-1 px-4 btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">숙소</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" href="#tab-2">투어</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" href="#tab-3">여행정보</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" href="#tab-4">동행</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" href="#tab-5">후기</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show active">
                <!-- 숙소 탭 콘텐츠 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="wishlist-item position-relative">
                            <span class="badge-top-left">오늘의특가</span>
                            <i class="bi bi-heart-fill heart-icon"></i>
                            <img src="https://ppss.kr/wp-content/uploads/2023/02/1-2.jpeg" alt="Item Image">
                            <div class="wishlist-item-body">
                                <p class="wishlist-item-title">[순천] 순천만 정원박람회가 보이는 순천만펜션</p>
                                <div class="wishlist-item-rating">
                                    <i class="bi bi-star-fill"></i>
                                    <span>4.7 (4053)</span>
                                </div>
                                <p class="wishlist-item-price">150,000원</p>
                            </div>
                            <div class="wishlist-item-footer">
                                전라남도 • 순천
                            </div>
                        </div>
                    </div>
                    <!-- 다른 아이템들도 여기에 추가 -->
                  	<div class="col-md-4">
                        <div class="wishlist-item position-relative">
                            <span class="badge-top-left">오늘의특가</span>
                            <i class="bi bi-heart-fill heart-icon"></i>
                            <img src="https://ppss.kr/wp-content/uploads/2023/02/1-2.jpeg" alt="Item Image">
                            <div class="wishlist-item-body">
                                <p class="wishlist-item-title">[순천] 순천만 정원박람회가 보이는 순천만펜션</p>
                                <div class="wishlist-item-rating">
                                    <i class="bi bi-star-fill"></i>
                                    <span>4.7 (4053)</span>
                                </div>
                                <p class="wishlist-item-price">150,000원</p>
                            </div>
                            <div class="wishlist-item-footer">
                                전라남도 • 순천
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tab-2" class="tab-pane fade">
                <!-- 투어 탭 콘텐츠 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="wishlist-item position-relative">
                            <span class="badge-top-left">최저가보장제</span>
                            <i class="bi bi-heart-fill heart-icon"></i>
                            <img src="https://ppss.kr/wp-content/uploads/2023/02/1-2.jpeg" alt="Item Image">
                            <div class="wishlist-item-body">
                                <p class="wishlist-item-title">[순천] 봉화산에 가서 고라니 만나기 챌린지</p>
                                <div class="wishlist-item-rating">
                                    <i class="bi bi-star-fill"></i>
                                    <span>4.7 (4053)</span>
                                </div>
                                <p class="wishlist-item-price">150,000원</p>
                            </div>
                            <div class="wishlist-item-footer">
                                순천 • 봉화산 투어
                            </div>
                        </div>
                    </div>
                    <!-- 다른 투어 아이템들도 여기에 추가 -->
                </div>
            </div>
            <div id="tab-3" class="tab-pane fade">
                <!-- 여행정보 탭 콘텐츠 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="travel-info-item">
                            <i class="bi bi-heart-fill heart-icon"></i>
                            <img src="https://via.placeholder.com/300x200" alt="Travel Image">
                            <div class="travel-info-item-body">
                                <p class="travel-info-item-title">감악산(거창)</p>
                                <p class="travel-info-item-location"><i class="bi bi-geo-alt-fill"></i> 경상남도 거창군</p>
                                <p class="travel-info-item-tags">#관광지 #산 #자연관광지 #자연</p>
                            </div>
                        </div>
                    </div>
                    <!-- 다른 여행정보 아이템들도 여기에 추가 -->
                </div>
            </div>
            <div id="tab-4" class="tab-pane fade">
                <!-- 동행 탭 콘텐츠 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="companion-card">
                            <div class="companion-card-header">
                                제주도 힐링 투어 같이 가실 분 구해요! 함께 즐거운 여행 합시다 :-)
                            </div>
                            <div class="companion-card-body">
                                <img src="https://via.placeholder.com/80" alt="Profile Image" class="companion-card-img">
                                <p class="companion-card-title">닉네임</p>
                                <p class="companion-card-location"><i class="bi bi-geo-alt-fill"></i> 제주도 <i class="bi bi-people-fill"></i> 5인</p>
                                <p class="companion-card-date"><i class="bi bi-calendar-event"></i> YY/MM/DD ~ YY/MM/DD</p>
                                <span class="badge">동행 신청</span>
                            </div>
                        </div>
                    </div>
                    <!-- 다른 동행 아이템들도 여기에 추가 -->
                </div>
            </div>
            <div id="tab-5" class="tab-pane fade">
                <!-- 후기 탭 콘텐츠 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="review-item">
                            <i class="bi bi-heart-fill heart-icon"></i>
                            <img src="https://via.placeholder.com/300x200" alt="Review Image">
                            <div class="review-item-body">
                                <p class="review-item-title">순천 갔다온 썰 푼다</p>
                                <p class="review-item-text">순천에 자랑 소금후추 보고 왔는데...</p>
                                <p class="review-item-location"><i class="bi bi-geo-alt-fill"></i> 순천</p>
                                <p class="review-item-date"><i class="bi bi-calendar-event"></i> 2024.07.21</p>
                            </div>
                            <div class="review-item-footer">
                                <span><i class="bi bi-person-circle"></i> 닉네임</span>
                            </div>
                        </div>
                    </div>
                    <!-- 다른 여행후기 아이템들도 여기에 추가 -->
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
    $('.nav-pills a').on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
});
</script>
