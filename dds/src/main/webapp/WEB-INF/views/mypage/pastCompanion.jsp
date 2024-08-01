<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content-container">
<div class="row">
<c:forEach var="list3" items="${list}">
	<div class="col-md-4">
	<div class="content-card" onclick="companionArticle(${list3.num});">
		<div class="d-flex align-items-stretch" style="height: 230px;">
			<img class="ratio ratio-4x3" src="${pageContext.request.contextPath}/uploads/companion/${list3.saveFilename}"
			onerror=this.src="${pageContext.request.contextPath}/resources/images/product_default.png"
			style="object-fit:cover; height: 100%;">
		</div>
		<div class="card-body">
			<h4 class="bold">${list3.subject}</h4>
			<span class="text-primary age-gender">
			    <c:choose>
			        <c:when test="${list3.age == 'all'}">
			            #모두&nbsp;&nbsp;#${list3.gender}
			        </c:when>
			        <c:otherwise>
			            #${list3.age}대&nbsp;&nbsp;#${list3.gender}
			        </c:otherwise>
			    </c:choose>
			</span>
			<div class="meta mt-2">
				<span><img src="${pageContext.request.contextPath}/uploads/mypage/${list3.photo}">&nbsp;${list3.nickname}</span> 
				<span class="location"><i class="bi bi-geo-alt-fill text-primary"></i>&nbsp;${list3.mainRegion}</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<div class="page-navigation">${dataCount == 0 ? "참여했던 동행이 없습니다." : paging}
</div>