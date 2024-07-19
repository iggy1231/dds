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
</style>

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
    <div class="col-md-6 d-flex align-items-stretch">
        <img src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}" class="img-fluid rounded w-100 left-img" alt="메인 이미지">
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
            <h5>${dto.room_type }</h5>
            <h3 class="fw-semibold py-1">${dto.subject}</h3>
            <h5 class="py-1"><i class="text-primary bi bi-geo-alt-fill fw-semibold"></i>&nbsp;${dto.addr1}</h5>
            <h2 class="py-2 text-primary fw-semibold">${dto.price} / 박</h2>
        </div>
        <div class="col-md-4 text-end p-3">
        	<div class="d-flex justify-content-end align-items-center">
        	<button class="heart-button"><i class="bi bi-heart" style="color: #A6A6A6;"></i></button>
           <button class="fs-5 btn btn-primary">예약하기</button>
           </div>
        </div>
    </div>
    <hr>

    <!-- 지도 위치 섹션 -->
    <div id="address" class="row g-0 mb-5 mt-3 p-1">
        <div class="col-8 row g-0">
            <h3 class="fw-semibold pb-2">숙소 위치</h3>
            <img src="https://maps.googleapis.com/maps/api/staticmap?size=400x200&scale=2&zoom=14&center=37.58128019999999,128.3273444&key=AIzaSyBAoo822AgkqBDrPE5nr4w_ZRIAF1lISEQ&signature=D0IXZNk-o2YOmLcFYH1FwSRphf8%3D" class="rounded img-fluid" alt="지도">
        	<h5 class="fw-semibold py-3">${dto.addr1} / ${dto.addr2}</h5>
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
        <div class="card mb-3">
            <div class="row g-0 align-items-center">
                <div class="col-md-4">
                    <div class="ratio ratio-4x3">
                        <img src="${pageContext.request.contextPath}/uploads/room/${dto.detail_photo}" class="img-fluid rounded-start" alt="객실 이미지">
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card-body p-2">
                        <h2 class="card-title fw-semibold pb-2">${dto.name}</h2>
                        <h5 class="card-text py-1 fw-medium">🛏️ ${dto.detail_content}</h5>
                        <h5 class="card-text py-2 fw-medium">👥 ${dto.people}인실</h5>
                    </div>
                </div>
                <div class="col-md-3 text-end p-3 pe-4">
                    <h4 class="text-primary fw-semibold">${dto.price}원 / 박</h4>
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


<div class="body-main">
                <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
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
                        <div class="mb-4 p-2 row bg-light rounded">
							<div class="col p-2 text-center d-flex flex-column justify-content-center">
								<div class="fs-6 fw-semibold">상품만족도</div>
								<div class="score-star review-score-star">
									<c:forEach var="n" begin="1" end="5">
										<c:set var="score" value="${dto.score + ((dto.score%1>=0.5) ? (1-dto.score%1)%1 : -(dto.score%1))}"/>
										<span class="item fs-2 ${dto.score>=n?'on':''}"><i class="bi bi-star-fill"></i></span>
									</c:forEach>
								</div>
								<div class="fs-2">
									<label class="review-score">${dto.score} 4 / 5</label> 
								</div>
							</div>
						
						<div class="col p-3 text-center d-flex flex-column justify-content-center">
							<div class="fs-6 fw-semibold">리뷰수</div>
							<div class="fs-2"><i class="bi bi-chat-right-text"></i></div>
							<div class="fs-2 review-reviewCount">56</div>
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
                        <div class="mt-2 list-review">
                            <div class="mt-1 border-bottom">
                                <div class="row p-2">
                                <h6 class="p-2 pb-1 fw-semibold fs-4">고*이</h6>
                                    <div class="col-auto pt-0 ps-2 pe-1 score-star">
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6"><i class="bi bi-star-fill"></i></span>
                                    </div>
                                    <div class="col text-end fs-5"><span>2024-07-12</span> |<span class="deleteReview" data-num="1">삭제</span></div>    
                                </div>
                                <h5 class="p-1 fs-4">리뷰 내용입니다. 리뷰 내용입니다.</h5>
                                <div class="row gx-1 mt-2 mb-3 p-1">
                                    <div class="col-md-auto md-img">
                                        <img class="border rounded" src="https://via.placeholder.com/150">
                                    </div>
                                </div>
                            </div>
                            <div class="mt-1 border-bottom">
                                <div class="row p-2">
                                <h6 class="p-2 pb-1 fw-semibold fs-4">고*이</h6>
                                    <div class="col-auto pt-0 ps-2 pe-1 score-star">
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6"><i class="bi bi-star-fill"></i></span>
                                    </div>
                                    <div class="col text-end fs-5"><span>2024-07-12</span> |<span class="deleteReview" data-num="1">삭제</span></div>    
                                </div>
                                <h5 class="p-1 fs-4">리뷰 내용입니다. 리뷰 내용입니다.</h5>
                                <div class="row gx-1 mt-2 mb-3 p-1">
                                    <div class="col-md-auto md-img">
                                        <img class="border rounded" src="https://via.placeholder.com/150">
                                    </div>
                                </div>
                            </div>
                            <div class="page-navigation">Pagination</div>
                        </div>
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
					</div>

					
					
					<div class="mt-1 p-2 list-question"></div>
                        <div class="mt-1 p-2 list-question">
                            <div class="mt-1 border-bottom">
                                <h5 class="p-1 fw-semibold fs-4">반려동물 동반 가능한가요?</h5>
                                <h6 class="p-1 pb-1 fs-5">고*이</h6>
                                <h6 class="p-1 fs-4">문의 내용입니다. </h6>
                                <div class="row p-2 fs-5">
                                    <div class="col-auto pt-2 pe-0"><span class="text-secondary">답변대기</span></div>
                                    <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>2024-07-12</span> |<span class="deleteQuestion" data-num="1">삭제</span></div>
                                    <div class="col pt-2 text-end"><button class="btn btnAnswWerView"> <i class="bi bi-chevron-down"></i> </button></div>
                                </div>
                                <div class="p-4 pt-0 answer-content">
                                    <div class="bg-light">
                                        <div class="p-3 pb-0">
                                            <label class="bg-primary text-white px-3 fs-5"> 관리자 </label> <label class="ps-2 fs-4">2024-07-12</label>
                                        </div>
                                        <div class="p-3 pt-2 fs-4">문의사항에 대한 답변입니다.</div>
                                    </div>
                                </div>
                            </div>
                            <div class="page-navigation">Pagination</div>
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
					<input name="subject" type="text" placeholder="문의사항 제목 입력" class="form-control">
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
			<input type="hidden" name="num" value="1">
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
	
	let mode = "${mode}";
	if(mode === "qna") {
		listQuestion(1);
	} else {
		listReview(1);
	}
	
});

function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType:dataType,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login(); 
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

</script>

<script type="text/javascript">

//문의하기 -----
function listQuestion(page) {
	let num = '${dto.num}';
	let url = '${pageContext.request.contextPath}/qna/list';
	let query = 'num='+num+'&pageNo='+page;
	
	const fn = function(data) {
		printQuestion(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);
}

function printQuestion(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	$('.title-qnaCount').html('(' + dataCount + ')');
	let out = '';
	for(let item of data.list) {
		let num = item.num;
		let userName = item.userName;
		let question = item.question;
		let question_date = item.question_date;
		let answer = item.answer;
		let answer_date = item.answer_date;
		let answerState = answer_date ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>';
		let listFilename = item.listFilename;
		let secret = item.secret;

		out += '<div class="mt-1 border-bottom">';
		out += '  <div class="mt-2 p-2">' + question + '</div>';

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/qna/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		out += '  <div class="row p-2">';
		out += '     <div class="col-auto pt-2 pe-0">' + answerState + '</div>';
		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;'+userName+'</div>';
		out += '     <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>'+question_date+'</span>';
		if(secret === 0) {
			out += '       |<span class="notifyQuestion" data-num="' + num + '">신고</span>';
		}
		out += '      </div>';
		if(answer) {
			out += '  <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
		}
		out += '  </div>';
		if(answer) {
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
	
	if(dataCount > 0) {
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
	
	$("body").on("click", ".qna-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		const f = this.closest("form");
		f.selectFile.files = dt.files;
		
		$(this).remove();
	});
	
	$('.btnQuestion').click(function(){
		$("#questionDialogModal").modal("show");
	});

	$('.btnQuestionSendOk').click(function(){
		const f = document.questionForm;
		let s;
		s = f.content.value.trim();
		alert(${dto.num});
		if( ! s ) {
			alert("문의 사항을 입력하세요.")	;
			f.content.focus();
			return false;
		}
		
		f.submit();
		
		
		let url = "${pageContext.request.contextPath}/room/review";
		// FormData : form 필드와 그 값을 나타내는 일련의 key/value 쌍을 쉽게 생성하는 방법을 제공 
		// FormData는 Content-Type을 명시하지 않으면 multipart/form-data로 전송
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



</script>
