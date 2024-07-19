<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="nav-bar bg-transparent">
    <div class="thin-blue-bar"></div>

    <nav class="px-5 navbar navbar-expand-lg navbar-light bg-white py-0 px-4">
        <a href="${pageContext.request.contextPath}/" class="px-2 navbar-brand d-flex align-items-center text-center">
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
                    <a href="${pageContext.request.contextPath}" class="nav-link dropdown-toggle text-start" data-bs-toggle="dropdown"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_room.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;숙소</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${pageContext.request.contextPath}/room/main" class="dropdown-item">숙소 전체보기</a>
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">내 예약</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle text-start" data-bs-toggle="dropdown"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_tour.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;투어</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">투어 전체보기</a>
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">내 예약</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle text-start" data-bs-toggle="dropdown"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_여행.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;여행</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${pageContext.request.contextPath}/info/list" class="dropdown-item">여행 정보</a>
                        <a href="${pageContext.request.contextPath}/travelreview/list" class="dropdown-item">여행기</a>
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">플래너</a>
                    </div>
                </div>
                <div class="nav-item">
                    <a href="${pageContext.request.contextPath}/" class="nav-link text-start"><img alt="" src="${pageContext.request.contextPath}/resources/images/menu_동행.png" style="width: 35px;">&nbsp;&nbsp;&nbsp;동행</a>
                </div>
            </div>
            <div class="mt-2 d-lg-none text-start my-2">
                <a href="${pageContext.request.contextPath}/member/login" class="btn btn-primary text-white">로그인 및 회원가입</a>
            </div>
            <c:choose>
        	<c:when test="${empty sessionScope.member}">
			    <div class="d-none d-lg-flex ms-lg-3">
			        <a href="${pageContext.request.contextPath}/member/login" class="btn btn-primary text-white px-3">로그인 및 회원가입</a>
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
        
        <c:if test="${sessionScope.member != null}">
					<c:choose>
						<c:when test="${not empty sessionScope.member_profile.photo}">
							<c:set var="profileImage"
								value="${pageContext.request.contextPath}/uploads/member/${sessionScope.member_profile.photo}" />
						</c:when>
						<c:otherwise>
							<c:set var="profileImage"
								value="${pageContext.request.contextPath}/resources/images/profile_image_default.png" />
						</c:otherwise>
					</c:choose>

					<nav class="ms-lg-3">
						<div class="container-fluid">
							<a class="navbar-brand" href="#"></a>
							<div class="dropdown">
								<a class="nav-link dropdown-toggle" href="#"
									id="profileDropdown" role="button" data-bs-toggle="dropdown"
									aria-expanded="false"> <img src="${profileImage}"
									alt="Profile Picture" class="profile-pic">
								</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="profileDropdown">
									<li class="dropdown-header"><img src="${profileImage}"
										alt="Profile Picture" class="profile-pic">
										<div class="user-info">
											<span class="user-name">${sessionScope.member.userName}</span>
										</div></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/"><i
											class="fas fa-user-cog me-2"></i>포인트</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/"><i
											class="fas fa-users me-2"></i>쿠폰</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/"><i
											class="fas fa-file-alt me-2"></i>위시리스트</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/"><i
											class="fas fa-file-alt me-2"></i>내여행</a></li>
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/"><i
											class="fas fa-file-alt me-2"></i>메시지</a></li>
									<li><a class="dropdown-item" href="#"
										onclick="confirmLogout()"><i
											class="fas fa-sign-out-alt me-2"></i> 로그아웃</a></li>
								</ul>
							</div>
						</div>
					</nav>
		</c:if>
    </nav>
        </div>
        
