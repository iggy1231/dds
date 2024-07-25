<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 후기 탭 콘텐츠 -->
<div class="row">
	<c:forEach var="list5" items="${list}">
		<div class="col-md-4">
			<div class="review-item">
				<i class="bi bi-heart-fill heart-icon" id="wishlist-${list5.num}" onclick="removeFromWishlist(${list5.num})"></i> 
				<a href="${pageContext.request.contextPath}/travelreview/article?num=${list5.num}&page=1">

						<c:choose>

							<c:when test="${not empty list5.imageFilename}">
								<c:set var="profileImage5"
									value="${pageContext.request.contextPath}/uploads/travelreview/${list5.imageFilename}" />
							</c:when>
							<c:otherwise>
								<c:set var="profileImage5"
									value="${pageContext.request.contextPath}/resources/images/product_default.png" />
							</c:otherwise>
						</c:choose> <img src="${profileImage5}" alt="Profile Image5"
						class="profile-image5 ratio ratio-4x3 img-fluid">
					</a>
				<div class="review-item-body">
					<p class="review-item-title">${list5.subject}</p>
					<p class="review-item-text">${list5.content}</p>
					<p class="review-item-location">
						<i class="bi bi-geo-alt-fill"></i> ${list5.region_sub}
					</p>
					<p class="review-item-date">
						<i class="bi bi-calendar-event"></i> ${list5.reg_date}
					</p>
				</div>
				<div class="review-item-footer">
					<span><i class="bi bi-person-circle"></i> ${list5.nickName}</span>
				</div>
			</div>
		</div>
		<!-- 다른 여행후기 아이템들도 여기에 추가 -->
	</c:forEach>
</div>

<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging} </div>

<script type="text/javascript">
function removeFromWishlist(num) {
    if(confirm("위시리스트에서 제거하시겠습니까?")) {
        $.ajax({
            url: '${pageContext.request.contextPath}/mypage/wishlist/remove', // 서버의 AJAX 요청을 처리할 URL
            type: 'POST',
            data: { num: num },
            success: function(response) {
                if(response.success) {
                    alert("위시리스트에서 제거되었습니다.");
                    // 성공 시 해당 항목을 화면에서 제거
                    $("#wishlist-" + num).closest('.col-md-4').remove();
                } else {
                    alert("제거하는 동안 오류가 발생했습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("AJAX 오류가 발생했습니다: " + error);
            }
        });
    }
}

</script>
