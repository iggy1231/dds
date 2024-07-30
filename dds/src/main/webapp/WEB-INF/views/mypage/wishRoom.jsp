<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

                <!-- 숙소 탭 콘텐츠 -->
                <div class="row">
                	<c:forEach var="list1" items="${list}">
	                    <div class="col-md-4">
	                        <div class="wishlist-item position-relative" onclick="wishRoomArticle(${list1.num});">
	                            <span class="badge-top-left">두둥실특가</span>
	                            <i class="bi bi-heart-fill heart-icon" id="wishlist-${list1.num}" onclick="removeFromWishlist(${list1.num}, 'room')"></i>
	                            <img src="${list1.thumbnail}" alt="Item Image">
	                            <div class="wishlist-item-body">
	                                <p class="wishlist-item-title">${list1.subject}</p>
	                                <div class="wishlist-item-rating">
	                                    <i class="bi bi-star-fill"></i>
	                                    <span>${list1.rating} (${list1.ratingCount})</span>
	                                </div>
	                                <p class="wishlist-item-price">${list1.price}</p>
	                            </div>
	                            <div class="wishlist-item-footer">
	                                ${list1.addr1}
	                            </div>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
                
                <div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>