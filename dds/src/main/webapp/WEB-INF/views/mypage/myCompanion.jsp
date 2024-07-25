<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content-container">
	<div class="content-card">
		<img src="https://via.placeholder.com/300x200" alt="Content Image">
		<div class="card-body">
			<h5>8월 19일부터 25일 6박 7일 홈스골 지역 동행인구해요!!</h5>
			<div class="meta">
				<span><i class="bi bi-person-circle"></i>&nbsp;yunsu...</span> <span>20대
					· 여자</span> <span class="location">순천</span>
			</div>
		</div>
	</div>
</div>

<div class="page-navigation">${dataCount == 0 ? "등록된 댓글이 없습니다." : paging}
</div>