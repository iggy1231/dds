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
        <h5 class="mt-3"> 두둥! 여행가자!</h5>
	        <div id="tab-pane-1" class="tab-pane fade show p-0 active">
	                <div class="row justify-content-center">
	                    <div class="col-md-12 wow fadeInUp" data-wow-delay="0.3s">
	                    	<div class="property-item rounded overflow-hidden">
	                    	    <div class="flex-container">
			                        <div class="flex-item">
			                            <div>
			                                <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="img-fluid rounded" alt="숙소 이미지">
			                            </div>
			                        </div>
			                        
			                        <div class="flex-item">
			                            <div class="px-1 py-2 pb-3">
			                                <a class="d-block h4 mb-2 mt-2" href="" style="font-size:24px; font-weight: 600;">순천 파라다이스 호텔</a>
			                                <h6 class="display-10" style="color: #666565;">비지니스룸 • 1박</h6>
	
			                            </div>
			                        </div>
			                        
			                        <div class="flex-item" style="margin-left:auto; display:flex; align-items:top;">
								        <a href="#" style="color: #18A8F1; font-size:14px;">예약상세 &gt;</a>
								    </div>
			                    </div>
			                    
			                    <div class="flex-item" style="display: flex; justify-content: space-evenly; margin-top: 10px;">
                                    <div>
                                        <span>체크인</span><br>
                                        <span>2024.07.12</span>
                                    </div>
                                    <div>
                                        <span>|</span>
                                    </div>
                                    <div>
                                        <span>체크아웃</span><br>
                                        <span>2024.07.13</span>
                                    </div>
                                    
                                </div>
			                	<!-- 예약 취소 버튼과 더보기 버튼을 오른쪽 하단에 배치 -->
                            <div class="flex-item" style="display: flex; justify-content: flex-end; margin-top: 10px;">
                                <button class="btn btn-primary" style="margin-right: 5px;">예약 취소</button>
                                <div class="dropdown">
                                    <button onclick="toggleDropdown()" class="btn btn-outline-secondary">...</button>
                                    <div id="myDropdown" class="dropdown-content">
                                        <a href="#">문의</a>
                                        <a href="#">리뷰</a>
                                    </div>
                                </div>
                            </div>
			                </div>
	                    </div> 
					</div>
        <hr>
        <h5 class="mt-3"> 두둥! 추억!</h5>
        <div class="tab-content mt-3">
	        <div id="tab-pane-1" class="tab-pane fade show p-0 active">
	                <div class="row justify-content-center">
	                    <div class="col-md-12 wow fadeInUp" data-wow-delay="0.3s">
	                    	<div class="property-item rounded overflow-hidden">
	                    	    <div class="flex-container">
			                        <div class="flex-item">
			                            <div>
			                                <img src="${pageContext.request.contextPath}/resources/images/noimage.png" class="img-fluid rounded" alt="숙소 이미지">
			                            </div>
			                        </div>
			                        
			                        <div class="flex-item">
			                            <div class="px-1 py-2 pb-3">
			                                <a class="d-block h4 mb-2 mt-2" href="" style="font-size:24px; font-weight: 600;">순천 파라다이스 호텔</a>
			                                <h6 class="display-10" style="color: #666565;">비지니스룸 • 1박</h6>
	
			                            </div>
			                        </div>
			                        
			                        <div class="flex-item" style="margin-left:auto; display:flex; align-items:top;">
								        <a href="#" style="color: #18A8F1; font-size:14px;">예약상세 &gt;</a>
								    </div>
			                    </div>
			                    
			                    <div class="flex-item" style="display: flex; justify-content: space-evenly; margin-top: 10px;">
                                    <div>
                                        <span>체크인</span><br>
                                        <span>2024.07.12</span>
                                    </div>
                                    <div>
                                        <span>|</span>
                                    </div>
                                    <div>
                                        <span>체크아웃</span><br>
                                        <span>2024.07.13</span>
                                    </div>
                                    
                                </div>
			                	<!-- 예약 취소 버튼과 더보기 버튼을 오른쪽 하단에 배치 -->
                            <div class="flex-item" style="display: flex; justify-content: flex-end; margin-top: 10px;">
                                <button class="btn btn-secondary" style="margin-right: 5px;">다시예약</button>
                                <button class="btn btn-primary" style="margin-right: 5px;">리뷰작성</button>
                                <div class="dropdown">
                                    <button onclick="toggleDropdown()" class="btn btn-outline-secondary">...</button>
                                    <div id="myDropdown" class="dropdown-content">
                                        <a href="#">문의</a>
                                        <a href="#">리뷰</a>
                                    </div>
                                </div>
                            </div>
			                </div>
	                    </div> 
					</div>
			</div>
        </div>
			</div>
        </div>
	</div>
</div>

<script>
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
</script>