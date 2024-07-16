<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.collapse-image-container {
    height: 700px;
    overflow: hidden;
    transition: height 0.3s ease;
    text-align: center;
}

.collapse-image-container img {
    width: 100%; /* 이미지 너비를 컨테이너에 맞춤 */
    height: auto;
}

    .gradient-overlay {
        position: relative;
    }

    .gradient-overlay::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 250px; /* 그라데이션 높이 조정 */
        background: linear-gradient(to bottom, white, transparent);
        z-index: 1;
    }

    .expanded {
        height: auto;
    }
    
    .fixed-top-box {
        width: 100%;
        background-color: white;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        z-index: 1000;
        transition: top 0.3s ease, opacity 0.3s ease;
        opacity: 0;
    }
    .fixed {
        position: fixed;
        top: 0;
        opacity: 1;
    }
    .spacer {
        height: 10px;
    }
    .nav-link {
        cursor: pointer;
    }

    .image-gallery {
        min-height: 600px !important;
    }

    .image-gallery .left-img,
    .image-gallery .right-img {
        object-fit: cover;
        height: 100%;
    }

    .image-gallery .right-col {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .image-gallery .right-col .row {
        flex: 1;
        display: flex;
    }

    .image-gallery .right-col .row > div {
        padding: 0 0.5rem;
    }

    .image-gallery .right-col .row > div:first-child {
        padding-left: 0;
    }

    .image-gallery .right-col .row > div:last-child {
        padding-right: 0;
    }

    .image-gallery .right-col .row.mb-2 {
        margin-bottom: 0.5rem;
    }

    .text-primary {
        color: #18A8F1 !important;
    }

    hr {
        border-top: 0.5px solid gray;
        padding-bottom: 20px;
    }

    .btn-center {
        display: flex;
        justify-content: center;
    }
    
    .ratio-4x3 {
    --bs-aspect-ratio: 65%;
}
.ratio {
    position: relative;
    width: 95%;
}
</style>

<div data-bs-spy="scroll" data-bs-target="#topBox #topBox2" data-bs-offset="0" tabindex="0">
<!-- 상단 고정 박스 -->
<div id="topBox" class="fixed-top-box ps-5 p-2 border-bottom">
    <ul class="nav nav-pills">
        <li class="nav-item">
            <a class="nav-link" href="#address">위치</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#details">상세 설명</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#facility">시설 정보</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#rooms">객실 선택</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#reviews">리뷰 / QnA</a>
        </li>
    </ul>
</div>

<!-- 게시판 -->
<div class="container">
    <div class="spacer"></div> <!-- 상단 고정 박스 높이만큼 여백 추가 -->

<!-- 이미지 갤러리 섹션 -->
<div class="image-gallery row mb-4">
    <div class="col-md-6 d-flex align-items-stretch">
        <img src="${pageContext.request.contextPath}/resources/images/product_default.png" class="img-fluid rounded w-100 left-img" alt="메인 이미지">
    </div>
    <div class="col-md-6 right-col">
        <div class="row mb-2">
            <div class="col-6 d-flex align-items-stretch">
                <img src="${pageContext.request.contextPath}/resources/images/product_default.png" class="img-fluid rounded w-100 right-img" alt="이미지 2">
            </div>
            <div class="col-6 d-flex align-items-stretch">
                <img src="${pageContext.request.contextPath}/resources/images/product_default.png" class="img-fluid rounded w-100 right-img" alt="이미지 3">
            </div>
        </div>
        <div class="row">
            <div class="col-6 d-flex align-items-stretch">
                <img src="https://item.kakaocdn.net/do/992fcaa6397634d180a621bfbc9075b6ff1cf2d4e1bdc11c5e3dd410963d18c7" class="img-fluid rounded w-100 right-img" alt="이미지 4">
            </div>
            <div class="col-6 d-flex align-items-stretch">
                <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid rounded w-100 right-img" alt="이미지 5">
            </div>
        </div>
    </div>
</div>

    <!-- 가격 및 예약 버튼 섹션 -->
    <div  class="row my-4 p-1 pt-4">
        <div class="col-md-8">
            <h5>캠핑/글램핑</h5>
            <h3 class="fw-semibold py-1">익산 함께해요 캠핑장</h3>
            <h5 class="py-1"><i class="text-primary bi bi-geo-alt-fill fw-semibold"></i>&nbsp;전라북도 익산시</h5>
            <h2 class="py-2 text-primary fw-semibold">100,324원 / 박</h2>
        </div>
        <div class="col-md-4 text-end p-3">
           <button class="fs-5 btn btn-primary">예약하기</button>
        </div>
    </div>
    <hr>

    <!-- 지도 위치 섹션 -->
    <div id="address" class="row g-0 mb-5 mt-3 p-1">
        <div class="col-8 row g-0">
            <h3 class="fw-semibold pb-2">숙소 위치</h3>
            <img src="https://maps.googleapis.com/maps/api/staticmap?size=400x200&scale=2&zoom=14&center=37.58128019999999,128.3273444&key=AIzaSyBAoo822AgkqBDrPE5nr4w_ZRIAF1lISEQ&signature=D0IXZNk-o2YOmLcFYH1FwSRphf8%3D" class="rounded img-fluid" alt="지도">
        	<h5 class="fw-semibold py-3">전라북도 익산시 ooo로 123-12 </h5>
        </div>
    </div>
    
<!-- 상세 설명 섹션 -->
<div id="details" class="row mb-5 mt-3 p-1">
    <div class="col-12">
        <h3 class="fw-semibold pb-2">상세 설명</h3>
        <div id="collapseImageContainer" class="collapse-image-container position-relative">
            <img src="https://shop-phinf.pstatic.net/20230412_49/1681266662977k8PCS_PNG/%EC%82%B0%EB%A6%AC%EC%98%A4%ED%82%A4%EB%A7%81%EC%98%B5%EC%85%98-005.png?type=w860" class="img-fluid w-100" alt="상세 설명 이미지">
            <div id="gradientOverlay" class="position-absolute w-100 bottom-0 start-0" style="height: 100px; background: linear-gradient(to top, white, transparent);"></div>
        </div>
        <div class="d-flex justify-content-center">
            <button class="fs-5 fw-semibold btn btn-primary mt-2 px-5 py-3" type="button" onclick="toggleCollapseImage()">
                상품 설명 더보기
            </button>
        </div>
    </div>
</div>

    <!-- 시설 정보 섹션 -->
    <div id="facility" class="row mb-5 mt-3 p-1">
        <div class="col-12">
            <h3 class="fw-semibold pb-2">시설 정보</h3>
            <p class="fs-5 fw-medium py-3"> ● TV, 취식 가능, 바베큐 시설 이용 가능, 와이파이 </p>
        </div>
    </div>

    <!-- 객실 선택 섹션 -->
<div id="rooms" class="row mb-5 mt-3 p-1">
    <div class="col-12">
        <h3 class="fw-semibold pb-3">객실 선택</h3>
        <div class="card mb-3">
            <div class="row g-0 align-items-center">
                <div class="col-md-4">
                    <div class="ratio ratio-4x3">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnhCKvICLEqkPoPv0qfoWKDRRsVHVg1US3RA&s" class="img-fluid rounded-start" alt="객실 이미지">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card-body p-2">
                        <h2 class="card-title fw-semibold pb-2">A101</h2>
                        <h5 class="card-text py-1 fw-medium">🛏️ 싱글 침대 2개</h5>
                        <h5 class="card-text py-2 fw-medium">👥 성인 2명</h5>
                    </div>
                </div>
                <div class="col-md-3 text-end p-3 pe-4">
                    <h4 class="text-primary fw-semibold">114,700원 / 박</h4>
                    <button class="btn btn-primary fs-5 pt-1">예약하기</button>
                </div>
            </div>
        </div>
        <div class="card mb-3">
            <div class="row g-0 align-items-center">
                <div class="col-md-4">
                    <div class="ratio ratio-4x3">
                        <img src="${pageContext.request.contextPath}/resources/images/product_default.png" class="img-fluid rounded-start" alt="객실 이미지">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card-body p-2">
                        <h2 class="card-title fw-semibold pb-2">A101</h2>
                        <h5 class="card-text py-1 fw-medium">🛏️ 싱글 침대 2개</h5>
                        <h5 class="card-text py-2 fw-medium">👥 성인 2명</h5>
                    </div>
                </div>
                <div class="col-md-3 text-end p-3 pe-4">
                    <h4 class="text-primary fw-semibold">114,700원 / 박</h4>
                    <button class="btn btn-primary fs-5 pt-1">예약하기</button>
                </div>
            </div>
        </div>
        <div class="card mb-3">
            <div class="row g-0 align-items-center">
                <div class="col-md-4">
                    <div class="ratio ratio-4x3">
                        <img src="https://yaimg.yanolja.com/v5/2021/03/29/15/6061f2a92f9b87.94225506.png" class="img-fluid rounded-start" alt="객실 이미지">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card-body p-2">
                        <h2 class="card-title fw-semibold pb-2">B101</h2>
                        <h5 class="card-text py-1 fw-medium">🛏️ 싱글 침대 2개</h5>
                        <h5 class="card-text py-2 fw-medium">👥 성인 2명</h5>
                    </div>
                </div>
                <div class="col-md-3 text-end p-3 pe-4">
                    <h4 class="text-primary fw-semibold">114,700원 / 박</h4>
                    <button class="btn btn-primary fs-5 pt-1">예약하기</button>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- 리뷰 섹션 -->
    <div id="reviews" class="row mb-4">
    </div>
</div>

</div>

<script>
$(function(){
	$("#reviews").load("${pageContext.request.contextPath}/room/review");
});

function toggleCollapseImage() {
    var container = document.getElementById("collapseImageContainer");
    var gradient = document.getElementById("gradientOverlay");
    var button = event.target;
    if (container.classList.contains("expanded")) {
        container.classList.remove("expanded");
        button.innerText = "상품 설명 더보기";
        gradient.style.display = "block";
    } else {
        container.classList.add("expanded");
        button.innerText = "상품 설명 접기";
        gradient.style.display = "none";
        // Scrollspy 다시 초기화
        var scrollSpy = bootstrap.ScrollSpy.getInstance(document.body);
        scrollSpy.refresh();
    }
}

window.onscroll = function() {checkScroll()};

function checkScroll() {
    var topBox = document.getElementById("topBox");
    if (document.documentElement.scrollTop > 350) {
        topBox.classList.add("fixed");
    } else {
        topBox.classList.remove("fixed");
    }
}

//스크롤을 조정하는 함수
document.querySelectorAll('a.nav-link').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        var target = document.querySelector(this.getAttribute('href'));
        var offset = target.getBoundingClientRect().top + window.scrollY - 100;
        window.scrollTo({
            top: offset,
            behavior: 'smooth'
        });
    });
});
</script>
