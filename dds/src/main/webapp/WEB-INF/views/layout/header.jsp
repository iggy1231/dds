<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container-fluid nav-bar bg-transparent">
    <nav class="navbar navbar-expand-lg navbar-light bg-white py-0 px-4">
        <a href="index.html" class="navbar-brand d-flex align-items-center text-center">
            <div class="icon p-2 me-2">
                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/두둥실_logo.png" alt="Icon" style="width: 100px;">
            </div>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">숙소</a>
                <a href="${pageContext.request.contextPath}/" class="nav-item nav-link">투어</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">여행</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">여행 정보</a>
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">여행기</a>
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">플래너</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">동행</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">지역</a>
                        <a href="${pageContext.request.contextPath}/" class="dropdown-item">테마</a>
                    </div>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/member/login" class="btn btn-primary px-3 d-none d-lg-flex">로그인 및 회원가입</a>
        </div>
    </nav>
</div>
