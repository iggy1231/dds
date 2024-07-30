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
</style>

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
