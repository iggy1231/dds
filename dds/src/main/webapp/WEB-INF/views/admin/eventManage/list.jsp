<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<style type="text/css">
.body-main {
	max-width: 900px;
	margin: 0 auto;
	padding: 15px;
}

.table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

.table, .table th, .table td {
	border: 1px solid #ddd;
}

.table th, .table td {
	padding: 10px;
	text-align: left;
}

.table th {
	background-color: #f2f2f2;
}

.table-list th, .table-list td {
	text-align: center;
}

.table-list .left {
	text-align: left;
}

.table-form {
	border: none;
	margin: 0 auto;
}

.table-form td {
	padding: 5px;
}

.tabs {
	list-style-type: none;
	padding: 0;
	display: flex;
	margin-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.tabs li {
	padding: 10px 20px;
	cursor: pointer;
	border: 1px solid #ddd;
	border-bottom: none;
	background: #f9f9f9;
}

.tabs li.active {
	background: #fff;
	font-weight: bold;
}

.page-navigation {
	text-align: center;
	margin: 20px 0;
}

.btn {
	cursor: pointer;
	padding: 7px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
	font-size: 14px;
	line-height: 1.5;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
}

.btn:hover {
	background-color: #e0e0e0;
}

.button-container {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.form-select, .form-control {
	padding: 5px;
	margin-right: 5px;
	border-radius: 3px;
	border: 1px solid #ddd;
}

.form-control {
	width: 200px;
}

.search-form {
	display: flex;
	justify-content: center;
	align-items: center;
}

.search-form select, .search-form input {
	margin-right: 5px;
}

</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/eventManage/'+category+'/list';
	});
});
</script>

<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
 
    
    <div class="card">
    	<div class="card-header">
		<ul class="tabs">
			<li id="tab-all" data-category="all">전체 이벤트</li>
			<li id="tab-progress" data-category="progress">진행중인 이벤트</li>
			<li id="tab-winner" data-category="winner">당첨자 발표</li>
			<li id="tab-ended" data-category="ended">종료된 이벤트</li>
			<li id="tab-upcoming" data-category="upcoming">진행 예정인 이벤트</li>
		</ul>
		<div id="tab-content">
			<table class="table">
				<tr>
					<td align="left" width="50%">
						${dataCount}개 (${page}/${total_page} 페이지)
					</td>
					<td align="right">
						&nbsp;
					</td>
				</tr>
			</table>
			
			<table class="table table-border table-list">
				<thead>
					<tr>
						<th width="60">번호</th>
						<th>제목</th>
						<th width="150">이벤트 시작일</th>
						<th width="150">이벤트 종료일</th>
						<th width="100">${category == "winner" ? "발표" : "응모자수"}</th>
					</tr>
				</thead>
			 
			 	<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr> 
							<td>${dataCount - (page - 1) * size - status.index}</td>
							<td class="left">
								<a href="${articleUrl}&num=${dto.num}">${dto.title}</a>
							</td>
							<td>${dto.startDate}</td>
							<td>${dto.endDate}</td>
							<td>${category == "winner" ? (dto.winnerCount == 0 ? "예정" : "완료") : (dto.winnerNumber == 0 ? "-" : dto.applyCount)}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			 
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
			</div>
			
			<table class="">
				<tr>
					<td align="left" width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/list';" title="새로고침"><i class="fa-solid fa-arrow-rotate-left"></i></button>
					</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/admin/eventManage/${category}/list" method="post" class="search-form">
							<select name="schType" class="form-select" style="width: 100px;">
								<option value="all" ${schType == "all" ? "selected" : ""}>모두</option>
								<option value="startDate" ${schType == "startDate" ? "selected" : ""}>시작일</option>
								<option value="endDate" ${schType == "endDate" ? "selected" : ""}>종료일</option>
								<option value="winningDate" ${schType == "winningDate" ? "selected" : ""}>발표일</option>
							</select>
							<input type="text" name="kwd" value="${kwd}" class="form-control" style="width: 400px;">
							<button type="button" class="btn" onclick="searchList()">검색</button>
						</form>
					</td>
					<td align="right" width="100">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/eventManage/${category}/write';">이벤트등록</button>
					</td>
				</tr>
			</table>
		</div>    
    	</div>
	</div>
	</div>
</div>