<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<style>
*{
	font-family: 'Pretendard-Regular';
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
            z-index: -9999;
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
        
/* Datepicker 셀 스타일 수정 */
.datepicker-days td, .datepicker-days th {
    border-radius: 50% !important; /* 완벽한 원형으로 변경 */
    padding: 0.75em; /* 셀 내 여백 */
    text-align: center; /* 셀 텍스트 정렬 */
}

/* 오늘 날짜 스타일 */
.datepicker-days .today {
    background-color: #D5D5D5; /* 오늘 날짜 배경색 */
    color: #fff; /* 오늘 날짜 텍스트 색상 */
    background-image : #D5D5D5;
}

/* 선택된 날짜 스타일 */
.datepicker-days .active {s
    background-color: #18A8F1; /* 선택된 날짜 배경색 */
    color: #fff; /* 선택된 날짜 텍스트 색상 */
}

/* 날짜 선택 버튼 스타일 */
.datepicker-buttons {
    background-color: #18A8F1; /* 버튼 배경색 */
    color: #fff; /* 버튼 텍스트 색상 */
    border: none; /* 버튼 테두리 제거 */
    border-radius: 0.375rem; /* 버튼 모서리 둥글기 */
}

/* 날짜 선택 버튼 호버 스타일 */
.datepicker-buttons:hover {
    background-color: #0056b3; /* 호버 시 버튼 배경색 */
}
        
.datepicker .datepicker-switch {
    width: 145px;
    background: #f8f9fa; /* 배경색 수정 */
}

.datepicker table tr td.day.focused,
.datepicker table tr td.day:hover {
    background: #e9ecef; /* 날짜 선택 시 배경 색상 */
    cursor: pointer;
}

.datepicker table tr td.today {
    background-color: #ffc107; /* 오늘 날짜 강조 색상 */
}

.datepicker table tr td.selected {
    background-color: #007bff; /* 선택된 날짜 색상 */
    color: #fff; /* 선택된 날짜 텍스트 색상 */
}        
        
        
        
 .custom-height {
    height: 60px; /* 원하는 높이값으로 수정하세요 */
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
                <a class="nav-link active" id="domestic-tab" data-bs-toggle="tab" href="#domestic" role="tab" aria-controls="domestic" aria-selected="true">국내 숙소 검색</a>
            </li>
        </ul>
        <div class="tab-content mt-2" id="myTabContent">
           <div class="container my-3">
    <form class="d-flex " action="${pageContext.request.contextPath}/room/list">
    <div class="py-3 input-group custom-height">
        <span class="input-group-text custom-height rounded-start"><i class="bi bi-search"></i></span> <!-- 여기에 클래스 추가 -->
        <input name="kwd" type="text" class="form-control custom-height rounded-end" placeholder="여행지나 숙소를 검색해보세요" autocomplete='off'>
    </div>
    <div class="py-3 input-group mx-1 custom-height"> 
        <span class="input-group-text custom-height rounded-start"><i class="bi bi-calendar"></i></span>
        <input name="sdate" type="text" id="startDate" class="form-control custom-height" placeholder="시작 날짜" autocomplete='off'>
        <input name="edate" type="text" id="endDate" class="form-control custom-height rounded-end" placeholder="종료 날짜" autocomplete='off'>
    </div>
    <div class="py-3 input-group custom-height"> 
        <span class="input-group-text custom-height rounded-start"><i class="bi bi-people"></i></span>
        <input name="people" type="text" class="form-control custom-height" placeholder="인원 입력" autocomplete='off'>
    <button type="submit" class="btn btn-primary ms-1 custom-height rounded-end">검색</button>
    </div>
</form>
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
							<a href="#" class="btn-hover text-white destination-link" data-kwd="익산">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
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
							<a href="#" class="btn-hover text-white destination-link" data-kwd="순천">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
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
							<a href="#" class="btn-hover text-white destination-link" data-kwd="남산">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBByag7QGT_-DOvBHk01vwiXdlRHnOWbvfog&s" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">경기도 남앙주</h5>
							<a href="#" class="btn-hover text-white destination-link" data-kwd="남양주">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
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
							<a href="#" class="btn-hover text-white destination-link" data-kwd="해운대">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
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
							<a href="#" class="btn-hover text-white destination-link" data-kwd="영등포">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="https://www.maybugs.com/news/photo/201901/659445_538877_5247.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">서울 홍대</h5>
							<a href="#" class="btn-hover text-white destination-link" data-kwd="홍대">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
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
							<a href="#" class="btn-hover text-white destination-link" data-kwd="고성">숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
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
        // Datepicker 초기화 코드
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

        // 공통 링크 클릭 이벤트
        $('.destination-link').click(function(e) {
            e.preventDefault();  // 기본 동작 방지

            // 클릭한 링크의 data-kwd 속성 값 가져오기
            var kwd = $(this).data('kwd');

            // 오늘 날짜와 오늘 날짜 +2 계산
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
            var yyyy = today.getFullYear();

            var startDate = yyyy + '-' + mm + '-' + dd;
            today.setDate(today.getDate() + 2);
            var dd2 = String(today.getDate()).padStart(2, '0');
            var mm2 = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
            var endDate = yyyy + '-' + mm2 + '-' + dd2;

            // 링크 생성
            var url = "${pageContext.request.contextPath}/room/list?kwd=" + kwd + "&sdate=" + startDate + "&edate=" + endDate + "&people=2";
            window.location.href = url;
        });
    });
</script>

