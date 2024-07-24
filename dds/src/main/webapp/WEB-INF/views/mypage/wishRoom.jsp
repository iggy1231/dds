<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

                <!-- 숙소 탭 콘텐츠 -->
                <div class="row">
                	<c:forEach var="list" items="list">
	                    <div class="col-md-4">
	                        <div class="wishlist-item position-relative">
	                            <span class="badge-top-left">오늘의특가</span>
	                            <i class="bi bi-heart-fill heart-icon"></i>
	                            <img src="https://ppss.kr/wp-content/uploads/2023/02/1-2.jpeg" alt="Item Image">
	                            <div class="wishlist-item-body">
	                                <p class="wishlist-item-title">[순천] 순천만 정원박람회가 보이는 순천만펜션</p>
	                                <div class="wishlist-item-rating">
	                                    <i class="bi bi-star-fill"></i>
	                                    <span>4.7 (4053)</span>
	                                </div>
	                                <p class="wishlist-item-price">150,000원</p>
	                            </div>
	                            <div class="wishlist-item-footer">
	                                전라남도 • 순천
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 다른 아이템들도 여기에 추가 -->
	                  	<div class="col-md-4">
	                        <div class="wishlist-item position-relative">
	                            <span class="badge-top-left">오늘의특가</span>
	                            <i class="bi bi-heart-fill heart-icon"></i>
	                            <img src="https://ppss.kr/wp-content/uploads/2023/02/1-2.jpeg" alt="Item Image">
	                            <div class="wishlist-item-body">
	                                <p class="wishlist-item-title">[순천] 순천만 정원박람회가 보이는 순천만펜션</p>
	                                <div class="wishlist-item-rating">
	                                    <i class="bi bi-star-fill"></i>
	                                    <span>4.7 (4053)</span>
	                                </div>
	                                <p class="wishlist-item-price">150,000원</p>
	                            </div>
	                            <div class="wishlist-item-footer">
	                                전라남도 • 순천
	                            </div>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
                
                <div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>