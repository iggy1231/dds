<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>

    <style>
        .room-card {
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            padding: 10px;
        }
        .room-card img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }
        .room-info {
            flex-grow: 1;
            padding: 0 20px;
        }
        .room-price {
            color: #17a2b8;
            font-size: 1.2em;
        }
        .room-button {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
       .collapse-image-container {
            height: 300px;
            overflow: hidden;
            transition: height 0.3s ease;
        }
        .expanded {
            height: auto;
        }
    </style>
</head>
<body>

<!-- 게시판 -->
<div class="container mt-5">
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
    <div class="row mb-4">
        <div class="col-12">
            <h5>숙소 위치</h5>
            <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid" alt="지도">
        </div>
    </div>
	
	<!-- 상세 설명 섹션 -->
    <div class="row mb-4">
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
    <div class="row mb-4">
        <div class="col-12">
            <h5>시설 정보</h5>
            <p>시설 정보 설명</p>
        </div>
    </div>

    <!-- 객실 선택 섹션 -->
   <div class="row mb-4">
        <div class="col-12">
            <h5>객실 선택</h5>
            <div class="room-card">
                <img src="https://item.kakaocdn.net/do/3bbb15e985d0628d50c187157e06cc5cf43ad912ad8dd55b04db6a64cddaf76d" class="img-fluid" alt="객실 이미지">
                <div class="room-info">
                    <h6>A101</h6>
                    <p>객실정보</p>
                    <p>🛏️ 싱글 침대 2개</p>
                    <p>👥 성인 2명</p>
                </div>
                <div class="room-button">
                    <span class="room-price">114,700원/박</span>
                    <button class="btn btn-primary mt-2">예약하기</button>
                </div>
            </div>
            <div class="room-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe9eMd8_ro5PGvscRMNkOYdwGWrkJHAPeuBg&s" class="img-fluid" alt="객실 이미지">
                <div class="room-info">
                    <h6>A101</h6>
                    <p>객실정보</p>
                    <p>🛏️ 싱글 침대 2개</p>
                    <p>👥 성인 2명</p>
                </div>
                <div class="room-button">
                    <span class="room-price">114,700원/박</span>
                    <button class="btn btn-primary mt-2">예약하기</button>
                </div>
            </div>
            <div class="room-card">
                <img src="https://mblogthumb-phinf.pstatic.net/MjAyNDA0MDVfMTgy/MDAxNzEyMjQ2ODA1NTM4.nN-x1y-9_NBfzKPUHLsAQ48wq1egQDUsdcpIDh9OTsMg.fncd3H-GO-Co97vK78L5_1cf-w8bfsCOiMmCV96met0g.GIF/%EB%A1%9C%EA%B3%BD%EC%A3%BC_%EC%97%89%EB%8D%A9%EC%9D%B4_%ED%8C%A1%ED%8C%A1.gif?type=w800" class="img-fluid" alt="객실 이미지">
                <div class="room-info">
                    <h6>A101</h6>
                    <p>객실정보</p>
                    <p>🛏️ 싱글 침대 2개</p>
                    <p>👥 성인 2명</p>
                </div>
                <div class="room-button">
                    <span class="room-price">114,700원/박</span>
                    <button class="btn btn-primary mt-2">예약하기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 리뷰 섹션 -->
    <div class="row mb-4">
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
    }
}
</script>

</body>
</html>
