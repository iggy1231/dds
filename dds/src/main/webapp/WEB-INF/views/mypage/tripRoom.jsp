<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2 class="mt-3" style="color: #18A8F0">
<strong> 🧳 두둥! 여행가자!</strong>
</h2>
<c:forEach var="list1" items="${currentTrips}">
<div class="row justify-content-center">
	<div class="col-md-12 wow fadeInUp" data-wow-delay="0.3s">
		<div class="property-item rounded overflow-hidden">
			<div class="flex-container">
				<div class="flex-item">
					<div>
						<img
							src="${pageContext.request.contextPath}/uploads/room/${list1.thumbnail}"
							class="img-fluid rounded" alt="숙소 이미지">
					</div>
				</div>

				<div class="flex-item">
					<div class="px-1 py-2 pb-3">
						<a class="d-block h4 mb-2 mt-2"
						href="#" onclick="roomArticle(${list1.num});"
						style="font-size: 24px; font-weight: 600;">${list1.subject}</a>
						<h6 class="display-10" style="color: #666565;">${list1.name} • ${list1.days}박</h6>

					</div>
				</div>

				<div class="flex-item"
					style="margin-left: auto; display: flex; align-items: top;">
					<a href="#" style="color: #18A8F1; font-size: 14px;">예약상세 &gt;</a>
				</div>
			</div>

			<div class="flex-item mt-4 py-3 rounded mb-2"
				style="display: flex; justify-content: space-evenly; margin-top: 10px; background-color: #f3f5f7; ">
				<div class="text-center">
					<span>체크인</span><br> 
					  <fmt:parseDate value="${list1.sdate}" pattern="yyyy-MM-dd HH:mm:ss" var="checkinDate" />
                      <fmt:formatDate value="${checkinDate}" pattern="yyyy-MM-dd" />
				</div>
				<div>
					<span>|<input type="hidden" id="sale_num-${list1.sale_num}" value="${list1.sale_num}">
				            <input type="hidden" id="final_price-${list1.sale_num}" value="${list1.final_price}">
				            <input type="hidden" id="card_num-${list1.sale_num}" value="${list1.card_num}">
				            <input type="hidden" id="user_num-${list1.sale_num}" value="${list1.user_num}"></span>
				</div>
				<div  class="text-center">
					<span>체크아웃</span><br> 
					<fmt:parseDate value="${list1.edate}" pattern="yyyy-MM-dd HH:mm:ss" var="checkoutDate" />
                    <fmt:formatDate value="${checkoutDate}" pattern="yyyy-MM-dd" />
					<!--   <span>${list1.edate}</span> -->
				</div>

			</div>
			<!-- 예약 취소 버튼과 더보기 버튼을 오른쪽 하단에 배치 -->
			<div class="flex-item"
				style="display: flex; justify-content: flex-end; margin-top: 10px;">
				      <!--  <input type="text" id="description-${list1.sale_num}"> -->  
    <button class="btn btn-primary" style="margin-right: 5px;" data-bs-toggle="modal" data-bs-target="#refundModal" data-sale-num="${list1.sale_num}" data-imp-uid="${list1.imp_uid}">예약 취소</button>
				<div class="dropdown">
					<button onclick="toggleDropdown()"
						class="btn btn-outline-secondary">...</button>
					<div id="myDropdown" class="dropdown-content">
						<a href="#">문의</a> <a href="#">리뷰</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 수정된 부분 시작: 예약 취소 모달 추가 -->
<div class="modal fade" id="refundModal" tabindex="-1" aria-labelledby="refundModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title btnRefundWriteForm" id="refundModalLabel">취소 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="review-form border border-secondary p-3 mt-2">
                    <form name="refundForm" id="refundForm" enctype="multipart/form-data">
                        <div class="p-1">
                            <label for="description">취소 사유:</label>
                            <textarea name="description" id="description" class="form-control"></textarea>
                        </div>
                        <div class="p-1 text-end">
                            <button type="button" class="btn btn-dark btnRefundSend ps-5 pe-5" onclick="getToken('${list1.imp_uid}',null,${list1.sale_num})">등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 수정된 부분 끝 -->
</c:forEach>
<hr>
<h2 class="mt-3" style="color: #18A8F0">

<strong>🏝️ 두둥! 추억!</strong>
</h2>
<c:forEach var="list2" items="${pastTrips}">
    <div class="row justify-content-center payment-list">
        <div class="col-md-12 wow fadeInUp" data-wow-delay="0.3s">
            <div class="property-item rounded overflow-hidden">
                <div class="flex-container">
                    <div class="flex-item">
                        <div>
                            <img src="${pageContext.request.contextPath}/uploads/room/${list2.thumbnail}" class="img-fluid rounded" alt="숙소 이미지">
                        </div>
                    </div>

                    <div class="flex-item">
                        <div class="px-1 py-2 pb-3">
                            <a class="d-block h4 mb-2 mt-2" href="" style="font-size: 24px; font-weight: 600;">${list2.subject}</a>
                            <h6 class="display-10" style="color: #666565;">${list2.name} • ${list2.days}박</h6>
                        </div>
                    </div>

                    <div class="flex-item" style="margin-left: auto; display: flex; align-items: top;">
                        <a href="#" style="color: #18A8F1; font-size: 14px;">예약상세 &gt;</a>
                    </div>
                </div>

                <div class="flex-item mt-4 py-3 rounded mb-2" 
                style="display: flex; justify-content: space-evenly; margin-top: 10px;  background-color: #f3f5f7;">
                    <div class="text-center">
                        <span>체크인</span><br> 
                         <fmt:parseDate value="${list2.sdate}" pattern="yyyy-MM-dd HH:mm:ss" var="pastCheckinDate" />
                            <fmt:formatDate value="${pastCheckinDate}" pattern="yyyy-MM-dd" />
                        <!--  <span>${list2.sdate}</span> -->
                    </div>
                    <div>
                        <span>|<input type="hidden" id="sale_num-${list2.sale_num}" value="${list2.sale_num}">
				            <input type="hidden" id="final_price-${list2.sale_num}" value="${list2.final_price}">
				            <input type="hidden" id="card_num-${list2.sale_num}" value="${list2.card_num}">
				            <input type="hidden" id="user_num-${list2.sale_num}" value="${list2.user_num}"></span>
                    </div>
                    <div  class="text-center">
                        <span>체크아웃</span><br> 
                         <fmt:parseDate value="${list2.edate}" pattern="yyyy-MM-dd HH:mm:ss" var="pastCheckoutDate" />
                            <fmt:formatDate value="${pastCheckoutDate}" pattern="yyyy-MM-dd" />
                      <!--    <span>${list2.edate}</span> -->
                    </div>
                </div>

                <!-- 리뷰 폼 -->
                <div class="flex-item" style="display: flex; justify-content: flex-end; margin-top: 10px;">
                    <button class="btn btn-secondary" style="margin-right: 5px;">다시예약</button>
                  	<c:if test="${list2.update_review == 0 }">
                    <button class="btn btn-primary btnReviewWriteForm" style="margin-right: 5px;" data-bs-toggle="modal" data-bs-target="#reviewModal" onclick="writeForm(${list2.num},${list2.sale_num});">리뷰작성</button>                  	
                  	</c:if>
                    <c:if test="${list2.update_review == 1 }">
                    <button class="btn btn-primary" style="margin-right: 5px;"  > 작성완료 </button>                  	
                  	</c:if>
                    <div class="dropdown">
                        <button onclick="toggleDropdown()" class="btn btn-outline-secondary">...</button>
                        <div id="myDropdown" class="dropdown-content">
                            <a href="#">문의</a> <a href="#">리뷰</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
</c:forEach>

<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title btnReviewWriteForm" id="reviewModalLabel">리뷰 작성</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="review-form border border-secondary p-3 mt-2">
                    <form name="reviewForm" enctype="multipart/form-data">
                        <div class="p-1">
                            <p class="star">
                                <a href="#" class="on"><i class="bi bi-star-fill"></i></a>
                                <a href="#" class="on"><i class="bi bi-star-fill"></i></a>
                                <a href="#" class="on"><i class="bi bi-star-fill"></i></a>
                                <a href="#" class="on"><i class="bi bi-star-fill"></i></a>
                                <a href="#" class="on"><i class="bi bi-star-fill"></i></a>
                                <input type="hidden" name="rating" value="5">
                                <input type="hidden" name="num" value="${list2.num}">
                                <input type="hidden" name="sale_num" value="${list2.sale_num}">
                            </p>
                        </div>
                        <div class="p-1">
                            <textarea name="content" id="content" class="form-control"></textarea>        
                        </div>
                        <div class="p-1">
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png" name="photo">
							</div>
								<input type="file" name="photoFile" accept="image/*" class="form-control" style="display: none;">
							</div>
                        
                        <div class="p-1 text-end">
                            <button type="button" class="btn btn-dark btnReviewSend ps-5 pe-5" data-room-id="${list2.num}">등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



