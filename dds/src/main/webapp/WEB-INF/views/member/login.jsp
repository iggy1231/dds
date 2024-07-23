<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" type="text/css">

</head>
<body>
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log">
                    </label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">Log In</h4>
                                        <form action="${pageContext.request.contextPath}/member/login" method="post" name="loginForm">
                                            <div class="form-group">
                                            	<!-- 나중에 value="admin2" 지울것! -->
                                                <input value="admin2" type="text" name="userId" class="form-style" placeholder="Your Id" id="logemail" autocomplete="off"/>
                                                <i class="input-icon bi bi-box-arrow-in-right"></i>
                                            </div>    
                                            <div class="form-group mt-2">
                                            	<!-- 나중에 value="admin2" 지울것! -->
                                                <input value="admin2" type="password" name="userPwd" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
                                                <i class="input-icon bi bi-lock-fill"></i>
                                            </div>
                                            <button type="button" onclick="sendLogin();" class="btn mt-4">submit</button>
                                            <p class="mb-0 mt-4 text-center"><a href="#0" class="link">Forgot your password?</a></p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3">Sign Up</h4>
                                        <form action="${pageContext.request.contextPath}/member/signup" method="post">
                                            <div class="form-group">
                                                <input type="text" name="logname" class="form-style" placeholder="Your Full Name" id="logname" autocomplete="off">
                                                <i class="input-icon bi bi-person"></i>
                                            </div>    
                                            <div class="form-group mt-2">
                                                <input type="email" name="logemail" class="form-style" placeholder="Your Email" id="logemail" autocomplete="off">
                                                <i class="input-icon bi bi-envelope"></i>
                                            </div>    
                                            <div class="form-group mt-2">
                                                <input type="password" name="logpass" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
                                                <i class="input-icon bi bi-lock-fill"></i>
                                            </div>
                                            <button type="submit" class="btn mt-4">submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function sendLogin() {
        const f = document.loginForm;
        let str;
        
        str = f.userId.value.trim();
        if (!str) {
            f.userId.focus(); 
            return;
        }

        str = f.userPwd.value.trim();
        if (!str) {
            f.userPwd.focus();
            return;
        }
		
        f.submit();
    }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
