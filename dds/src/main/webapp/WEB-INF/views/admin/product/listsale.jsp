<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1">
		<div class="">
			<div class="mt-2">
				<div class=" pt-0" id="myTabContent">
					<div class="ps-3 fw-semibold fs-3 text-center mb-3 text-primary">숙소 상품 리스트</div>
						<div class="table-responsice text-nowrap">
							<table class="table">
								<thead>
									<tr class="text-center"> 
										<th>주문번호</th>
										<th>예약일자</th>
										<th>체크인</th>
										<th>체크아웃</th>
										<th>가격</th>
										<th>쿠폰차감</th>
										<th>포인트차감</th>
										<th>할인</th>
										<th>결제금액</th>
										<th>상품이름</th>
										<th>방이름</th>
										<th>방(고유번호)</th>
										<th>유저번호</th>
										<th>유저닉네임</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="list" items="${list}" varStatus="status">
										<tr class="text-center">
											<td>${list.sale_num}</td>
											<td>${list.reg_date}</td>
											<td>${list.sdate} 15:00</td>
											<td>${list.edate} 11:00</td>
											<td>${list.total_price}</td>
											<td>${list.coupon_price}</td>
											<td>${list.point_price}</td>
											<td>${list.discount}</td>
											<td>${list.final_price}</td>
											<td>${list.subject}</td>
											<td>${list.name}</td>
											<td>${list.detail_num}</td>
											<td>${list.user_num}</td>
											<td>${list.nickName}</td>				
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
									<button type="button" class="btn btn-light" onclick="listInit('room');">
										<i class="bi bi-arrow-clockwise"></i>
									</button>
								</td>
								<td align="center">
									<form class="row justify-content-center" name="searchForm"	method="GET">
										<div class="col-auto p-1">
											<select name="schType" id="searchType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>상품명</option>
											</select>
										</div>
										<div class="col-auto p-1">
											<div class="input-group">
												<input type="text" name="kwd" id="searchKeyword" value="${kwd}"
												    class="form-control" onkeypress="if(event.keyCode==13) { event.preventDefault(); document.getElementById('btnSearch').focus(); }">
												<button id="btnSearch" type="button" class="btn btn-primary btn-search" data-gubun="room">
												    <i class="bi bi-search"></i>
												</button>
											</div>
										</div>
									</form>

								</td>
								<td width="150" align="right"><c:url var="url"
										value="/admin/product/write" />
									<button type="button" class="btn border-primary text-primary"
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

