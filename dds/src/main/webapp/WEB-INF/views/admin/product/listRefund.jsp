<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card">
			<div class="card mt-2">
        <div class="card-header">
        <div class="ps-3 fw-semibold fs-3 text-center mb-1 text-primary">숙소 환불 리스트</div>
        
        </div>
        <div class="card-body">
        	<div class="table-responsive text-nowrap">
						    <table class="table">
						        <thead>
						            <tr class="text-center">
						                <th>주문번호</th>
										<th>예약일자</th>
										<th>환불일</th>
										<th>환불된가격</th>
										<th>환불내용</th>
										<th>쿠폰차감</th>
										<th>포인트차감</th>
										<th>결제금액</th>
										<th>상품이름</th>
										<th>방이름</th>
										<th>방(고유번호)</th>
										<th>유저닉네임</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="list" items="${list}" varStatus="status">
										<tr class="text-center">
											<td>${list.sale_num}  <input type="hidden" id="sale_num-${list.sale_num}" value="${list.sale_num}">
														            <input type="hidden" id="final_price-${list.sale_num}" value="${list.final_price}">
														            <input type="hidden" id="card_num-${list.sale_num}" value="${list.card_num}">
														            <input type="hidden" id="user_num-${list.sale_num}" value="${list.user_num}">
											</td>
											<td>${list.reg_date}</td>
											<td>${list.refund_date}</td>
											<td>${list.refund_price}</td>
											<td>${list.refund_reason}</td>
											<td>${list.coupon_price}</td>
											<td>${list.point_price} </td>
											<td>${list.final_price}</td>
											<td>${list.subject}</td>
											<td>${list.name}</td>
											<td>${list.detail_num}</td>
											<td>${list.nickName}</td>	
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

							<div class="col-auto pt-4 ps-4 text-start">${dataCount}개(${page}/${total_page} 페이지)</div>
						<div class="page-navigation">${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
						</div>
        </div>
		</div>
	</div>
</div>
</div>