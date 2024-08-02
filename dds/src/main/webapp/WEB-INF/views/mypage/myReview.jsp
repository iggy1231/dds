<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.delete-button {
    border-radius: 20px;
    width: 50px; 
    font-size: 16px;
    background: #EAEAEA;
    border: 1px solid #EAEAEA;
}

.delete-button:hover {
    background: gray;
    border: 1px solid gray;
    color: white;
    transform: translateY(2px);
    transition: 0.3s;   
}

.graph {
    font-size: 0; 
    letter-spacing: 0; 
    word-spacing: 0;
}

.graph-title { 
    padding-right: 3px; 
}

.graph .one-space { 
    font-size: 13px; 
    background: #eee;
}

.graph .one-space:after { 
    content: ''; 
    display: inline-block; 
    width: 17px; 
}

.graph .one-space.on { 
    background: #FFE400; 
}

.graph .one-space:first-child { 
    border-top-left-radius: 5px;  
    border-bottom-left-radius: 5px; 
}

.graph .one-space:last-child { 
    border-top-right-radius: 5px; 
    border-bottom-right-radius: 5px; 
}

.graph-rate { 
    padding-left: 5px; 
    display: inline-block; 
    width: 50px; 
    text-align: left; 
}

.color-text {
    color: #18A8F1;
}

.btn-custom {
    background-color: #f8f9fa; /* 기본 배경색 */
    color: #000; /* 기본 텍스트 색상 */
}

.btn-custom.active {
    background-color: #18A8F1; /* 활성화 배경색 */
    color: #fff; /* 활성화 텍스트 색상 */
}
</style>

<div class="mt-3 pt-3">
    <div class="mt-2 pt-1 pb-2">
        <p class="fs-4 fw-semibold">📝 나의 리뷰</p>
    </div>
    <div class="mb-4 p-2 row bg-light rounded">
        <div class="col p-2 text-center d-flex flex-column justify-content-center">
            <div class="fs-6 fw-semibold">상품만족도</div>
            <div class="score-star review-score-star">
                <c:forEach var="n" begin="1" end="5">
                    <span class="item fs-2 ${averageScore >= n ? 'on' : ''}"><i class="bi bi-star-fill"></i></span>
                </c:forEach>
            </div>
            <div class="fs-2">
                <label class="review-score">
                    <fmt:formatNumber value="${averageScore}" type="number" maxFractionDigits="1"/> / 5
                </label>
            </div>
        </div>

        <div class="col p-3 text-center d-flex flex-column justify-content-center">
            <div class="fs-6 fw-semibold">리뷰수</div>
            <div class="fs-2">
                <i class="bi bi-chat-right-text"></i>
            </div>
            <div class="fs-2 review-reviewCount">${reviewCount}</div>
        </div>

        <div class="col p-3 text-center d-flex flex-column justify-content-center review-rate">
            <div class="fs-6 fw-semibold">평점비율</div>
            <c:forEach var="i" begin="1" end="5">
                <div class="p-1 score-${i}">
                    <span class="graph-title">${i}점</span> 
                    <span class="graph">
                        <c:set var="percentage" value="${reviewCount > 0 ? (ratingCount[i - 1] * 100) / reviewCount : 0}" />
                        <c:forEach var="n" begin="1" end="10">
                            <label class="one-space ${n <= percentage / 10 ? 'on' : ''}"></label>
                        </c:forEach>
                    </span> 
                    <span class="graph-rate">
                        <fmt:formatNumber value="${percentage}" type="number" maxFractionDigits="1"/>%
                    </span>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="row justify-content-between">
        <h5 class="col">전체 <span class="color-text">${dataCount}</span>건</h5>
        <div class="col text-end" style="margin-bottom: .5rem;">
            <button id="listMyReviewRecent" type="button" class="btn btn btn-custom ${mode=='newest'?'active':''}" data-bs-toggle="button">최신순</button>
            <button id="listMyReviewPast" type="button" class="btn btn btn-custom ${mode=='oldest'?'active':''}" data-bs-toggle="button">과거순</button>
        </div>
    </div>
</div>

<c:forEach var="list2" items="${list}">
    <div class="mt-3 border-bottom">
        <div class="row p-2">
            <form action="${pageContext.request.contextPath}/mypage/deleteReview" method="get" class="d-flex align-items-start w-100">
                <div class="col-md-8">
                    <div class="row review-item">
                        <div class="col-auto pt-0 ps-2 pe-1 score-star">
                            <c:forEach var="i" begin="1" end="5">
                                <span class="item fs-5 ${list2.rating >= i ? 'on' : ''}">
                                    <i class="bi bi-star-fill"></i>
                                </span>
                            </c:forEach>
                        </div>
                        <div class="col-auto ps-0 fs-5 ps-2">
                            <c:choose>
                                <c:when test="${list2.boardName == 'room'}">
                                    🏠 숙소
                                </c:when>
                                <c:when test="${list2.boardName == 'tour'}">
                                    🌴 투어
                                </c:when>
                                <c:otherwise>
                                    ${list2.boardName}
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="review-content col mt-2 p-2 fs-3 ps-3">${list2.content}</div>
                        <div class="col-auto pt-3 text-start fs-4">
                            <span class="fs-6">${list2.reg_date}</span>
                            <input type="hidden" name="review_num" value="${list2.review_num}">
                            <button id="deleteReview" class="deleteReview delete-button" type="submit" style="margin-left: 10px;">삭제</button>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty list2.photo}">
                    <div class="col-md-4 text-end">
                        <div class="ratio ratio-4x3 mt-2 mb-2" style="height: 170px;">
                            <c:forEach var="photo" items="${list2.photo}">
                                <img class="border rounded img-fluid" src="${pageContext.request.contextPath}/uploads/roomReview/${photo}" style="object-fit: cover; height: 100%;">
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </form>
        </div>
    </div> 
</c:forEach>

<div class="page-navigation">${dataCount == 0 ? '작성한 리뷰가 없습니다.' : paging}</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function() {
        $(document).on('click', '#deleteReview', function(event) {
            event.preventDefault(); // 폼의 기본 동작 방지
            if (confirm("삭제하시면 다시 리뷰를 작성하실 수 없습니다")) {
                // "예"를 누르면 폼 제출
                $(this).closest('form').submit();
            }
            // "아니오"를 누르면 아무 작업도 하지 않음
        });
    });
</script>
