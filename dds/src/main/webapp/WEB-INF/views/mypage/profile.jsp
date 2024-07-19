<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="my-info">
	<div class="page-title">
		<div class="spacing-top"></div>
		 <div class="content"> 
		 	<div class="title-row">
		 		<div class="title title--show">
		 			<h1 class="text">프로필</h1>
			 	</div> 
			 	<div class="action-btn-area"></div>
			 </div>
		</div>
		<div class="spacing-bottom"></div>	 
		<div class="profile-container">
			<div class="profile-info">
				<img src="${pageContext.request.contextPath}/resources/images/profile_image_default.png" alt="Profile Image" class="profile-image">
				<div class="profile-content">
					<div class="nickname">닉네임</div>
					<div class="details">20대 • 여자</div>
				</div>
			</div>
			<button class="mbti-button">mbti</button>
		</div>	
	</div>
</div>

