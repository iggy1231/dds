<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content-container">
<div class="row">
<c:forEach var="list1" items="${list}">
	<div class="col-md-4">
	<div class="content-card" onclick="companionArticle(${list1.num});">
		<div class="d-flex align-items-stretch" style="height: 230px;">
			<img class="ratio ratio-4x3" src="${pageContext.request.contextPath}/uploads/companion/${list1.saveFilename}" 
			onerror=this.src="${pageContext.request.contextPath}/resources/images/product_default.png"
			style="object-fit:cover; height: 100%;">
		</div>
		<div class="card-body">
			<h4 class="bold">${list1.subject}</h4>
			<span class="text-primary age-gender">
			    <c:choose>
			        <c:when test="${list1.age == 'all'}">
			            #모두&nbsp;&nbsp;#${list1.gender}
			        </c:when>
			        <c:otherwise>
			            #${list1.age}대&nbsp;&nbsp;#${list1.gender}
			        </c:otherwise>
			    </c:choose>
			</span>
			<div class="meta mt-2">
				<span><img src="${pageContext.request.contextPath}/uploads/mypage/${list1.photo}">${list1.nickname}</span> 
				<span class="location"><i class="bi bi-geo-alt-fill text-primary"></i>&nbsp;${list1.mainRegion}</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<div class="page-navigation">${dataCount == 0 ? "대기중인 동행이 없습니다." : paging}
</div>