<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 950px;
}

.text-primary {
	color: #696cff !important;
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

.orderStatus-update, .orderDetailStatus-update { cursor: pointer;  }
.orderStatus-update:hover, .orderDetailStatus-update:hover { color: #0d6efd; }

/* 반응형 카드 스타일 */
.card { /* 수정된 부분 */
    overflow: hidden;
    display: flex;
    flex-direction: column;
    width: 100%;
    box-sizing: border-box;
}

/* 반응형 카드 헤더 스타일 */
.card-header { /* 수정된 부분 */
    overflow: hidden;
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
}

/* 반응형 테이블 스타일 */
.table-responsive { /* 수정된 부분 */
    width: 100%;
    overflow-x: auto;
}

.table-responsive table { /* 수정된 부분 */
    width: 100%;
    max-width: 100%;
    margin-bottom: 1rem;
    background-color: transparent;
}

/* 테이블 헤더 스타일 */
th { /* 추가된 부분 */
    font-size: 1em !important; /* 글씨 크기 */
    font-weight: bold !important; /* 글씨 굵게 */
} 
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
// 검색
function searchList() {
	const f = document.searchForm;
	f.submit();
}

// 탭
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") { // 주문관리
			location.href = "${pageContext.request.contextPath}/admin/memberManage/report";
		} else if( tab === "2") { // 배송관리
			location.href = "${pageContext.request.contextPath}/admin/memberManage/ban";
		}
	});
});
</script>

<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card">
			<div class="card-header">
				<div class="ps-3 fw-semibold fs-3 text-center mb-3 text-primary">신고 리스트</div>
					

		       	<div class="row board-list-header">
		            <div class="text-end">
		            	${dataCount}개(${page}/${total_page} 페이지)
					</div>
		        </div>
				<div class="table-responsice text-nowrap">
				<table class="table">
					<thead>
						<tr class="text-center table-primary">
							<th>신고번호</th>
							<th>신고사유</th>
							<th>신고당한사람</th>
							<th>게시글</th>
							<th>등록일</th>
							<th>신고한사람</th>
							<th>처리상태</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr class="text-center">
								<td>${dto.num}</td>
								<td style="font-weight: bold;"> <a href="${pageContext.request.contextPath}/${dto.reportPage}/article?num=${dto.article_num}&page=1"> ${dto.reason} </a> </td>
								<td>${dto.user_nick}</td>
								<td>${dto.reportPage}</td>
								<td>${dto.reg_date}</td>
								<td>${dto.reporter_nick}</td>
								<td>
								  <c:choose>
								    <c:when test="${dto.state == 1}">
								      확인완료
								    </c:when>
								    <c:otherwise>
								      <span style="color: #696cff;">확인요망</span>
								    </c:otherwise>
								  </c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
				<div class="page-navigation mt-3">
					${dataCount == 0 ? "신고 목록이 없습니다." : paging}
				</div>	
			</div>		
			</div>
		</div>
	
</div>
