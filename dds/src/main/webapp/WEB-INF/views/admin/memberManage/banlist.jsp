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
										<th>차단 번호</th>
										<th>유저번호</th>
										<th>닉네임</th>
										<th>차단사유</th>
										<th>시작시간</th>
										<th>종료시간</th>
										<th>차단여부</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="list" items="${list}" varStatus="status">
										<tr class="text-center">
											<td>${list.num}</td>
											<td>${list.user_num}</td>
											<td>${list.nickName} </td>
											<td>${list.reason} </td>
											<td>${list.ban_sdate}</td>
											<td>${list.ban_edate}</td>
											<td>${list.ban_state == 1 ? "차단 중" : "차단 해제"}</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

							<div class="col-auto pt-4 ps-4 text-start">${dataCount}개(${page}/${total_page} 페이지)</div>
						<div class="page-navigation">${dataCount == 0 ? "차단 목록 없음" : paging}
						</div>

					
					</div>
				</div>
				<!-- tab-content _ end -->
			</div>
			<!-- body-main -->
		</div>
	</div>

<script type="text/javascript">

</script>