<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .text-travel {
        color: #18A8F1;
    }
    .text-info {
        color: #00B98E; 
    }
    .text-companion {
        color: #FE77AC; 
    }
    .text-default {
        color: #A4A6AA; 
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

<div class="row justify-content-between">
	<h5 class="col">전체 <span class="color-text">${dataCount}</span>건</h5>
		<div class="col text-end" style="margin-bottom: .5rem;">
				<button id="listReplyRecent" type="button" class="btn btn btn-custom ${mode=='replyNewest'?'active':''}" data-bs-toggle="button">최신순</button>
				<button id="listReplyPast" type="button" class="btn btn btn-custom ${mode=='replyOldest'?'active':''}" data-bs-toggle="button">과거순</button>
		</div>
</div>
<div class="mt-1 p-2 list-question">
	<c:forEach var="list2" items="${list}">
		<div class="mt-1 border-bottom">
			<a class="p-1 fw-semibold fs-4" href="">${list2.content}</a>
			<h6 class="p-1 fs-5">
				<c:choose>
			        <c:when test="${list2.boardName == 'travelreview'}">
			            ✈️&nbsp;
			            <span class="text-travel">여행후기</span>
			        </c:when>
			        <c:when test="${list2.boardName == 'info'}">
			            📚&nbsp;
			            <span class="text-info">여행정보</span>
			        </c:when>
			        <c:when test="${list2.boardName == 'companion'}">
			            👥&nbsp;
			            <span class="text-companion">동행구인</span>
			        </c:when>
			        <c:otherwise>
			            ❓&nbsp;
			            <span class="text-default">기타</span>
			        </c:otherwise>
			    </c:choose>
			</h6>
			<div class="row p-2 fs-5">
				<div class="col text-end pt-2 px-0">
					<span class="text-secondary">${list2.reg_date}</span>&nbsp;|&nbsp;<span
						class="deleteQuestion" data-boardname="${list2.boardName}"
						data-num="${list2.reply_num}">삭제</span>
				</div>
			</div>
		</div>

	</c:forEach>

</div>
<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>
