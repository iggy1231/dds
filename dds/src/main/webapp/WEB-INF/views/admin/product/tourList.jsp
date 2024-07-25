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
						<div class="table-responsice text-nowrap">
							<table class="table">
								<thead>
									<tr class="text-center"> 
										<th>상품코드</th>
										<th>상품타입</th>
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
											<td>${dto.room_type}</td>
											<td><img style="width: 100px; height: 70px;" class="justify-content-center"
												src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}">
												<a href="#"></a></td>
											<td>${dto.subject}</td>
											<td>${dto.price}</td>
											<td>${dto.active==1?"판매중":"판매중단"}</td>
											<td>${dto.reg_date}</td>
											<td>yyyy-mm-dd</td>
											<td><c:url var="updateUrl"
													value="/admin/product/update">
													<c:param name="num" value="${dto.num}" />
													<c:param name="page" value="${page}" />
												</c:url>
												<button type="button" class="btn border btn-update"
													onclick="location.href='${updateUrl}';">수정</button></td>
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
									<button type="button" class="btn btn-light" onclick="listInit('tour');">
										<i class="bi bi-arrow-clockwise"></i>
									</button>
								</td>
								<td align="center">
									<form class="row justify-content-center" name="searchForm"	method="post">
										<div class="col-auto p-1">
											<select name="schType" id="searchType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>상품명</option>
											</select>
										</div>
										<div class="col-auto p-1">
											<input type="text" name="kwd" id="searchKeyword" value="${kwd}"
												class="form-control">
										</div>
										<div class="col-auto p-1">
											<button type="button" class="btn btn-light btn-search" data-gubun="tour">
												<i class="bi bi-search"></i>
											</button>
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

