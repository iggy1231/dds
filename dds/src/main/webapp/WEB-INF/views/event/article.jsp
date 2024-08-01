<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1000px;
	margin: 0 auto;
	padding: 15px;
}

.body-title {
	text-align: center;
	margin-bottom: 20px;
}

.nav-tabs {
	padding-bottom: 15px;
	border-bottom: 1px solid #ddd;
}

.nav-tabs .nav-link {
	min-width: 170px;
    background: #f3f5f7;
    border-radius: 20px;
    color: #333;
    font-weight: 600;
    text-align: center;
}

.nav-tabs .nav-link.active {
	background: #18A8F1;
	color: #fff;
}

.table img {
	max-width: 100%;
	height: auto;
}

.table-borderless td, .table-borderless th {
	border: 0;
}

.btn {
	margin: 5px 0;
}

.text-reset {
	color: inherit;
	text-decoration: none;
}

.text-reset:hover {
	text-decoration: underline;
}
.body-title h3 {
    display: block;
    border-bottom: 3px solid #18A8F1;
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$(function(){
	let menu = "${category}";
	$("#tab-"+menu).addClass("active");

	$("button[role='tab']").on("click", function(e){
		const tab = $(this).attr("data-tab");
		let url = "${pageContext.request.contextPath}/event/"+tab+"/list";
		location.href = url;
	});
	
	$(".btnApplyEvent").click(function(){
		if(! confirm("이벤트에 응모하시겠습니까 ? ")) {
			return false;
		}

		const $btn = $(this); 
		let num= "${dto.num}";
		let url = "${pageContext.request.contextPath}/event/progress/apply";

		$.post(url, {num:num}, function(data){
			let state = data.state;

			if(state === "true") {
				$btn.prop("disabled", true);
				$btn.text("이벤트 응모 완료");
			} else if(state === "timeout"){
				alert("이벤트 응모기간이 지났습니다.");
			} else {
				alert("이벤트 응모는 한번만 가능합니다.");
			}
		}, "json");
	});

	$(".btnEventWinnerList").click(function(){
		$("#eventWinnerModal").modal("show");	
	});
});
</script>

<div class="container">
	<div class="body-container">
		<div class="body-title">
			<h3 style="color: #18A8F1; font-size: 30px; text-align: left;"> EVENT </h3>
		</div>

		<div class="body-main">
			<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-progress" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="progress" aria-selected="true" data-tab="progress">진행중인 이벤트</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-winner" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="winner" aria-selected="false" data-tab="winner">당첨자 발표</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-ended" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="ended" aria-selected="false" data-tab="ended">종료된 이벤트</button>
				</li>
			</ul>

			<div class="tab-content pt-2" id="nav-tabContent">
				<table class="table mb-0">
					<thead>
						<tr>
							<td colspan="2" align="center" class="fw-semibold fs-5 pb-3">${dto.title}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="50%">이벤트 기간 : ${dto.startDate} ~ ${dto.endDate}</td>
							<td align="right">조회 : ${dto.hitCount}</td>
						</tr>

						<c:if test="${dto.winnerNumber != 0}">
							<tr>
								<td width="50%">당첨일자 :
									<c:choose>
										<c:when test="${listEventWinner.size() == 0 && (category == 'winner' || category == 'ended')}">
											당첨이 곧 진행 예정입니다.
										</c:when>
										<c:otherwise>
											${dto.winningDate}
										</c:otherwise>
									</c:choose>
								</td>
								<td align="right">
									<c:choose>
										<c:when test="${listEventWinner.size() != 0 && (category == 'winner' || category == 'ended')}">
											당첨 인원 : ${listEventWinner.size()}명
										</c:when>
										<c:when test="${category == 'progress'}">
											당첨 인원 : ${dto.winnerNumber}
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:if>

						<c:if test="${listEventWinner.size() != 0 && category == 'winner' && not empty userWinner}">
							<tr>
								<td colspan="2" class="py-3" align="center">
									<p class="form-control-plaintext">
										<span>축하합니다.</span>
										<span style="color: blue; font-weight: 600;">${sessionScope.member.userName}</span>님은
										<c:if test="${userWinner.rank != 0}">
											<span>이벤트에 <label style="color: tomato; font-weight: 500;">${userWinner.rank}</label>등으로 당첨되었습니다 </span>
										</c:if>
										<c:if test="${userWinner.rank == 0}">
											<span>이벤트에 당첨되었습니다.</span>
										</c:if>
									</p>
								</td>
							</tr>
						</c:if>

						<tr>
							<td colspan="2" valign="top" style="${dto.winnerNumber != 0 ? 'border-bottom: none;' : ''}">
								${dto.content}
							</td>
						</tr>

						<c:if test="${dto.winnerNumber != 0 && category == 'progress'}">
							<tr>
								<td colspan="2" class="text-center p-3">
									<button type="button" class="btn btn-outline-secondary btnApplyEvent" ${userEventTakers ? "disabled='disabled'" : ""}>
										${userEventTakers ? "이벤트 응모 완료" : "이벤트 응모"}
									</button>
								</td>
							</tr>
						</c:if>

						<c:if test="${dto.winnerNumber != 0 && (category == 'winner' || category == 'ended')}">
							<tr>
								<td colspan="2" class="text-center p-3">
									<button type="button" class="btn btn-outline-secondary btnEventWinnerList">이벤트 당첨자 확인</button>
								</td>
							</tr>
						</c:if>

						<tr>
							<td colspan="2">이전글 :
								<c:if test="${not empty prevDto}">
									<a href="${pageContext.request.contextPath}/event/${category}/article?${query}&num=${prevDto.num}">${prevDto.title}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">다음글 :
								<c:if test="${not empty nextDto}">
									<a href="${pageContext.request.contextPath}/event/${category}/article?${query}&num=${nextDto.num}">${nextDto.title}</a>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>

				<table class="table table-borderless">
					<tr>
						<td width="50%">&nbsp;</td>
						<td class="text-end">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list?${query}';">리스트</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<c:if test="${listEventWinner.size() != 0}">
	<div class="modal fade" id="eventWinnerModal" tabindex="-1" aria-labelledby="eventWinnerModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="eventWinnerModalLabel">이벤트 당첨자 리스트</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body pt-1 text-center">
					<div class="row row-cols-4 g-1">
						<c:forEach var="vo" items="${listEventWinner}" varStatus="status">
							<div class="col">
								<div class="border p-2">
									<c:if test="${vo.rank != 0}">
										<span>${vo.rank}등 :</span>
									</c:if>
									<span style="font-weight: 500;">${vo.userName}(${vo.user_num})</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
