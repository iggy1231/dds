<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
 * @font-face {
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
        }
        .property-item:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        
       .carousel-caption {
            top: 50%;
            transform: translateY(-22%);
        }
        
        .carousel-item {
    height: 45vh; /* 원하는 vh 값을 설정하세요 */
}

.carousel-item img {
    height: 100%; /* 이미지가 캐러셀의 높이에 맞게 조정되도록 설정 */
    object-fit: cover; /* 이미지를 잘라서 맞춤 */
}
        
        
.testimonial-item {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 50px; /* 이미지가 카드 아래로 나오도록 하기 위한 여백 */
    background-color: white; /* 기본 배경색 */
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
    padding: 50px 20px 20px 20px; /* 이미지 크기 만큼의 패딩 추가 */
    border-radius: 10px;
    margin-bottom: 50px; /* 이미지와 텍스트 사이의 간격 */
}

.testimonial-comment::after {
    content: "";
    display: block;
    height: 30px; /* 이미지 크기와 동일한 높이 */
}

.testimonial-item h5,
.testimonial-item p {
    margin: 5px 0 0 0;
    padding-top: 15px; /* 이미지와의 간격을 위해 여백 추가 */
}

.ratio-4x3 {
    aspect-ratio: 4 / 3;
    width: 100%;
    object-fit: cover;
}

/*** Testimonial Start ***/
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

/*** Testimonial End ***/

.img-fluid-hover {
    transition: 0.3s ease; /* 부드러운 전환 효과 추가 */
}

.img-fluid-hover:hover {
    filter: brightness(75%); /* 호버 시 이미지 밝기를 70%로 낮춤 */
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
        
</style>


 <!-- Hero Start -->
        <div class="container-fluid py-5 mb-3 hero-header">
            <div class="container pt-1 pb-4">
                <div class="row m-2 g-5 align-items-center">
                    <div class="col-md-12">
                        <h2 class="mb-1 text-light display-5" style="font-weight: 600;">두둥실 떠나는</h2>
                        <h2 class="mb-1 text-light display-5" style="font-weight: 600;">신나는 여행</h2>
                        <div class="container mt-4">
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
						            <div class="tab-pane fade show active my-3" id="domestic" role="tabpanel" aria-labelledby="domestic-tab">
						                <form class="d-flex" name="searchForm" action="${pageContext.request.contextPath}/room/list">
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
						            <div class="tab-pane fade" id="overseas" role="tabpanel" aria-labelledby="overseas-tab">
						                <form class="d-flex" name="searchForm" action="${pageContext.request.contextPath}/info/search">
						                    <div class="input-group mr-1 pe-2">
						                        <span class="input-group-text"><i class="p-2 bi bi-search"></i></span>
						                        <input name="kwd" type="text" class="p-3 form-control" placeholder="원하는 여행지를 검색해보세요">
						                    	<input type="hidden" name="schType" value="all">
						                    </div>
						                    <button type="submit" class="p-3  btn btn-primary">검색</button>
						                </form>
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
            <div class="text-start mx-auto mb-5 wow slideInLeft d-flex justify-content-between align-items-center" data-wow-delay="0.1s">
    			<h1 class="mb-3 display-6 text-primary" style="font-weight: 600;">진행중 이벤트</h1>
    			<a href="${pageContext.request.contextPath}/event/progress/list" style="font-size: 1rem;">자세히 ></a>
			</div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="property-item rounded overflow-hidden">
                        <div class="event-image">
                            <a href="${pageContext.request.contextPath}/room/list?kwd=부산&sdate=2024-07-25&edate=2024-07-27&people=2"><img class="img-fluid" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e3628_dnpqqosj_1200x480_1_20240430191228.png" alt=""></a>
                        </div>  
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="property-item rounded overflow-hidden">
                        <div class="event-image">
                            <a href="${pageContext.request.contextPath}/event/progress/article?page=1&&num=15"><img class="img-fluid" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e3892_dnpqqosj_1200x480hotxoq_20240626092644.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="property-item rounded overflow-hidden">
                        <div class="event-image">
                            <a href="${pageContext.request.contextPath}/event/progress/article?page=1&&num=16"><img class="img-fluid" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e3606_dnpqqosj_1200x480_1_20240605101842_20240605102555.png" alt=""></a>
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
                <c:forEach var="room" items="${topRatedRooms}">
                   <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="property-item rounded overflow-hidden">
                            <div class="position-relative overflow-hidden">
                                <a href="${pageContext.request.contextPath}/room/article?num=${room.num}"><img class="ratio ratio-4x3 img-fluid img-fluid-hover" src="${pageContext.request.contextPath}/uploads/room/${room.thumbnail}" alt="${room.subject}"></a>
                                <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">★ ${room.rating}</div>
                                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><h5 style="font-weight: 600;">${room.roomType}</h5></div>
                            </div>
                            <div class="px-4 py-2 pb-3">
                                <h4 class="text-primary my-2 pt-1" style="font-weight: 600;">${room.price}원</h4>
                                <a class="d-block h4 mb-2" href="${pageContext.request.contextPath}/room/article?num=${room.num}" style="font-weight: 600;">${room.subject}</a>
                                <h6 class="display-10 py-1" style="color: #666565;"><i class="text-primary bi bi-geo-alt-fill"></i>&nbsp;${room.addr1}</h6>
                                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;${room.reviewCount}개</h6>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
        <!-- Property List End -->
        
<div class="container-xxl pt-4">
    <div class="container">
	   <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
        <div class="rounded carousel-inner">
            <div class="carousel-item active" data-bs-interval="2000">
                <img src="https://i.namu.wiki/i/h3jpSjw3HY2pEAPIyw0NErxH1ctxVpyIBcf9SrCPpYQ1h3M8ggyoPEAoLYZqjY_vYOoxxsJo8xZdrY0dRLiTfw.webp" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>순천시 순천만</h3>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="https://www.cha.go.kr/unisearch/images/national_treasure/2021030208283100.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>익산시 미륵사지 석탑</h3>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="https://i.namu.wiki/i/hkDOgJHC40yiIFKQDRz7YjHpzWrL9vCTT7mve4TF6Lj-GpGsBpvT8WlXbwOT_To1Ndl1zKrVLQ-SiwaGNFOgQA.webp" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>부산 해운대</h3>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/1jPF/image/6dTBQAAJW6QLbLUaneCZWL3Vhf4.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3>제주도 성산일출봉</h3>
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



<!-- Testimonial Start -->
        <div class="together container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="text-center mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
            <h3 class="mb-2 display-8 text-black" style="font-weight: 600;">함께 떠나요! 😊</h3>
            <h1 class="mb-3 display-6 text-black" style="font-weight: 600;">여행 동행 리스트</h1>
        </div>
                <div class="testimonial-carousel owl-carousel">
                	<c:forEach var="companion" items="${companions}">
	                    <div class="testimonial-item text-center rounded pb-4" onclick="companionArticle(${companion.num});">
	                        <div class="d-flex justify-content-center align-items-center testimonial-comment bg-primary rounded p-4" style="height: 200px;">
							    <h4 class="text-center lh-lg">${companion.subject}</h4>
							</div>
	                        <div style="margin-top: -35px;">
	                            <h3 class="mb-0 mt-3">${companion.nickname}</h3>
	                   			 <h4 class="p-3 mb-0"><i class="text-primary bi bi-geo-alt-fill"></i>  ${companion.mainRegion}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<i class="text-primary bi bi-person-circle"></i>  ${companion.total_people}인</h4>
	                        </div> 
	                    </div>
                	</c:forEach>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->

<!-- 회원가입 이벤트 배너 시작 -->
<div class="container-xxl py-3">
    <div class="container">
        <div class="row align-items-center rounded p-4" style="background-color: #EDEBFF;">
            <div class="col-md-8">
                <h4 class="mb-2" style="font-weight: 600;">회원가입만 해도 받는 멤버십 혜택</h4>
                <h5 class="mb-3">로그인 하면 멤버십 할인으로 예약할 수 있어요.</h5>
                <a href="${pageContext.request.contextPath}/member/login">
                <button  type="button" class="btn btn-primary me-3">로그인/회원가입</button>
                </a>
            </div>
            <div class="col-md-4 text-center">
                <img src="${pageContext.request.contextPath}/resources/images/main_event_icon.png" alt="Membership Benefits" class="img-fluid">
            </div>
        </div>
    </div>
</div>
<!-- 회원가입 배너 끝 -->

       
	
<script>
function companionArticle(num) {
	location.href='${pageContext.request.contextPath}/companion/article?num='+num;
}


$(document).ready(function(){
    $('.testimonial-carousel').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        navText: [
            '<i class="px-2 bi bi-arrow-left" style="font-size: 1.3rem;"></i>',
            '<i class="px-2 bi bi-arrow-right" style="font-size: 1.3rem;"></i>'
        ],
        autoplay: true,
        autoplayTimeout: 2500,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 2
            }
        },
        onInitialized: function(event) {
            setOwlStageOuterPadding();
        },
        onResized: function(event) {
            setOwlStageOuterPadding();
        }
    });

    function setOwlStageOuterPadding() {
        $('.owl-stage-outer').css('padding', '1rem'); // Adjust padding as needed
    }
});
</script>				

<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "a7a42b8e-be02-4a45-be4a-ddab76186545"
  });
</script>

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
        
        

