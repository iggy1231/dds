<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.btn-update:hover {
	background-color: var(--btn-primary);
}
</style>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
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
			<div class="card mt-2">
				<div class="tab-content pt-0" id="myTabContent">
					<div class="tab-pane fade show active" id="tab-pane"
						role="tabpanel" aria-labelledby="tab-1" tabindex="0">
						<div class="row mb-2">
							<div class="col">
								<div class="row text-end"></div>
							</div>
							
						</div>

						<div class="table-responsice text-nowrap">
							<table class="table">
								<thead>
									<tr class="text-center"> 
										<th>상품코드</th>
										<th>상품썸네일</th>
										<th>상품명</th>
										<th>가격</th>
										<th>진열</th>
										<th>등록일</th>
										<th>수정일</th>
										<th>수정하기</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr class="text-center">
											<td>${dto.num}</td>
											<td><img style="width: 100px; height: 70px;" class="justify-content-center"
												src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}">
												<a href="#"></a></td>
											<td>${dto.subject}</td>
											<td>${dto.price}</td>
											<td>${dto.active==1?"표시":"숨김"}</td>
											<td>${dto.reg_date}</td>
											<td>yyyy-mm-dd</td>
											<td>
											    <c:url var="updateUrl" value="/admin/product/update">
											        <c:param name="num" value="${dto.num}" />
											        <c:param name="page" value="${page}" />
											    </c:url>
											    <button type="button" class="btn border btn-update" onclick="updateRoomProduct(${dto.num});">수정</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

							<div class="col-auto pt-4 ps-4 text-start">${dataCount}개(${page}/${total_page} 페이지)</div>
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


function updateRoomProduct(num) {
    var form = document.createElement('form');
    form.method = 'GET';
    form.action = '${pageContext.request.contextPath}/admin/product/update';

    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'num';
    input.value = num;

    var pageInput = document.createElement('input');
    pageInput.type = 'hidden';
    pageInput.name = 'page';
    pageInput.value = '${page}';

    form.appendChild(input);
    form.appendChild(pageInput);
    document.body.appendChild(form);
    form.submit();
}

</script>
