<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .body-container {
            max-width: 1000px;
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
            background: #3d3d4f;
            color: #fff;
        }
        .tab-pane { min-height: 300px; }

        .score-star { font-size: 0; letter-spacing: -4px; }
        .score-star .item {
            font-size: 22px; letter-spacing: 1px; display: inline-block;
            color: #ccc; text-decoration: none; vertical-align: middle;
        }
        .score-star .item:first-child{ margin-left: 0; }
        .score-star .on { color: #18A8F1; }

        .md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }
        .deleteReview, .deleteQuestion { cursor: pointer; padding-left: 5px; }
        .deleteReview:hover, .deleteQuestion:hover { font-weight: 500; color: #2478FF; }
    </style>
</head>
<body>
    <div class="container">
        <div class="body-container">    
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
                        
                        <div class="mb-4 p-2 row bg-light rounded">
						<div class="col p-3 text-center d-flex flex-column justify-content-center">
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
					
                            <p class="fs-4 fw-semibold">상품 리뷰</p> 
                        </div>
                        <div class="mt-2 list-review">
                            <div class="mt-1 border-bottom">
                                <div class="row p-2">
                                <h6 class="p-2 pb-1 fw-semibold">고*이</h6>
                                    <div class="col-auto pt-0 ps-2 pe-1 score-star">
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
                                        <span class="item fs-6"><i class="bi bi-star-fill"></i></span>
                                    </div>
                                    <div class="col text-end"><span>2024-07-12</span> |<span class="deleteReview" data-num="1">삭제</span></div>    
                                </div>
                                <h5 class="p-1">리뷰 내용입니다. 리뷰 내용입니다.</h5>
                                <div class="row gx-1 mt-2 mb-3 p-1">
                                    <div class="col-md-auto md-img">
                                        <img class="border rounded" src="https://via.placeholder.com/150">
                                    </div>
                                </div>
                            </div>
                            <div class="page-navigation">Pagination</div>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
                        <div class="mt-3 pt-3 border-bottom">
                            <p class="fs-4 fw-semibold">상품 문의 사항</p> 
                        </div>
                        <div class="mt-1 p-2 list-question">
                            <div class="mt-1 border-bottom">
                                <div class="mt-2 p-2 fw-semibold">Product Name</div>
                                <div class="p-2">This is a question content.</div>
                                <div class="row gx-1 mt-2 mb-1 p-1">
                                    <div class="col-md-auto md-img">
                                        <img class="border rounded" src="https://via.placeholder.com/150">
                                    </div>
                                </div>
                                <div class="row p-2">
                                    <div class="col-auto pt-2 pe-0"><span class="text-secondary">답변대기</span></div>
                                    <div class="col-auto pt-2 px-0">&nbsp;|&nbsp;<span>2024-07-12</span> |<span class="deleteQuestion" data-num="1">삭제</span></div>
                                    <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>
                                </div>
                                <div class="p-3 pt-0 answer-content" style="display: none;">
                                    <div class="bg-light">
                                        <div class="p-3 pb-0">
                                            <label class="text-bg-primary px-2"> 관리자 </label> <label>2024-07-12</label>
                                        </div>
                                        <div class="p-3 pt-1">This is an answer from the admin.</div>
                                    </div>
                                </div>
                            </div>
                            <div class="page-navigation">Pagination</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

