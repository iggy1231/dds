<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	                <div class="row g-4">
	                
	                <c:forEach var="list" items="${list}">
   		 <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
        <div class="property-item rounded overflow-hidden">
            <div class="position-relative overflow-hidden">
                <a href="${pageContext.request.contextPath}/travelreview/article?num=${list.num}&page=1">
               
                                					<c:choose>
					
    <c:when test="${not empty list.imageFilename}">
        <c:set var="profileImage2" value="${pageContext.request.contextPath}/uploads/travelreview/${list.imageFilename}" />
    </c:when>
    <c:otherwise>
        <c:set var="profileImage2" value="${pageContext.request.contextPath}/resources/images/product_default.png" />
    </c:otherwise>
</c:choose>

<img src="${profileImage2}" alt="Profile Image2" class="profile-image2 ratio ratio-4x3 img-fluid">
                </a>
                <div class="d-inline-flex position-absolute start-0 top-0 m-4">
                    <div class="bg-primary rounded text-white py-1 px-3 me-2"><i class="bi bi-heart-fill"></i>&nbsp;${list.likeCount}개</div> 
                    <div class="bg-primary rounded text-white py-1 px-3"><i class="bi bi-eye"></i>&nbsp;${list.hitCount}개</div>
                </div>
                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
                    <h5 style="font-weight: 600;">순천</h5>
                </div>
            </div>
            <div class="px-4 py-2 pb-3">
                <a class="d-block h4 mb-2 mt-2" href="" style="font-size:18px; font-weight: 600;">${list.subject}</a>
                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;${list.replyCount}개</h6> 
                <h6 class="display-10 py-1" style="color: #666565;"><i class="bi bi-calendar-check"></i>&nbsp;${list.reg_date}</h6>
            </div>
        </div>
    </div>
</c:forEach>
	                    
					</div>
					
					<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
                        </div>
					
					
