<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 950px;
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
		
			
			<div class="tab-content pt-4" id="myTabContent">

		        <div class="row board-list-header">
					<div class="col-auto me-auto">
		        		<c:if test="${orderStatus =='status'}">
			            	<div class="form-check form-check-inline">
			            		<input type="radio" id="order-state1" class="form-check-input" name="orderstatus" value="1" ${state==1 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state1">신규 신고</label>
			            	</div>
			            	<div class="form-check form-check-inline">
			            		<input type="radio" id="order-state2" class="form-check-input" name="orderstatus" value="2" ${state==2 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state2">전체 신고</label>
			            	</div>
		            	</c:if>
		            	<div class="form-check form-check-inline">&nbsp;</div>
					</div>
		            <div class="col-auto">
		            	${dataCount}개(${page}/${total_page} 페이지)
					</div>
		        </div>
				
				<table class="table board-list">
					<thead class="table-light">
						<tr>
							<th>신고번호</th>
							<th width="90">신고사유</th>
							<th width="100">신고당한사람</th>
							<th width="150">게시글</th>
							<th width="130">등록일</th>
							<th width="150">신고한사람</th>
							<th width="90">처리상태</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr valign="middle">
								<td>${dto.num}</td>
								<td>${dto.reason}</td>
								<td>${dto.user_num}</td>
								<td>${dto.reportPage}</td>
								<td>${dto.reg_date}</td>
								<td>${dto.reporter_num}</td>
								<td>
								  <c:choose>
								    <c:when test="${dto.state == 1}">
								      확인완료
								    </c:when>
								    <c:otherwise>
								      확인요망
								    </c:otherwise>
								  </c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="page-navigation">
					${dataCount == 0 ? "등록된 주문정보가 없습니다." : paging}
				</div>
	
				<div class="row board-list-footer">
					<div class="col">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/order/${orderStatus}';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
					</div>
					<div class="col-6 text-center">
						<form class="row" name="searchForm" action="${pageContext.request.contextPath}/admin/order/${orderStatus}" method="post">
							<div class="col-auto p-1">
								<select name="schType" class="form-select">
									<option value="orderNum" ${schType=="orderNum"?"selected":""}>주문번호</option>
									<c:if test="${orderStatus=='delivery'}">
										<option value="invoiceNumber" ${schType=="invoiceNumber"?"selected":""}>송장번호</option>
									</c:if>
									<option value="userName" ${schType=="userName"?"selected":""}>주문자</option>
									<option value="orderDate" ${schType=="orderDate"?"selected":""}>주문일자</option>
								</select>
							</div>
							<div class="col-auto p-1">
								<input type="hidden" name="state" value="${state}">
								<input type="text" name="kwd" value="${kwd}" class="form-control">
							</div>
							<div class="col-auto p-1">
								<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
							</div>
						</form>
					</div>
					<div class="col text-end">
						&nbsp;
					</div>
				</div>
			
			</div>		
			</div>
		</div>
	</div>
</div>

<!-- 주문정보-상태변경/배송변경 대화상자  -->
<div class="modal fade" id="orderDialogModal" tabindex="-1" aria-labelledby="orderDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">주문정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail"></div>
			</div>
		</div>
	</div>
</div>

<!-- 주문상세정보-상태변경/상태확인 대화상자  -->
<div class="modal fade" id="orderDetailStateDialogModal" tabindex="-1" aria-labelledby="orderDetailStateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailStateDialogModalLabel">주문상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="mt-1 p-1">
					<div class="p-1"><p class="form-control-plaintext optionDetail-value"></p></div>
					<table class="table board-list">
						<thead class="table-light">
							<tr>
								<td width="50">코드</td>
								<td width="120">구분</td>
								<td width="90">작성자</td>
								<td width="120">날짜</td>
								<td>설명</td>
							</tr>
						</thead>
						<tbody class="detailState-list"></tbody>	
					</table>
				</div>
				
				<div class="p-1 detailStateUpdate-form">
					<form name="detailStateForm" class="row justify-content-center">
						<div class="col-auto p-1">
							<select name="detailState" class="form-select"></select>
						</div>
						<div class="col-6 p-1">
							<input type="text" name="stateMemo" class="form-control" placeholder="상태 메시지 입력">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="orderNum">
							<input type="hidden" name="orderDetailNum">
							<input type="hidden" name="productNum">
							<input type="hidden" name="usedSaved">
							<input type="hidden" name="payment">
							<input type="hidden" name="userId">
							<input type="hidden" name="orderDate">
							<input type="hidden" name="optionCount">
							<input type="hidden" name="detailNum">
							<input type="hidden" name="detailNum2">
							<input type="hidden" name="qty">
							<input type="hidden" name="productMoney">
							<input type="hidden" name="savedMoney">
							<input type="hidden" name="cancelAmount">
							<button type="button" class="btn btn-light btnDetailStateUpdateOk"> 변경 </button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>

<!-- 발송처리 대화상자 -->
<div class="modal fade" id="prepareDialogModal" tabindex="-1" aria-labelledby="prepareDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prepareDialogModalLabel">발송처리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<form class="row text-center" name="invoiceNumberForm">
					<div class="col-auto p-1">
						<select name="deliveryName" class="form-select">
							<c:forEach var="vo" items="${listDeliveryCompany}">
								<option>${vo.DELIVERYNAME}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col p-1">
						<input name="invoiceNumber" type="text" class="form-control" placeholder="송장번호입력">
					</div>
					<div class="col-auto p-1">
						<input type="hidden" name="orderNum" value="">
						<input type="hidden" name="orderState" value="2">
						<button type="button" class="btn btnInvoiceNumberOk">변경완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 주문상세 대화상자  -->
<div class="modal fade" id="orderDialogModal" tabindex="-1" aria-labelledby="orderDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">주문상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail"></div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
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

// 라디오버튼(신규주문/전체주문)
$(function(){
	$("input[name=orderstatus]").click(function(){
		let state = $(this).val();
		let url = "${pageContext.request.contextPath}/admin/order/${orderStatus}?state="+state;
		location.href = url;
	});
});

// 주문정보-상태변경/배송변경 대화상자 
$(function(){
	$(".orderStatus-update").click(function(){
		let orderNum = $(this).attr("data-orderNum");
		let orderStatus = "${orderStatus}";
		let url = "${pageContext.request.contextPath}/admin/order/detail/info?orderNum="+orderNum+"&orderStatus="+orderStatus;
		
		$(".modal-order-detail").load(url);
		
		$("#orderDialogModal").modal("show");
	});
});

// 발송처리 대화상자(송장번호 입력)
$(function(){
	$("body").on("click", ".btn-prepare-order",function(){
		let orderNum = $(this).attr("data-orderNum");
		
		document.invoiceNumberForm.orderNum.value = orderNum;
		
		$("#prepareDialogModal").modal("show");
	});
});

// 송장번호 등록
$(function(){
	$(".btnInvoiceNumberOk").click(function(){
		const f = document.invoiceNumberForm;
		if(! f.invoiceNumber.value.trim()) {
			alert('송장 번호를 입력하세요');
			return false;
		}
		
		let qs = $('form[name=invoiceNumberForm]').serialize();
		let url = '${pageContext.request.contextPath}/admin/order/detail/invoiceNumber';
		
		const fn = function(data) {
			if(data.state === "true") {
				
				f.reset();
				
				$("#prepareDialogModal").modal("hide");
				$("#orderDialogModal").modal("hide");
				
				let url = "${pageContext.request.contextPath}/admin/order/${orderStatus}";
				location.href = url;
			} else {
				alert("발송처리가 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});

// 배송 변경(배송중/배송완료)
$(function(){
	$("body").on("click", ".btn-delivery-order", function(){
		const $EL = $(this);
		let orderNum = $EL.attr("data-orderNum");
		let preState = $EL.attr("data-orderState");
		
		let orderState = $EL.closest(".delivery-update-area").find("select").val();
		let orderStateInfo = $EL.closest(".delivery-update-area").find("select option:selected").text();
		
		if(preState >= orderState) {
			alert('배송 변경은 현 배송 단계보다 적거나 같을수 없습니다.');
			return false;
		}
		
		let qs = 'orderNum=' + orderNum + '&orderState=' + orderState;
		let url = '${pageContext.request.contextPath}/admin/order/detail/delivery';

		const fn = function(data) {
			if(data.state === "true") {
				
				$("#orderDialogModal").modal("hide");
				
				let url = "${pageContext.request.contextPath}/admin/order/${orderStatus}";
				location.href = url;
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});

// 판매 취소
$(function(){
	$('body').on('click', '.btn-cancel-order',function(){
		let orderNum = $(this).attr('data-orderNum');
		
		alert('모든 구매내역 판매취소...');
		
	});
});

// 주문상세 - 상태확인/변경
$(function(){
	$('body').on('click', '.orderDetailStatus-update', function(){
		const f = document.detailStateForm;
		f.reset();
		
		let orderNum = $(this).attr("data-orderNum");
		let orderState = $(this).attr("data-orderState");
		let detailState = $(this).attr("data-detailState");
		let productMoney = $(this).attr("data-productMoney");
		let cancelAmount = $(".order-cancelAmount").attr("data-cancelAmount");
		let payment = $(this).attr("data-payment");
		let usedSaved = $(this).attr("data-usedSaved");
		let userId = $(this).attr("data-userId");
		let orderDate = $(this).attr("data-orderDate");
		// 상품 상세 정보 -----
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let productNum = $(this).attr("data-productNum");
		let optionCount = $(this).attr("data-optionCount");
		let detailNum = $(this).attr("data-detailNum");
		let detailNum2 = $(this).attr("data-detailNum2");
		let savedMoney = $(this).attr("data-savedMoney");
		let qty = $(this).attr("data-qty");
		
		f.orderNum.value = orderNum;
		f.orderDetailNum.value = orderDetailNum;
		f.productNum.value = productNum;
		f.usedSaved.value = usedSaved;
		f.userId.value = userId;
		f.orderDate.value = orderDate;
		f.optionCount.value = optionCount;
		f.detailNum.value = detailNum;
		f.detailNum2.value = detailNum2;
		f.qty.value = qty;
		f.productMoney.value = productMoney;
		f.payment.value = payment;
		f.savedMoney.value = savedMoney;
		f.cancelAmount.value = cancelAmount;
		
		let opt = $(this).closest("tr").find("td").eq(4).text();

		let $SELECT = $('form[name=detailStateForm] select[name=detailState]');
		$('form[name=detailStateForm] select[name=detailState] option').remove();
		
		if(orderState==="6") {
			// 주문상태-판매취소
			$(".detailStateUpdate-form").hide();
		} else if(detailState==='1' || detailState==='2' || detailState==='3' || detailState==='5' || detailState==='12') {
			// 주문상세상태- 구매확정,자동구매확정,취소완료,반품완료,판매취소
			$SELECT.append('<option value="14">기타</option>');
		} else if(detailState==='4') { // 주문상세상태-주문취소요청
			$SELECT.append('<option value="5">주문취소완료</option>');
		} else if(detailState==='6'){ // 주문상세상태-교환요청
			$SELECT.append('<option value="7">교환접수</option>');
			$SELECT.append('<option value="8">교환발송완료</option>');
			$SELECT.append('<option value="9">교환불가</option>');
		} else if(detailState==='10'){ // 주문상세상태-반품요청
			$SELECT.append('<option value="11">반품접수</option>');
			$SELECT.append('<option value="12">반품완료</option>');
			$SELECT.append('<option value="13">반품불가</option>');
		} else {
			 // 배송완료
			if(orderState==="5") {
				$SELECT.append('<option value="2">자동구매확정</option>');
			}
			
			$SELECT.append('<option value="3">판매취소</option>');
			$SELECT.append('<option value="14">기타</option>');
		}
		
		$('.optionDetail-value').html('옵션 : ' + opt + ' ');
		$('#orderDetailStateDialogModal').modal('show');

	});
	
	function listDetailState() {
		$('.detailState-list').empty();
		
		const f = document.detailStateForm;
		let orderDetailNum = f.orderDetailNum.value;
		
		let qs = 'orderDetailNum=' + orderDetailNum;
		let url = '${pageContext.request.contextPath}/admin/order/detail/listDetailState';

		const fn = function(data) {
			let out;
			for(let item of data.list) {
				out  = '<tr>';
				out += '<td>'+item.DETAILSTATE+'</td>';
				out += '<td>'+item.DETALSTATEINFO+'</td>';
				out += '<td>'+item.USERNAME+'</td>';
				out += '<td>'+item.DETAILSTATEDATE+'</td>';
				out += '<td align="left">'+item.STATEMEMO+'</td>';
				out += '</tr>';
				
				$('.detailState-list').append(out);
			}
		};
		
		ajaxFun(url, "get", qs, "json", fn);
	}
	
	const orderDetailStateModalEl = document.getElementById('orderDetailStateDialogModal');
	orderDetailStateModalEl.addEventListener('show.bs.modal', function(){
		// 모달 대화상자가 보일때
		listDetailState();
	});
	
	orderDetailStateModalEl.addEventListener('hidden.bs.modal', function(){
		// 모달 대화상자가 안보일때
		// location.href = '${pageContext.request.contextPath}/admin/order/status?${query}&page=${page}';
	});
	
	$(".btnDetailStateUpdateOk").click(function(){
		// 주문상세 상태정보변경 등록
		const f = document.detailStateForm;
		let orderDetailNum = f.orderDetailNum.value;
		let productMoney = f.productMoney.value;
		let cancelAmount = f.cancelAmount.value;
		
		// 이전상태 : 판매취소(관리자), 주문취소완료(관리자), 반품완료(관리자)
		let preDetailState = $("#orderDetail-list" + orderDetailNum).find("td").eq(9).find("span").attr("data-detailState");
		if(preDetailState === "3" || preDetailState === "5" || preDetailState === "12") {
			alert("판매취소 또는 반품완료 상품은 변경이 불가능합니다.");
			return false;
		}

		let changeStateInfo = $("form[name=detailStateForm] select option:selected").text();
		
		if(! f.stateMemo.value.trim()) {
			alert("상태 메시지를 등록하세요");
			f.stateMemo.focus();
			return false;
		}
		
		let qs = $('form[name=detailStateForm]').serialize();
		let url = '${pageContext.request.contextPath}/admin/order/detail/updateDetailState';

		const fn = function(data) {
			if(data.state === "true") {
				listDetailState();
				
				let detailState = data.detailState;

				$("#orderDetail-list" + orderDetailNum).find("td").eq(8).html(changeStateInfo);
				$("#orderDetail-list" + orderDetailNum).find("td").eq(9).find("span").attr("data-detailState", detailState);
				
				// 주문취소완료인 경우
				if(detailState == 3 || detailState == 5 || detailState == 12) {
					cancelAmount = parseInt(cancelAmount) + parseInt(productMoney);
					$(".order-cancelAmount").attr("data-cancelAmount", cancelAmount);
					$(".order-cancelAmount").text(cancelAmount.toLocaleString());
				}
				
				alert("주문 정보가 변경되었습니다.");
				f.reset();
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
		
	});
});
</script>
