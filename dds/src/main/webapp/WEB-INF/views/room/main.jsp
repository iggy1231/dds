<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
    <div class="search-form-container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="domestic-tab" data-bs-toggle="tab" href="#domestic" role="tab" aria-controls="domestic" aria-selected="true">국내 숙소</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="overseas-tab" data-bs-toggle="tab" href="#overseas" role="tab" aria-controls="overseas" aria-selected="false">여행 정보</a>
            </li>
        </ul>
        <div class="tab-content mt-3" id="myTabContent">
            <div class="tab-pane fade show active" id="domestic" role="tabpanel" aria-labelledby="domestic-tab">
                <form class="d-flex" name="searchForm" action="${pageContext.request.contextPath}/search/main" method="post">
                    <div class="input-group">
                        <span class="input-group-text"><i class="p-2 bi bi-search"></i></span>
                        <input name="search_term" type="text" class="p-3 form-control" placeholder="여행지나 숙소를 검색해보세요">
                    </div>
                    <button type="button" class="p-3 btn btn-outline-secondary mx-2">
                        <i class=" bi bi-calendar"></i> 07.08 월 - 07.09 화 (1박)
                    </button>
                    <button type="button" class="p-3  btn btn-outline-secondary mx-2">
                        <i class="bi bi-people"></i> 인원 2
                    </button>
                    <button type="submit" class="p-3  btn btn-primary">검색</button>
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
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="${pageContext.request.contextPath}/room/list" class="btn-hover text-white"> 숙소 보러가기! <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
                      </div>
                    </div>
                  </div>
                   <div class="col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="gallery-item h-100">
                      <img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="img-fluid w-100 h-100 rounded" alt="Image">
                      <div class="gallery-content">
                        <div class="gallery-info">
                          <h5 class="text-white text-uppercase mb-2">World Tour</h5>
                          <a href="#" class="btn-hover text-white">View All Place <i class="fa fa-arrow-right ms-2"></i></a>
                        </div>
                      </div>
                      <div class="gallery-plus-icon">
                        <a href="img/gallery-1.jpg" data-lightbox="gallery-1" class="my-auto"><i class="fas fa-plus fa-2x text-white"></i></a>
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

</html>	   
