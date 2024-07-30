<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content-container">
<div class="row">
<c:forEach var="list2" items="${list}">
	<div class="col-md-4 col-sm-6 col-xs-12">
	<div class="content-card" onclick="companionArticle(${list2.num});">
		<div class="d-flex align-items-stretch" style="height: 230px;">
			<img class="ratio ratio-4x3" src="${pageContext.request.contextPath}/uploads/companion/${list2.saveFilename}"
			onerror=this.src="${pageContext.request.contextPath}/resources/images/product_default.png"
			style="object-fit:cover; height: 100%;">
		</div>
		<div class="card-body">
			<h4 class="bold">${list2.subject}</h4>
			<span class="text-primary age-gender">#${list2.age}대&nbsp;&nbsp;#${list2.gender}</span> 
			<div class="meta mt-2">
				<span><img src="${pageContext.request.contextPath}/uploads/mypage/${list2.photo}">&nbsp;${list2.nickname}</span> 
				<span class="location"><i class="bi bi-geo-alt-fill text-primary"></i>&nbsp;${list2.mainRegion}</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<div class="page-navigation">${dataCount == 0 ? "참여중인 동행이 없습니다." : paging}
</div>