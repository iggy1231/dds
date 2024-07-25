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

<style type="text/css">
body {
	background-color: #ffffff;
}

.title, .swap span {
	color: #18A8F1;
}

.card-front, .card-back {
	background-color: #ffffff;
	border: 2px solid #18A8F1;
}

.checkbox:checked + label:before, .checkbox:not(:checked) + label:before {
	background-color: #ffffff;
	border: 1px solid #18A8F1;
}

.checkbox:checked + label, .checkbox:not(:checked) + label {
	background-color: #ffffff;
	border: 1px solid #18A8F1;
}

.checkbox:checked + label:before, .checkbox:not(:checked) + label:before {
	color: #ffffff;
}

.form-style {
	background-color: #ffffff;
	border: 1px solid #18A8F1;
}

.form-style:focus {
	border: 1px solid #25D380;
}

.input-icon {
	color: #18A8F1;
}

.btn, .btn:hover {
	background-color: #ffffff;
	border: 1px solid #18A8F1;
	color: #18A8F1;
}

.forgetPwd, .forgetPwd:hover {
	color: #18A8F1;
	text-decoration: none;
}
</style>

</head>
<body>
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <h6 class="mb-0 pb-3 swap"><span>Log In </span><span>Sign Up</span></h6>
                    <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log">
                    </label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3 title">Log In</h4>
                                        <form action="${pageContext.request.contextPath}/member/login" method="post" name="loginForm">
                                            <div class="form-group">
                                            	<!-- 나중에 value="admin" 지울것! -->
                                                <input value="admin" type="text" name="userId" class="form-style" placeholder="Your Id" autocomplete="off"/>
                                                <i class="input-icon bi bi-box-arrow-in-right"></i>
                                            </div>    
                                            <div class="form-group mt-2">
                                            	<!-- 나중에 value="admin" 지울것! -->
                                                <input value="admin" type="password" name="userPwd" class="form-style" placeholder="Your Password" autocomplete="off">
                                                <i class="input-icon bi bi-lock-fill"></i>
                                            </div>
                                            <button type="button" onclick="sendLogin();" class="btn mt-4">submit</button>
                                            <p class="mb-0 mt-4 text-center"><a href="#0" class="forgetPwd link">Forgot your password?</a></p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-4 pb-3 title">Sign Up</h4>
                                        <form action="${pageContext.request.contextPath}/member/signup" method="post" name="signupForm">
                                            <div class="form-group">
                                                <input type="text" name="userId" class="form-style" placeholder="Your Id" autocomplete="off">
                                                <i class="input-icon bi bi-box-arrow-in-right"></i>
                                            </div>     
                                            <div class="form-group mt-2">
                                                <input type="password" name="userPwd" class="form-style" placeholder="Your Password" autocomplete="off">
                                                <i class="input-icon bi bi-lock-fill"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="text" name="userName" class="form-style" placeholder="Your Name" autocomplete="off">
                                                <i class="input-icon bi bi bi-person-plus"></i>
                                            </div>
  		                                    <div class="form-group mt-2">
                                                <input type="text" name="userNickname" class="form-style" placeholder="Your Nickname" autocomplete="off">
                                                <i class="input-icon bi bi bi-person-plus"></i>
                                            </div>
                                            <button type="button" class="btn mt-4" onclick="sendSignup();">submit</button>
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
    function sendSignup() {
    	const f=document.signupForm;
    	let str;
    	
    	str=f.userId.value.trim();
    	if (!str) {
            f.userId.focus(); 
            return;
        }

        str = f.userPwd.value.trim();
        if (!str) {
            f.userPwd.focus();
            return;
        }
        
        str = f.userName.value.trim();
        if (!str) {
            f.userName.focus(); 
            return;
        }

        str = f.userNickname.value.trim();
        if (!str) {
            f.userNickname.focus();
            return;
        }
        
        f.submit();
    }
    
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
