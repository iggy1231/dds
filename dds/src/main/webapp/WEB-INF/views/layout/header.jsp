<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
    .profile-pic {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        object-fit: cover;
    }
    
        @media (max-width: 1000px) {
        .navbar {
            margin-bottom: 5px;
        }
    }

</style>

<div class="nav-bar bg-transparent">
    <div class="thin-blue-bar"></div>

    <nav class="px-5 navbar navbar-expand-lg navbar-light bg-white py-0 px-4">
        <a href="${pageContext.request.contextPath}/" class="px-2 navbar-brand d-flex align-items-center text-center  text-nowrap">
            <div class="icon p-2 me-2 pb-3">
                <img class="pt-2 img-fluid" src="${pageContext.request.contextPath}/resources/images/두둥실_logo.png" alt="Icon" style="width: 86px;">
            </div>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse px-5" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
                <div class="nav-item dropdown">
                    <a href="${pageContext.request.contextPath}/room/main" class="nav-link text-start text-nowrap"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_room.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;숙소</a>
                </div>
                <div class="nav-item dropdown">
                    <a href="${pageContext.request.contextPath}/tour/main" class="nav-link text-start text-nowrap" data-bs-toggle="dropdown"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_tour.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;투어</a>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle text-start" data-bs-toggle="dropdown"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_여행.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;여행</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${pageContext.request.contextPath}/info/list" class="dropdown-item">여행정보</a>
                        <a href="${pageContext.request.contextPath}/travelreview/list" class="dropdown-item">여행후기</a>
                    </div>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/companion/list" class="nav-link text-start text-nowrap"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_동행.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;동행</a>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle text-start" data-bs-toggle="dropdown"><img alt="" src="${pageContext.request.contextPath}/resources/images/Customer_Support.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;고객센터</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${pageContext.request.contextPath}/event/progress/list" class="dropdown-item">이벤트</a>
                        <a href="${pageContext.request.contextPath}/faq/main" class="dropdown-item">자주 묻는 질문</a>
                    </div>
                </div>
            </div>
            <c:choose>
            	<c:when test="${empty sessionScope.member}">
		            <div class="mt-2 d-lg-none text-start my-2">
		                <a href="${pageContext.request.contextPath}/member/login" class="btn btn-primary text-white">로그인 및 회원가입</a>
		            </div>
            	</c:when>
            	<c:otherwise>
            		<c:if test="${sessionScope.member.activity>50}">
	        			<div class="d-none d-lg-flex ms-lg-3">
		        			<a href="${pageContext.request.contextPath}/admin" title="관리자"><i class="bi bi-gear-fill" style="font-size: 24px; color: #5e6576;"></i></a>
	        			</div>
	        		</c:if>
            	</c:otherwise>
            </c:choose>
            <c:choose>
        	<c:when test="${empty sessionScope.member}">
			    <div class="d-none d-lg-flex ms-lg-3">
			        <a href="${pageContext.request.contextPath}/member/login" class="btn btn-primary text-white px-3">로그인 및 회원가입</a>
			    </div>
        	</c:when>
        	<c:otherwise>
	        		
        	</c:otherwise>
        </c:choose>
        
        <c:if test="${sessionScope.member != null}">
					<c:choose>
    <c:when test="${not empty sessionScope.member.photo}">
        <c:set var="profileImage" value="${pageContext.request.contextPath}/uploads/mypage/${sessionScope.member.photo}" />
    </c:when>
    <c:otherwise>
        <c:set var="profileImage" value="${pageContext.request.contextPath}/resources/images/profile_image_default.png" />
    </c:otherwise>
</c:choose>


					<nav class="ms-lg-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"></a>
        <div class="dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="${profileImage}" alt="Profile Picture" class="profile-pic">
            </a>
            <ul class="dropdown-menu dropdown-menu-start mb-3" aria-labelledby="profileDropdown">
                <li class="dropdown-header d-flex align-items-center">
                    <img src="${profileImage}" alt="Profile Picture" class="profile-pic">
                    <div class="user-info">
                        <span class="user-name ms-3">${sessionScope.member.userName}</span>
                    </div>
                </li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/coupoint"><i class="fas fa-user-cog me-2"></i>쿠폰·포인트</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/wishList"><i class="fas fa-users me-2"></i>위시리스트</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/inquiReview"><i class="fas fa-file-alt me-2"></i>문의·리뷰</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myTrip"><i class="fas fa-file-alt me-2"></i>내여행</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/profile"><i class="fas fa-file-alt me-2"></i>프로필</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout" onclick="confirmLogout()"><i class="fas fa-sign-out-alt me-2"></i> 로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>
		</c:if>
    </nav>
        </div>
        
