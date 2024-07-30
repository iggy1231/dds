<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content-container">
<div class="row">
<c:forEach var="list2" items="${list}">
	<div class="col-md-4 col-sm-6 col-xs-12">
	<div class="content-card" onclick="companionArticle(${list2.num});">
		<img src="${pageContext.request.contextPath}/uploads/companion/${list2.saveFilename}" alt="Content Image">
		<div class="card-body">
			<h5>${list2.subject}</h5>
			<div class="meta">
				<span><img src="${pageContext.request.contextPath}/uploads/mypage/${list2.photo}">&nbsp;${list2.nickname}</span> 
				<span>${list2.age} 대 · ${list2.gender}</span> <span class="location">${list2.mainRegion}</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<div class="page-navigation">${dataCount == 0 ? "참여중인 동행이 없습니다." : paging}
</div>