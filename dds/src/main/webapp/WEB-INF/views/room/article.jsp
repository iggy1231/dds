<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <style>
        .collapse-image-container {
            height: 300px;
            overflow: hidden;
            transition: height 0.3s ease;
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
            height: 50px;
        }
        .nav-link {
            cursor: pointer;
        }
         .nav-link.active {
            background-color: transparent !important;
            color: inherit !important;
        }
         .nav-link:focus, .nav-link:hover {
            color: inherit !important;
            text-decoration: none;
            background-color: transparent !important;
        }
        .nav-pills .nav-link.active, .nav-pills .show > .nav-link {
            color: inherit !important;
            background-color: transparent !important;
        }
       
    </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#topBox" data-bs-offset="0" tabindex="0">

<!-- 상단 고정 박스 -->
<div id="topBox" class="fixed-top-box p-2 border-bottom">
    <ul class="nav nav-pills">
        <li class="nav-item">
            <a class="nav-link" href="#address">주소</a>
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
            <a class="nav-link" href="#reviews">리뷰 선택</a>
        </li>
    </ul>
</div>

<!-- 게시판 -->
<div class="container mt-5">
    <div class="spacer"></div> <!-- 상단 고정 박스 높이만큼 여백 추가 -->

    <!-- 이미지 갤러리 섹션 -->
    <div class="row mb-4">
        <div class="col-md-6">
            <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid" alt="메인 이미지">
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-6 mb-3">
                    <img src="https://item.kakaocdn.net/do/3bbb15e985d0628d50c187157e06cc5cf43ad912ad8dd55b04db6a64cddaf76d" class="img-fluid" alt="이미지 2">
                </div>
                <div class="col-6 mb-3">
                    <img src="https://mblogthumb-phinf.pstatic.net/MjAyNDA0MDVfMTgy/MDAxNzEyMjQ2ODA1NTM4.nN-x1y-9_NBfzKPUHLsAQ48wq1egQDUsdcpIDh9OTsMg.fncd3H-GO-Co97vK78L5_1cf-w8bfsCOiMmCV96met0g.GIF/%EB%A1%9C%EA%B3%BD%EC%A3%BC_%EC%97%89%EB%8D%A9%EC%9D%B4_%ED%8C%A1%ED%8C%A1.gif?type=w800" class="img-fluid" alt="이미지 3">
                </div>
                <div class="col-6 mb-3">
                    <img src="https://item.kakaocdn.net/do/992fcaa6397634d180a621bfbc9075b6ff1cf2d4e1bdc11c5e3dd410963d18c7" class="img-fluid" alt="이미지 4">
                </div>
                <div class="col-6 mb-3">
                    <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid" alt="이미지 5">
                </div>
            </div>
        </div>
    </div>

    <!-- 가격 및 예약 버튼 섹션 -->
    <div class="row mb-4">
        <div class="col-md-8">
            <h3>숙소 이름</h3>
            <p>숙소 위치 정보</p>
            <h4 class="text-primary">100,324원 / 박</h4>
        </div>
        <div class="col-md-4 text-end">
            <button class="btn btn-primary">예약하기</button>
        </div>
    </div>

    <!-- 지도 위치 섹션 -->
    <div id="address" class="row mb-4">
        <div class="col-12">
            <h5>숙소 위치</h5>
            <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid" alt="지도">
        </div>
    </div>
    
    <!-- 상세 설명 섹션 -->
    <div id="details" class="row mb-4">
        <div class="col-12">
            <h5>상세 설명</h5>
            <div id="collapseImageContainer" class="collapse-image-container">
                <img src="https://shop-phinf.pstatic.net/20230412_49/1681266662977k8PCS_PNG/%EC%82%B0%EB%A6%AC%EC%98%A4%ED%82%A4%EB%A7%81%EC%98%B5%EC%85%98-005.png?type=w860" class="img-fluid" alt="상세 설명 이미지">
            </div>
            <button class="btn btn-primary mt-2" type="button" onclick="toggleCollapseImage()">
                상품 설명 더보기
            </button>
        </div>
    </div>

    <!-- 시설 정보 섹션 -->
    <div id="facility" class="row mb-4">
        <div class="col-12">
            <h5>시설 정보</h5>
            <p>시설 정보 설명</p>
        </div>
    </div>

    <!-- 객실 선택 섹션 -->
    <div id="rooms" class="row mb-4">
        <div class="col-12">
            <h5>객실 선택</h5>
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="https://item.kakaocdn.net/do/3bbb15e985d0628d50c187157e06cc5cf43ad912ad8dd55b04db6a64cddaf76d" class="img-fluid rounded-start" alt="객실 이미지">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h6 class="card-title">A101</h6>
                            <p class="card-text">객실정보</p>
                            <p class="card-text">🛏️ 싱글 침대 2개</p>
                            <p class="card-text">👥 성인 2명</p>
                        </div>
                    </div>
                    <div class="col-md-2 d-flex flex-column justify-content-between align-items-end p-3">
                        <span class="text-primary fs-5">114,700원/박</span>
                        <button class="btn btn-primary mt-2">예약하기</button>
                    </div>
                </div>
            </div>
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe9eMd8_ro5PGvscRMNkOYdwGWrkJHAPeuBg&s" class="img-fluid rounded-start" alt="객실 이미지">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h6 class="card-title">A101</h6>
                            <p class="card-text">객실정보</p>
                            <p class="card-text">🛏️ 싱글 침대 2개</p>
                            <p class="card-text">👥 성인 2명</p>
                        </div>
                    </div>
                    <div class="col-md-2 d-flex flex-column justify-content-between align-items-end p-3">
                        <span class="text-primary fs-5">114,700원/박</span>
                        <button class="btn btn-primary mt-2">예약하기</button>
                    </div>
                </div>
            </div>
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAyNDA0MDVfMTgy/MDAxNzEyMjQ2ODA1NTM4.nN-x1y-9_NBfzKPUHLsAQ48wq1egQDUsdcpIDh9OTsMg.fncd3H-GO-Co97vK78L5_1cf-w8bfsCOiMmCV96met0g.GIF/%EB%A1%9C%EA%B3%BD%EC%A3%BC_%EC%97%89%EB%8D%A9%EC%9D%B4_%ED%8C%A1%ED%8C%A1.gif?type=w800" class="img-fluid rounded-start" alt="객실 이미지">
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h6 class="card-title">A101</h6>
                            <p class="card-text">객실정보</p>
                            <p class="card-text">🛏️ 싱글 침대 2개</p>
                            <p class="card-text">👥 성인 2명</p>
                        </div>
                    </div>
                    <div class="col-md-2 d-flex flex-column justify-content-between align-items-end p-3">
                        <span class="text-primary fs-5">114,700원/박</span>
                        <button class="btn btn-primary mt-2">예약하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 리뷰 섹션 -->
    <div id="reviews" class="row mb-4">
        <div class="col-12">
            <h5>리뷰</h5>
            <div class="card mb-3">
                <div class="card-body">
                    <h6 class="card-title">리뷰 제목</h6>
                    <p class="card-text">리뷰 내용</p>
                </div>
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <h6 class="card-title">리뷰 제목</h6>
                    <p class="card-text">리뷰 내용</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function toggleCollapseImage() {
    var container = document.getElementById("collapseImageContainer");
    var button = event.target;
    if (container.classList.contains("expanded")) {
        container.classList.remove("expanded");
        button.innerText = "상품 설명 더보기";
    } else {
        container.classList.add("expanded");
        button.innerText = "상품 설명 접기";
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


</body>
</html>
