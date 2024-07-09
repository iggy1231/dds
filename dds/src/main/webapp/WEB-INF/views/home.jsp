<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
 * {
            font-family: pretendard;
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
        }
        .property-item:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        
       .carousel-caption {
            top: 50%;
            transform: translateY(-22%);
        }
</style>

<div class="m-4 p-4"></div>

 <!-- Hero Start -->
        <div class="container-fluid py-5 mb-3 hero-header" style="font-family: pretendard;">
            <div class="container pt-1 pb-4">
                <div class="row m-2 g-5 align-items-center">
                    <div class="col-md-12">
                        <h4 class="mb-1 text-light display-7" style="font-weight: 600;">두둥실 떠나는</h4>
                        <h2 class="mb-3 text-light display-5" style="font-weight: 600;">신나는 여행</h2>
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
        <!-- Hero End -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="col-lg-12">
            <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                <h1 class="mb-3 display-6 text-primary" style="font-weight: 600;">진행중 이벤트</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="property-item rounded overflow-hidden">
                        <div class="event-image">
                            <a href=""><img class="img-fluid" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e3628_dnpqqosj_1200x480_1_20240430191228.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="property-item rounded overflow-hidden">
                        <div class="event-image">
                            <a href=""><img class="img-fluid" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e3892_dnpqqosj_1200x480hotxoq_20240626092644.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="property-item rounded overflow-hidden">
                        <div class="event-image">
                            <a href=""><img class="img-fluid" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e3606_dnpqqosj_1200x480_1_20240605101842_20240605102555.png" alt=""></a>
                        </div>
                    </div>
                </div>
                
                <!-- 추가 카드 여기에 추가 -->
            </div>
        </div>
    </div>
</div>
        
<!-- Property List Start -->
 <div class="container-xxl py-5">
    <div class="container ">
        <div class="row g-0 gx-5 align-items-end">
            <div class="col-lg-6">
                <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                    <h1 class="mb-3 display-6 text-primary" style="font-weight: 600;">여행 상품</h1>
                </div>
            </div>
            <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">숙소</a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="py-1 px-4 btn btn-outline-primary" data-bs-toggle="pill" href="#tab-2">투어</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href=""><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" alt=""></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ 9.6</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5>펜션</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1">50,000원</h4>
                                <a class="d-block h4 mb-2" href="">익산 함께해요 펜션</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;서울시 마포구 oo로</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;199개</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <!-- Property List End -->
        
<div class="container-xxl py-3">
    <div class="container">
	   <div id="carouselExampleCaptions" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="rounded carousel-inner">
            <div class="carousel-item active">
                <img src="https://www.yeogi.com/_next/image?url=https%3A%2F%2Fstatic.yeogi.com%2F_next%2Fstatic%2Fmedia%2F03_Kv_PC_Light.c2b0d0f8.png&w=912&q=100" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>순천시 순천만</h3>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://www.yeogi.com/_next/image?url=https%3A%2F%2Fstatic.yeogi.com%2F_next%2Fstatic%2Fmedia%2F03_Kv_PC_Light.c2b0d0f8.png&w=912&q=100" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>익산시 미륵사지 석탑</h3>
                </div>
            </div>
            <div class="carousel-item">
                <img src="https://www.yeogi.com/_next/image?url=https%3A%2F%2Fstatic.yeogi.com%2F_next%2Fstatic%2Fmedia%2F03_Kv_PC_Light.c2b0d0f8.png&w=912&q=100" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>부산 해운대</h3>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
</div>
							
        
        

