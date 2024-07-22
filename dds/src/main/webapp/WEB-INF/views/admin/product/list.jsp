<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">상품관리 /</span> 상품 리스트
		</h4>
		<div class="card mb-4">
			<div class="card-widget-separator-wrapper">
				<div class="card-body card-widget-separator">
					<div class="row gy-4 gy-sm-1">
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
								<div>
									<p class="mb-1">In-store Sales</p>
									<h4 class="mb-1">$5,132.34</h4>
									<p class="mb-0">
										<span class="me-2">5k orders</span> <span
											class="badge bg-label-success">+5.7%</span>
									</p>
								</div>
								<span class="avatar me-sm-6"> <span
									class="avatar-initial rounded w-px-44 h-px-44"> <i
										class="bi bi-shop"></i>
								</span>
								</span>
							</div>
							<hr class="d-none d-sm-block d-lg-none me-6">
						</div>
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-4 pb-sm-0">
								<div>
									<p class="mb-1">Website Sales</p>
									<h4 class="mb-1">$674,347.12</h4>
									<p class="mb-0">
										<span class="me-2">21k orders</span> <span
											class="badge bg-label-success">+12.4%</span>
									</p>
								</div>
								<span class="avatar p-2 me-lg-6"> <span
									class="avatar-initial rounded w-px-44 h-px-44"> <i
										class="bi bi-shop"></i>
								</span>
								</span>
							</div>
							<hr class="d-none d-sm-block d-lg-none">
						</div>
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start border-end pb-4 pb-sm-0 card-widget-3">
								<div>
									<p class="mb-1">Discount</p>
									<h4 class="mb-1">$14,132.34</h4>
									<p class="mb-0">
										<span class="me-2">6k orders</span> <span
											class="badge bg-label-success">+5.7%</span>
									</p>
								</div>
								<span class="avatar p-2 me-sm-6"> <span
									class="avatar-initial rounded w-px-44 h-px-44"> <i
										class="bi bi-shop"></i>
								</span>
								</span>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3">
							<div class="d-flex justify-content-between align-items-start">
								<div>
									<p class="mb-1">Affiliate</p>
									<h4 class="mb-1">$8,132.34</h4>
									<p class="mb-0">
										<span class="me-2">150 orders</span> <span
											class="badge bg-label-danger">-3.5%</span>
									</p>
								</div>
								<span class="avatar p-2"> <span
									class="avatar-initial rounded w-px-44 h-px-44"> <i
										class="bi bi-shop"></i>
								</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-header pb-1">
				<h5 class="card-title">Filter</h5>
			</div>

			<div class="card">
				<ul class="nav nav-pills ms-2" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link ${classify==100?'active':''}" id="tab-1"
							data-bs-toggle="tab" data-bs-target="#tab-pane" type="button"
							role="tab" aria-controls="1"
							aria-selected="${classify==0?'true':'false'}">숙소</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link ${classify==200?'active':''}" id="tab-2"
							data-bs-toggle="tab" data-bs-target="#tab-pane" type="button"
							role="tab" aria-controls="2"
							aria-selected="${classify==1?'true':'false'}">투어</button>
					</li>
				</ul>

				<div class="tab-content pt-0" id="myTabContent">
					<div class="tab-pane fade show active" id="tab-pane"
						role="tabpanel" aria-labelledby="tab-1" tabindex="0">
						<div class="row mb-2">
							<div class="col">
								<div class="row text-end"></div>
							</div>
							<div class="col-auto pt-2 text-end">
								${dataCount}개(${page}/${total_page} 페이지)</div>
						</div>

						<div class="table-responsice text-nowrap">
							<table class="table">
								<thead>
									<tr>
										<th>상품코드</th>
										<th>상품명</th>
										<th>가격</th>
										<th>할인율</th>
										<th>재고</th>
										<th>진열</th>
										<th>수정일</th>
										<th>변경</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr valign="middle">
											<td>${dto.productNum}</td>
											<td class="product-subject left"><img
												src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
												<a href="#"><label>${dto.productName}</label></a></td>
											<td>${dto.price}</td>
											<td>${dto.discountRate}%</td>
											<td>${dto.totalStock}</td>
											<td>${dto.productShow==1?"표시":"숨김"}</td>
											<td>${dto.update_date}</td>
											<td><c:url var="updateUrl"
													value="/admin/product/${classify}/update">
													<c:param name="productNum" value="${dto.productNum}" />
													<c:param name="parentNum" value="${parentNum}" />
													<c:param name="categoryNum" value="${categoryNum}" />
													<c:param name="page" value="${page}" />
												</c:url>
												<button type="button" class="btn border btn-productStock"
													data-productNum="${dto.productNum}"
													data-optionCount="${dto.optionCount}">재고</button>
												<button type="button" class="btn border"
													onclick="location.href='${updateUrl}';">수정</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="page-navigation">${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
						</div>

						<table class="table table-borderless">
							<tr>
								<td width="150">
									<button type="button" class="btn btn-light"
										onclick="location.href='${pageContext.request.contextPath}/admin/product/${classify}/main';">
										<i class="bi bi-arrow-clockwise"></i>
									</button>
								</td>
								<td align="center">
									<form class="row justify-content-center" name="searchForm"
										action="${pageContext.request.contextPath}/admin/product/${classify}/main"
										method="post">
										<div class="col-auto p-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>상품명+설명</option>
												<option value="productNum"
													${schType=="productNum"?"selected":""}>상품코드</option>
												<option value="productName"
													${schType=="productName"?"selected":""}>상품명</option>
												<option value="content" ${schType=="content"?"selected":""}>설명</option>
											</select>
										</div>
										<div class="col-auto p-1">
											<input type="text" name="kwd" value="${kwd}"
												class="form-control"> <input type="hidden"
												name="size" value="${size}"> <input type="hidden"
												name="parentNum" value="${parentNum}"> <input
												type="hidden" name="categoryNum" value="${categoryNum}">
											<input type="hidden" name="productShow"
												value="${productShow}">
										</div>
										<div class="col-auto p-1">
											<button type="button" class="btn btn-light"
												onclick="searchList()">
												<i class="bi bi-search"></i>
											</button>
										</div>
									</form>

								</td>
								<td width="150" align="right"><c:url var="url"
										value="/admin/product/${classify}/write" />
									<button type="button" class="btn btn-light"
										onclick="location.href='${url}';">상품등록</button></td>
							</tr>
							</tbody>
						</table>

					</div>
				</div>
				<!-- tab-content _ end -->

			</div>
			<!-- body-main -->
		</div>
	</div>

	<!-- 재고 관리 대화상자  -->
	<div class="modal fade" id="productStockDialogModal" tabindex="-1"
		aria-labelledby="productStockDialogModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="productStockDialogModalLabel">재고관리</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body pt-1">
					<div class="modal-productStock"></div>
				</div>
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

$(function(){
	$('.btn-productStock').click(function(){
		// 재고 관리 대화상자
		let productNum = $(this).attr('data-productNum');
		let optionCount = $(this).attr('data-optionCount');
		let url = '${pageContext.request.contextPath}/admin/product/listProductStock?productNum='+productNum+'&optionCount='+optionCount;
		
		$('.modal-productStock').load(url);
		
		$('#productStockDialogModal').modal('show');
	});
	
	$('.modal-productStock').on('click', '.btn-allStockUpdate', function(){
		// 재고 일괄 변경
		if(! confirm('재고를 일괄 변경 하시겠습니까 ? ')) {
			return false;
		}
		
		let productNum = $(this).attr('data-productNum');
		let url = '${pageContext.request.contextPath}/admin/product/updateProductStock';
		let query = 'productNum='+productNum;
		
		let isValid = true;
		$('.productStcok-list tr').each(function(){
			let $input = $(this).find('input[name=totalStock]');
			let $btn = $(this).find('.btn-stockUpdate');
			
			if(!/^\d+$/.test($input.val().trim())) {
				alert('재고량은 숫자만 가능합니다.');
				$input.focus();
				isValid = false;
				return false;
			}
			
			let stockNum = $btn.attr('data-stockNum');
			let detailNum = $btn.attr('data-detailNum');
			detailNum = detailNum ? detailNum : 0;
			let detailNum2 = $btn.attr('data-detailNum2');
			detailNum2 = detailNum2 ? detailNum2 : 0;
			let totalStock = $input.val().trim();
			
			query += '&stockNums=' + stockNum;
			query += '&detailNums=' + detailNum;
			query += '&detailNums2=' + detailNum2;
			query += '&totalStocks=' + totalStock;
		});
		
		if( ! isValid ) {
			return false;
		}
		
		const fn = function(data) {
			if(data.state === "true") {
				alert("재고가 일괄 변경 되었습니다.");
			} else {
				alert("재고 일괄 변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);		
	});
	
	$('.modal-productStock').on('click', '.btn-stockUpdate', function(){
		// 재고 변경	
		let productNum = $(this).attr('data-productNum');
		let stockNum = $(this).attr('data-stockNum');
		let detailNum = $(this).attr('data-detailNum');
		detailNum = detailNum ? detailNum : 0;
		let detailNum2 = $(this).attr('data-detailNum2');
		detailNum2 = detailNum2 ? detailNum2 : 0;
		let totalStock = $(this).closest('tr').find('input[name=totalStock]').val().trim();
		
		if(!/^\d+$/.test(totalStock)) {
			alert('재고량은 숫자만 가능합니다.');
			$(this).closest('tr').find('input[name=totalStock]').focus();
			return false;
		}
	
		let url = '${pageContext.request.contextPath}/admin/product/updateProductStock';
		let query = {productNum:productNum, stockNums:stockNum, detailNums:detailNum, detailNums2:detailNum2, totalStocks:totalStock};
		
		const fn = function(data) {
			if(data.state === "true") {
				alert("재고가 변경 되었습니다.");
			} else {
				alert("재고 변경이 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);		
		
	});
});

const productStockModalEl = document.getElementById('productStockDialogModal');
productStockModalEl.addEventListener('show.bs.modal', function(){
	// 모달 대화상자가 보일때
});

productStockModalEl.addEventListener('hidden.bs.modal', function(){
	// 모달 대화상자가 안보일때
	searchList();
});

</script>
