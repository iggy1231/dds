<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<style>
 * {
            font-family: pretendard;
        }
        .hero-header {
            background-image: url('${pageContext.request.contextPath}/resources/images/header_room.png');
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
        }
        .property-item:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        
        /*** Gallery Start ***/
.gallery .gallery-item {
    position: relative;
    overflow: hidden;
    border-radius: 10px;
}

.gallery .gallery-item img {
    min-height: 300px;
    object-fit: cover;
}

.gallery .gallery-item .gallery-content {
    position: absolute;
    width: 100%;
    height: 100%;
    bottom: 0;
    left: 0;
    padding: 15px;
    background: rgba(0, 0, 0, 0.3);
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    justify-content: end;
    transition: 0.5s;
}

.gallery .gallery-item .gallery-content .gallery-info {
    position: relative;
    margin-bottom: -100%;
    opacity: 0;
    transition: 0.5s;
}

.gallery .gallery-item .gallery-plus-icon {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    transition: 0.5s;
    opacity: 0;
}

.gallery .gallery-item:hover .gallery-content .gallery-info,
.gallery .gallery-item:hover .gallery-plus-icon {
   opacity: 1;
   margin: 0;
}

.gallery .gallery-item img {
    transition: 0.5s;
}

.gallery .gallery-item:hover img {
    transform: scale(1.2);
}

.gallery .gallery-item:hover .gallery-content {
    background: rgba(19, 53, 123, 0.8);
}

.gallery .tab-class .nav-item {
    padding: 0 0 20px 0;
}
.gallery .tab-class .nav-item a.active {
    background: var(--bs-primary) !important;
}

.gallery .tab-class .nav-item a.active span {
    color: var(--bs-white) !important;
}

  .input-group-text, .form-control {
            border-radius: 0;
        }
        .datepicker {
            z-index: 9999;
        }
        .input-group.date {
            display: flex;
        }
        .input-group.date .form-control {
            border-right: none;
        }
        .input-group.date .input-group-append .input-group-text {
            border-left: none;
        }
        
        /* Datepicker 전체 컨테이너 스타일 */
.datepicker {
    border: 1px solid #ddd; /* 기본 테두리 색상 */
    border-radius: 0.375rem; /* 모서리 둥글기 */
    background-color: #fff; /* 배경색 */
}

/* Datepicker 헤더 스타일 */
.datepicker-header {
    background-color: #007bff; /* 헤더 배경색 */
    color: #fff; /* 헤더 텍스트 색상 */
    border-bottom: 1px solid #0056b3; /* 헤더 하단 테두리 색상 */
}

/* Datepicker 테이블 스타일 */
.datepicker-days {
    border: none; /* 테이블 테두리 제거 */
}

.datepicker-days td, .datepicker-days th {
    padding: 0.5rem; /* 셀 내 여백 */
    text-align: center; /* 셀 텍스트 정렬 */
}

/* 선택된 날짜 스타일 */
.datepicker-days .active {
    background-color: #18A8F1; /* 선택된 날짜 배경색 */
    color: #fff; /* 선택된 날짜 텍스트 색상 */
    border-radius: 0.375rem; /* 선택된 날짜의 둥글기 */
}

/* 날짜 선택 버튼 스타일 */
.datepicker-buttons {
    background-color: #007bff; /* 버튼 배경색 */
    color: #fff; /* 버튼 텍스트 색상 */
    border: none; /* 버튼 테두리 제거 */
    border-radius: 0.375rem; /* 버튼 모서리 둥글기 */
}

/* 날짜 선택 버튼 호버 스타일 */
.datepicker-buttons:hover {
    background-color: #0056b3; /* 호버 시 버튼 배경색 */
}
        
        
        
/*** Gallery End ***/
</style>
</head>
<body>
<!-- sch -->
        <div class="container-fluid py-5 mb-3 hero-header" style="font-family: pretendard;">
            <div class="container pt-1 pb-4">
                <div class="row m-2 g-5 align-items-center">
                    <div class="col-md-12">
                        <h4 class="mb-1 text-light display-5" style="font-weight: 600;">두둥실 떠나고 싶으신 곳이 있나요?</h4>
                        <div class="container mt-5">
                  <!-- 작업시작 -->
                  
<div class="container mt-5">
    <div class="search-form-container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="domestic-tab" data-bs-toggle="tab" href="#domestic" role="tab" aria-controls="domestic" aria-selected="true">국내 숙소</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="overseas-tab" data-bs-toggle="tab" href="#overseas" role="tab" aria-controls="overseas" aria-selected="false">여행 정보</a>
            </li>
        </ul>
        <div class="tab-content mt-1" id="myTabContent">
           <div class="container mt-5">
    <form class="d-flex" action="${pageContext.request.contextPath}/room/list">
        <div class="py-3 input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input name="kwd" type="text" class="form-control" placeholder="여행지나 숙소를 검색해보세요">
        </div>
        <div class="input-group mx-2">
            <span class="input-group-text"><i class="bi bi-calendar"></i></span>
            <input name = "sdate" type="text" id="startDate" class="form-control" placeholder="시작 날짜">
            <input name = "edate" type="text" id="endDate" class="form-control" placeholder="종료 날짜">
        </div>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-people"></i></span>
            <input name = "people" type="text" class="form-control" placeholder="인원 입력">
        </div>
        <button type="submit" class="btn btn-primary ms-2">검색</button>
    </form>
</div>
            <div class="tab-pane fade" id="overseas" role="tabpanel" aria-labelledby="overseas-tab">
                <!-- 해외 숙소 검색 폼 -->
            </div>
        </div>
    </div>
</div>

</div>
                    </div>
                </div>
            </div>
        </div>

</body>
<!-- sch end -->
 <!-- Gallery Start -->
 <div class="container-xxl py-5">
    <div class="container">
      <div class="col-lg-18">
        <div class="container-fluid gallery py-3 my-3">
          <div class="mx-auto text-center mb-5" style="max-width: 900px;">
            <h3 class="section-title px-3 text-center">어디갈지 고민중이라면?</h3>
            <h1 class="section-title px-3 text-center bold">🚗 국내 인기 여행지</h1>
          </div>
          <div class="tab-class text-center">
            <div class="tab-content">
              <div id="GalleryTab-1" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://mblogthumb-phinf.pstatic.net/MjAyMjA1MTZfMTkx/MDAxNjUyNjI5MDg1ODQ3.OiG9Nx0UJhOftoeGcd4UiZMOj9f3l9hw4n5Vd8FjOh4g.HVGL_VkhNwn4ngJ0CoaY-DA8vml37ZhUhHzdRelhCwwg.JPEG.lily_0901/SE-A1CCF59C-844B-4A01-A781-4FA43BFF6198.jpg?type=w800" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">전라북도 익산</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=익산" class="btn-hover text-white"> 숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://res.cloudinary.com/kyte/image/upload/w_312,q_auto,f_auto,e_sharpen:50/content/shutterstock/KR/suncheon_3" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">전라남도 순천</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=순천" class="btn-hover text-white">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://i.namu.wiki/i/DK-BcaE6wDCM-N9UJbeQTn0SD9eWgsX9YKWK827rqjbrzDz0-CxW-JFOCiAsUL3CBZ4zE0UDR-p4sLaYPiUjww.webp" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">서울 남산</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=남산" class="btn-hover text-white">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBByag7QGT_-DOvBHk01vwiXdlRHnOWbvfog&s" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">경기도 남앙주시</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=남양주" class="btn-hover text-white">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://i.namu.wiki/i/hkDOgJHC40yiIFKQDRz7YjHpzWrL9vCTT7mve4TF6Lj-GpGsBpvT8WlXbwOT_To1Ndl1zKrVLQ-SiwaGNFOgQA.webp" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">부산 해운대</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=해운대" class="btn-hover text-white">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://jpassets.jobplanet.co.kr/production/uploads/company_story/contents/2023/11/17/296f61d8-3f69-458c-868d-37f2256c5e1a.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">서울 영등포</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=영등포" class="btn-hover text-white">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdLGCmigqdmccLsThLn6etZgDL4XzYXkKT2A&s" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">서울 홍대</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=홍대" class="btn-hover text-white">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://cdn.imweb.me/upload/S201712205a3a0910b89f5/9ad67bba021e8.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">강원도 고성</h5>
                          <a href="${pageContext.request.contextPath}/room/list?kwd=고성" class="btn-hover text-white">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- 추가적인 갤러리 항목들 -->
                </div>
              </div>
              <!-- 다른 탭들 -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
            
        <!-- Gallery End -->
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $('#startDate').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true,
            startDate: new Date(),
            language: 'ko'  // 한글 로케일 설정
        }).on('changeDate', function(selected) {
            var startDate = new Date(selected.date.valueOf());
            $('#endDate').datepicker('setStartDate', startDate);
        });

        $('#endDate').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true,
            startDate: new Date(),
            language: 'ko'  // 한글 로케일 설정
        }).on('changeDate', function(selected) {
            var endDate = new Date(selected.date.valueOf());
            $('#startDate').datepicker('setEndDate', endDate);
        });
    });
</script>
