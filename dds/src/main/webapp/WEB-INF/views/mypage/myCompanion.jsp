<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content-container">
<div class="row">
<c:forEach var="list4" items="${list}">
	<div class="col-md-4">
	<div class="content-card">
		<img src="${pageContext.request.contextPath}/uploads/companion/${list4.saveFilename}" alt="Content Image">
		<div class="card-body">
			<h5>${list4.subject}</h5>
			<div class="meta">
				<span><i class="bi bi-person-circle"></i><img src="${pageContext.request.contextPath}/uploads/mypage/${list4.photo}">&nbsp;${list4.nickname}</span> 
				<span>${list4.age} 대 · ${list4.gender}</span> <span class="location">${list4.mainRegion}</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>