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

.image-gallery img {
    transition: 0.3s ease; /* 부드러운 전환 효과 추가 */
}

.image-gallery img:hover {
    filter: brightness(70%); /* 호버 시 이미지 밝기를 70%로 낮춤 */
}

.ratio {
    position: relative;
    width: 95%;
}

.heart-button {
	margin-right: 15px;
    align-items: center;
    justify-content: center;
    width: 50px;
    height: 50px;
    border: 2px solid #ccc;
    border-radius: 50%;
    background-color: #f6f8fa;
    font-size: 20px;
    color: #333;
    transition: background-color 0.3s ease, border-color 0.3s ease;
    outline: none;
}

.heart-button:hover {
    background-color: #e1e4e8;
    border-color: #a0a0a0;
}

#map {
	height: 400px; 
}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #18A8F1;
	color: #fff;
}

.tab-pane { min-height: 300px; }

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #BEE8FD; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #18A8F1; }

.graph { font-size: 0;  letter-spacing: 0; word-spacing: 0; }
.graph-title { padding-right: 3px; }
.graph .one-space { font-size:13px; background:#eee;}
.graph .one-space:after { content: ''; display: inline-block; width:17px; }
.graph .one-space.on{ background:  #BEE8FD; }
.graph .one-space:first-child{ border-top-left-radius:5px;  border-bottom-left-radius:5px; }
.graph .one-space:last-child{ border-top-right-radius:5px; border-bottom-right-radius:5px; }
.graph-rate { padding-left: 5px; display: inline-block; width: 60px; text-align: left; }

.deleteReview, .notifyReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .notifyReview:hover { font-weight: 500; color: #2478FF; }
.qna-form textarea { width: 100%; height: 75px; resize: none; }
.qna-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.qna-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

.deleteQuestion, .notifyQuestion { cursor: pointer; padding-left: 5px; }
.deleteQuestion:hover, .notifyQuestion:hover { font-weight: 500; color: #2478FF; }

.customratio {
	--bs-aspect-ratio: 60%;
	width: 83%;
}

</style>

<script type="text/javascript">





</script>

<div data-bs-spy="scroll" data-bs-target="#topBox" data-bs-offset="0" tabindex="0">
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
            <a class="nav-link" href="#caution">주의 사항</a>
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
    <div class="col-md-6 pe-1 d-flex align-items-stretch" style="height: 600px;">
    <img src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}" class="img-fluid rounded w-100 left-img" alt="메인 이미지" style="object-fit: cover; height: 100%;">
</div>

    <div class="col-md-6 right-col">
        <div class="row g-3">
    <c:forEach var="photo" items="${photo}" begin="0" end="3">
            <div class="col-6 d-flex align-items-stretch" style="height: 292.01px;">
                <img src="${pageContext.request.contextPath}/uploads/room/${photo.photo}" class="img-fluid rounded w-100 right-img" alt="이미지" style="object-fit: cover; height: 100%;">
            </div>
    </c:forEach>
          
        </div>
    </div>
</div>

    <!-- 가격 및 예약 버튼 섹션 -->
    <div  class="row my-4 p-1 pt-4">
        <div class="col-md-8">
            <h5 class="fw-medium" style="color: #f1c40f">${dto.room_type}</h5>
            <h3 class="fw-semibold py-1">${dto.subject}</h3>
            <h5 class="py-1"><i class="text-primary bi bi-geo-alt-fill fw-semibold"></i>&nbsp;${dto.addr1}</h5>
            <h2 class="py-2 text-primary fw-semibold">${dto.price} / 박</h2>
        </div>
        <div class="col-md-4 text-end p-3">
        	<div class="d-flex justify-content-end align-items-center">
        	<button class="heart-button" type="button" onclick="wish(${dto.num})">
        		<c:if test="${liked eq 'true'}">
        			<i class="bi bi-heart-fill" style="color: #FF2424;"></i>
        		</c:if>
        		<c:if test="${liked eq 'false'}">
        			<i class="bi bi-heart" style="color: #A6A6A6;"></i>
        		</c:if>
        	</button>
           		<button class="fs-5 btn btn-primary" onclick="scrollToRooms()">예약하기</button>
           </div>
        </div>
    </div>
    <hr>

    <!-- 지도 위치 섹션 -->
    <div id="address" class="row g-0 mb-5 mt-3 p-1">
        <div class="col-8 row g-0">
            <h3 class="fw-semibold pb-2">숙소 위치</h3>
            <div id="map" class="rounded"></div>
        	<h5 class="fw-semibold py-3">📍 ${dto.addr1} / ${dto.addr2}</h5>
        </div>
    </div>
    
<!-- 상세 설명 섹션 -->
<div id="details" class="row mb-5 mt-3 p-1">
    <div class="col-12">
        <h3 class="fw-semibold pb-2">상세 설명</h3>
        <div id="collapseImageContainer" class="collapse-image-container position-relative">
            ${dto.content}
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
    <div id="facility" class="row mb-5 mt-4 p-1">
        <div class="col-12">
            <h3 class="fw-semibold pb-2">시설 정보</h3>
            <p class="fs-5 fw-medium py-3">${dto.facility_content} </p>
        </div>
    </div>
    
    <!-- 주의 사항 섹션 -->
    <div id="caution" class="row mb-5 mt-4 p-1">
        <div class="col-12">
            <h3 class="fw-semibold pb-2">주의 사항</h3>
            <p class="fs-5 fw-medium"> ${dto.caution} </p>
           
        </div>
    </div>

    <!-- 객실 선택 섹션 -->
<div id="rooms" class="row mb-5 mt-4 p-1">
    <div class="col-12">
        <h3 class="fw-semibold pb-3">객실 선택</h3>
        <c:forEach var="detail" items="${detail}">
		    <div class="card mb-3">
		        <div class="row g-0 align-items-center">
		            <div class="col-md-4">
		                <div class="ratio ratio-4x3">
		                    <img src="${pageContext.request.contextPath}/uploads/room/${detail.detail_photo}" class="img-fluid rounded-start" alt="객실 이미지">
		                </div>
		            </div>
		            <div class="col-md-5">
		                <div class="card-body p-2">
		                    <h2 class="card-title fw-semibold pb-2">${detail.name}</h2>
		                    <h5 class="card-text py-1 fw-medium">🛏️ ${detail.content}</h5>
		                    <h5 class="card-text py-2 fw-medium">👥 ${detail.people}인실</h5>
		                </div>
		            </div>
		            <div class="col-md-3 text-end p-3 pe-4">
		                <h4 class="text-primary fw-semibold">${detail.price}원 / 박</h4>
		                <form id="reservationForm_${detail.detail_num}" method="get" action="${pageContext.request.contextPath}/room/payment">
		                    <input type="hidden" name="num" value="${dto.num}">
		                    <input type="hidden" name="detail_num" value="${detail.detail_num}">
		                    <input type="hidden" name="sdate" value="${sdate}">
		                    <input type="hidden" name="edate" value="${edate}">
		                    <input type="hidden" name="people" value="${detail.people}">
		                    <input type="hidden" name="photo" value="${dto.thumbnail}">
		                    <input type="hidden" name="name" value="${detail.name}">
		                    <button type="button" class="btn btn-primary fs-5 pt-1" onclick="sendOk(${detail.detail_num})">예약하기</button>
		                </form>
		            </div>
		        </div>
		    </div>
		</c:forEach>
    </div>
</div>

<!-- 리뷰 -->
<hr class="m-4 mt-5" style="border-color: #c7c7c7;">
<div id="reviews" class="body-main">
                <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
                    <li class="nav-item active" role="presentation">
                        <button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 리뷰 </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 상품문의 </button>
                    </li>
                </ul>
                
                <div class="tab-content pt-2" id="myTabContent">
                    <div class="tab-pane fade active show" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
                        <div class="mt-3 pt-3">
                        <div class="mt-2 pt-1 pb-2">
                            <p class="fs-4 fw-semibold">📝 실제 이용하신 분들의 리뷰</p> 
                        </div>
                        <div class="mb-4 p-2 row bg-light rounded d-flex justify-content-center">
							<div class="col p-2 text-center d-flex flex-column justify-content-center">
								<div class="fs-6 fw-semibold">상품만족도</div>
								<div class="score-star review-score-star">
									<c:forEach var="n" begin="1" end="5">
										<c:set var="score" value=""/>
										<span class="item fs-2"><i class="bi bi-star-fill"></i></span>
									</c:forEach>
								</div>
								<div class="fs-2">
									<label class="review-score">4 / 5</label> 
								</div>
							</div>
						
						<div class="col p-3 text-center d-flex flex-column justify-content-center">
							<div class="fs-6 fw-semibold">리뷰수</div>
							<div class="fs-2"><i class="bi bi-chat-right-text"></i></div>
							<div class="fs-2 review-reviewCount">${datacount}</div>
						</div> 
						
						<div class="col p-3 text-center d-flex flex-column justify-content-center review-rate">
							<div class="fs-6 fw-semibold">평점비율</div>
							<div class="p-1 score-5">
								<span class="graph-title">5점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-4">
								<span class="graph-title">4점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-3">
								<span class="graph-title">3점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-2">
								<span class="graph-title">2점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
							<div class="p-1 score-1">
								<span class="graph-title">1점</span>
								<span class="graph">
									<c:forEach var="n" begin="1" end="10">
										<label class="one-space"></label>
									</c:forEach>
								</span>
								<span class="graph-rate">0%</span>
							</div>
						</div>
					</div>
                        </div>
                        
                        <div class="mt-2 list-review"></div>
                    </div>
                    
                    <!-- 상품 문의사항 -->
					<div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
					    <div class="d-flex align-items-center justify-content-between mt-3 pt-3 border-bottom pb-3">
					        <p class="fs-4 fw-semibold mb-0">상품 문의 사항</p>
					        <div class="text-end">
					            <button type="button" class="btnMyQuestion btn btn-dark" ${empty sessionScope.member ? "disabled" : ""}> 내 Q&amp;A 보기 </button>
					            <button type="button" class="btnQuestion btn btn-dark" ${empty sessionScope.member ? "disabled" : ""}> 상품 Q&amp;A 작성 </button>
					        </div>
					    </div>
					   <div class="mt-1 p-2 list-question"></div>
					</div>
                    </div>
                </div>
</div>
</div>
<!-- 문의사항 모달 -->
<div class="modal fade" id="questionDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="questionDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="questionDialogModalLabel">상품 문의 하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
<div class="modal-body">
	<div class="qna-form p-2">
		<form name="questionForm" action="${pageContext.request.contextPath}/room/writeQnA" method="post">
			<div class="row">
				<div class="col">
					<span class="fw-bold fs-6">문의사항 쓰기</span><span>&nbsp;&nbsp;&nbsp;※ 상품 및 상품 구매 과정과 관련없는 글은 삭제 될 수 있습니다.</span>
				</div>
				<div class="col-2 text-end">
					<input type="checkbox" name="anonymous" id="secret1" class="form-check-input" value="1">
					<label class="form-check-label" for="secret1"> 🔒 비공개</label>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-2">
					<h5>제목 :</h5>
				</div>
				<div class="col-10">
					<input name="subject" id="subject" type="text" placeholder="문의사항 제목 입력" class="form-control">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-2">
					<h5>내용 :</h5>
				</div>
				<div class="col-10">
					<textarea name="content" id="question" class="form-control" rows="5"></textarea>
				</div>
			</div>
			<input type="hidden" name="num" value="${dto.num}">
			<input type="hidden" name="page" value="1">
		</form>
	</div>
</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnQuestionSendOk">문의등록 <i class="bi bi-check2"></i> </button>
				<button type="button" class="btn btn-secondary btnQuestionSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b59618d7930e511d9920498a877b177&libraries=services"></script>
<script type="text/javascript">
function wish(num) {
	if('${liked}'=='true') {
		alert('이미 위시리스트에 담긴 상품입니다');
		return;
	}
	
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = '${pageContext.request.contextPath}/room/insertWishList';
    
    var input = document.createElement('input');
    input.type = 'hidden'
    input.name = 'num';
    input.value = num;
    
    var page = document.createElement('input');
    page.type = 'hidden'
    page.name = 'page';
    page.value = '${page}';
    
    var sdate = document.createElement('input');
    sdate.type = 'hidden'
    sdate.name = 'sdate';
    sdate.value = '${sdate}';
    
    var edate = document.createElement('input');
    edate.type = 'hidden'
    edate.name = 'edate';
    edate.value = '${edate}';
    
    form.appendChild(input);
    form.appendChild(page);
    form.appendChild(sdate);
    form.appendChild(edate);

    document.body.appendChild(form);
    form.submit();
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new window.kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new window.kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new window.kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${dto.addr1}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	console.log(coords);
    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.subject}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>

<script type="text/javascript">
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
        var offset = target.getBoundingClientRect().top + window.scrollY - 120;
        window.scrollTo({
            top: offset,
            behavior: 'smooth'
        });
    });
});
</script>

<script type="text/javascript">
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") {
			listReview(1);
		} else if(tab === "2"){
			listQuestion(1);
		}
	});
});


//리뷰 -----

$(function(){
	listRoomReview(1);
});

function listRoomReview(page) {
	let num = '${dto.num}';
	// let sortNo = $('.reviewSortNo').val();
	let url = '${pageContext.request.contextPath}/room/reviewlist';
	let query = 'num='+num+'&pageNo='+page;
	
	const fn = function(data) {
		printReview(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);
	console.log(data);
}
 
function printReview(data) {
	console.log(data);
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	if(dataCount > 0) {
		$('.reviewSort-area').show();
	} else {
		$('.reviewSort-area').hide();
	}
	
	let summary = data.summary;
	printSummary(summary);
	
	let out = '';
	for(let item of data.list) {
		let num = item.num;
		let nickName = item.nickName;
		let score = item.score;
		let review = item.review;
		let reg_date = item.reg_date;
		let content = item.content;
		// let answer_date = item.answer_date;
		let photo = item.photo;
		// let deletePermit = item.deletePermit;

		out += '<div class="mt-3">';
		out += '  <div class="row p-2">';
		out += '    <div class="col-md-8 order-md-1">';
		out += '      <div class="row ms-3">';
		out += '        <div class="col-auto pt-0 ps-2 pe-1 score-star">';
		for(let i=1; i<=5; i++) {
		    out += '          <span class="item fs-6 ' + (score>=i ? 'on' : '') + '"><i class="bi bi-star-fill"></i></span>';
		}
		out += '        </div>';
		out += '        <div class="col-auto ps-0 fs-5 ps-2"><span>' + nickName + '<span></div>';
		out += '        <div class="pt-3 text-start fs-6">';
		out += '          <span class="fs-6">' + reg_date + '</span> |';
		out += '          <span class="notifyReview fs-6" data-num="' + num + '">신고</span>';
		out += '        </div>';
		out += '      </div>';
		out += '      <div class="row">';
		out += '        <div class="col mt-2 p-2 fs-5 ps-3 ms-4">' + content + '</div>';
		out += '      </div>';
		out += '    </div>';
		if(photo && photo.length > 0) {
		    out += '    <div class="col-md-4 text-end order-md-2">';
		    out += '      <div class="ratio customratio ms-3">';
		    out += '        <img class="border rounded img-fluid" src="' + photo + '">';
		    out += '      </div>';
		    out += '    </div>';
		}
		out += '  </div>';
		out += '</div>';
		out += '<hr class = "mx-4">';

	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	}
	
	$('.list-review').html(out);
}

function printSummary(summary) {
	let count = summary.count;
	let ave = summary.ave;
	
	let score1 = summary.score1;
	let score2 = summary.score2;
	let score3 = summary.score3;
	let score4 = summary.score4;
	let score5 = summary.score5;
	let scoreRate1 = summary.scoreRate1;
	let scoreRate2 = summary.scoreRate2;
	let scoreRate3 = summary.scoreRate3;
	let scoreRate4 = summary.scoreRate4;
	let scoreRate5 = summary.scoreRate5;
	
	$(".product-reviewCount").text(count);
	$(".product-score").text("("+ave+" / 5)");
	$(".product-star .item").removeClass("on");
	let roundAve = Math.round(ave);
	for(let i=1; i<=roundAve; i++) {
		$(".product-star .item").eq(i-1).addClass("on");
	}
	
	$(".title-reviewCount").text("("+count+")");
	
	$(".review-score-star .item").removeClass("on");
	for(let i=1; i<=roundAve; i++) {
		$(".review-score-star .item").eq(i-1).addClass("on");
	}
	$(".review-score").text(ave+" / 5");
	$(".review-reviewCount").text(count);
	
	$(".review-rate .one-space").removeClass("on");

	for(let i=1; i<=Math.floor(scoreRate5/10); i++) {
		$(".review-rate .score-5 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-5 .graph-rate").text(scoreRate5+"%");
	
	for(let i=1; i<=Math.floor(scoreRate4/10); i++) {
		$(".review-rate .score-4 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-4 .graph-rate").text(scoreRate4+"%");

	for(let i=1; i<=Math.floor(scoreRate3/10); i++) {
		$(".review-rate .score-3 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-3 .graph-rate").text(scoreRate3+"%");

	for(let i=1; i<=Math.floor(scoreRate2/10); i++) {
		$(".review-rate .score-2 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-2 .graph-rate").text(scoreRate2+"%");

	for(let i=1; i<=Math.floor(scoreRate1/10); i++) {
		$(".review-rate .score-1 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-1 .graph-rate").text(scoreRate1+"%");
}

$(function(){
	$('body').on('click', '.notifyReview', function(){
		let num = $(this).attr('data-num');
		alert(num);
	});
});

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

//문의하기 -----
function listQuestion(page) {
    let num = '${dto.num}';
    let url = '${pageContext.request.contextPath}/room/qnalist';
    let query = 'num=' + num + '&page=' + page;

    const fn = function(data) {
        printQuestion(data);
    };
    ajaxFun(url, 'get', query, 'json', fn);
}

function printQuestion(data) {
    let dataCount = data.dataCount;
    let pageNo = data.page;
    let total_page = data.total_page;
    let size = data.size;
    let paging = data.paging;

    $('.title-qnaCount').html('(' + dataCount + ')');
    let out = '';
    for (let item of data.list) {
        let num = item.qna_num;
        let userName = item.userName;
        let question = item.content;
        let subject = item.subject;
        let question_date = item.reg_date;
        let answer = item.answer;
        let answer_date = item.answer_date;
        let answerState = answer ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>';
        let anonymous = item.anonymous;

        out += '<div class="mt-1 border-bottom">';
        out += '  <div class="mt-2 p-2 fw-semibold fs-5"><i class="fa-solid fa-q text-bold pe-2"></i>' + subject + '</div>';
        out += '  <div class="mt-2 p-2 fs-5">' + question + '</div>';

        out += '  <div class="row p-2">';
        out += '     <div class="col-auto pt-2 pe-0">' + answerState + '</div>';
        out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;' + userName + '</div>';
        out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>' + question_date + '</span>';
        if (anonymous === 0) {
            out += '       |<span class="notifyQuestion" data-num="' + num + '">신고</span>';
        }
        out += '      </div>';
        if (answer) {
            out += '  <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
        }
        out += '  </div>';
        if (answer) {
            out += '  <div class="p-3 pt-0 answer-content" style="display: none;">';
            out += '    <div class="bg-light">';
            out += '      <div class="p-3 pb-0">';
            out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
            out += '      </div>';
            out += '      <div class="p-3 pt-1">' + answer + '</div>';
            out += '    </div>';
            out += '  </div>';
        }
        out += '</div>';
    }

    if (dataCount > 0) {
        out += '<div class="page-navigation">' + paging + '</div>';
    }

    $('.list-question').html(out);
}


$(function(){
	$('.list-question').on('click', '.btnAnswerView', function(){
		const $btn = $(this);
		const $EL = $(this).closest('.row').next('.answer-content');
		if($EL.is(':visible')) {
			$btn.html(' <i class="bi bi-chevron-down"></i> ');
			$EL.hide(100);
		} else {
			$btn.html(' <i class="bi bi-chevron-up"></i> ');
			$EL.show(100);
		}
	});
});


function ajaxFun(url, method, query, dataType, fn, file = false) {
    $.ajax({
        url: url,
        type: method,
        data: query,
        dataType: dataType,
        success: fn,
        beforeSend: function(jqXHR) {
            jqXHR.setRequestHeader('AJAX', true);
        },
        complete: function() {},
        error: function(jqXHR) {
            if(jqXHR.status === 403) {
                alert('로그인이 필요합니다.');
                location.href = '${pageContext.request.contextPath}/member/login';
            } else if(jqXHR.status === 400) {
                alert('요청 처리 실패');
            } else {
                console.log(jqXHR.responseText);
            }
        }
    });
}


$(function(){
	$('.list-question').on('click', '.btnAnswerView', function(){
		const $btn = $(this);
		const $EL = $(this).closest('.row').next('.answer-content');
		if($EL.is(':visible')) {
			$btn.html(' <i class="bi bi-chevron-down"></i> ');
			// $EL.hide(1000);
		} else {
			$btn.html(' <i class="bi bi-chevron-up"></i> ');
			// $EL.show(1000);
		}
	});
});

$(function(){
	var sel_files = [];
	
	$("body").on("click", ".qna-form .img-add", function(){
		$(this).closest(".qna-form").find("input[name=selectFile]").trigger("click");
	});
	
	$("form[name=questionForm] input[name=selectFile]").change(function(e){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			this.files = dt.files;
			
			return false;
		}
		
		let $form = $(this).closest("form");
		
		// 유사 배열을  배열로 변환
		const fileArr = Array.from(this.files);
		
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			reader.onload = e => {
				$img.attr("src", e.target.result);		
			};
			reader.readAsDataURL(file);
			$form.find(".img-grid").append($img);
		});
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		this.files = dt.files;
	});
	
	
	$('.btnQuestion').click(function(){
		$("#questionDialogModal").modal("show");
	});
	
	// 문의하기 등록
	$('.btnQuestionSendOk').click(function(){
		const f = document.questionForm;
		let s;
		s = f.content.value.trim();
		//alert(${dto.num});
		if( ! s ) {
			alert("문의 사항을 입력하세요.")	;
			f.content.focus();
			return false;
		}
		
		f.submit();
		
		
		let url = "${pageContext.request.contextPath}/room/writeQnA";
		let query = new FormData(f); 
		
		const fn = function(data) {
			if(data.state === "true") {
				f.reset();
				$(".qna-form .img-item").each(function(){
					$(this).remove();
				});
				sel_files.length = 0;
				
				$("#questionDialogModal").modal("hide");
				
				listQuestion(1);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn, true);
	});
	
	$('.btnQuestionSendCancel').click(function(){
		const f = document.questionForm;
		f.reset();
		$(".qna-form .img-item").each(function(){
			$(this).remove();
		});
		sel_files.length = 0;
		
		$("#questionDialogModal").modal("hide");
	});	
	
	$('.btnMyQuestion').click(function(){
		location.href = '${pageContext.request.contextPath}/myPage/review?mode=qna';
	});
});

function sendOk(detailNum) {
    var form = document.getElementById('reservationForm_' + detailNum);
    form.submit();
}

function scrollToRooms() {
    var target = document.getElementById("rooms");
    var offset = target.getBoundingClientRect().top + window.scrollY - 135;
    window.scrollTo({
        top: offset,
        behavior: 'smooth'
    });
}

</script>