<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content-container">
<div class="row">
<c:forEach var="list1" items="${list}">
	<div class="col-md-4">
	<div class="content-card">
		<img src="${pageContext.request.contextPath}/uploads/companion/${list1.saveFilename}" alt="Content Image">
		<div class="card-body">
			<h5>${list1.subject}</h5>
			<div class="meta">
				<span><i class="bi bi-person-circle"></i><img src="${pageContext.request.contextPath}/uploads/mypage/${list1.photo}">&nbsp;${list1.nickname}</span> 
				<span>${list1.age} 대 · ${list1.gender}</span> <span class="location">${list1.mainRegion}</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
</div>
</div>
<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>