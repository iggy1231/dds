<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content-container">
<div class="row">
<c:forEach var="list3" items="${list}">
	<div class="col-md-4">
	<div class="content-card">
		<img src="${pageContext.request.contextPath}/uploads/companion/${list3.saveFilename}" alt="Content Image">
		<div class="card-body">
			<h5>${list3.subject}</h5>
			<div class="meta">
				<span><i class="bi bi-person-circle"></i><img src="${pageContext.request.contextPath}/uploads/mypage/${list3.photo}">&nbsp;${list3.nickname}</span> 
				<span>${list3.age} 대 · ${list3.gender}</span> <span class="location">${list3.mainRegion}</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>