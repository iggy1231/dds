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
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.2/css/all.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" type="text/css">
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/core.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
    
    <script type="text/javascript" src="/dds/resources/vendor/jquery/js/jquery.min.js"></script>
    <script type="text/javascript" src="/dds/resources/js/util-jquery.js"></script>

<style type="text/css">
*	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
 * @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
} 
.title, .swap span {
	color: #18A8F1;
}

.card-front, .card-back {
	background-color: #ffffff;
	border: 2px solid #18A8F1;
}

.checkbox:checked + label:before, .checkbox:not(:checked) + label:before {
	background-color: #18A8F1;
	border: 1px solid #18A8F1;
}

.checkbox:checked + label, .checkbox:not(:checked) + label {
	background-color: #ffffff;
	border: 1px solid #18A8F1;
}

.checkbox:checked + label:before, .checkbox:not(:checked) + label:before {
	color: #18A8F1;
}

.form-style {
	background-color: #ffffff;
	border: 1px solid #18A8F1;
}

.form-style:focus {
	border: 1px solid #BEE8FD !important;
}

.input-icon {
	color: #18A8F1;
}

.btn, .btn:hover {
	background-color: #18A8F1;
	border: 1px solid #18A8F1;
	color: #fff;
	width: 200px;
}

.forgetPwd, .forgetPwd:hover {
	color: #18A8F1;
	text-decoration: none;
}

.form-style::placeholder {
    color: #4C4C4C !important;
    opacity: 1;
}

.form-style {
    color: #000000; 
}

</style>

</head>
<body>
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row full-height justify-content-center">
            <div class="col-12 text-center align-self-center py-5">
                <div class="section pb-5 pt-5 pt-sm-2 text-center">
                    <h6 class="mb-0 pb-3 swap"><span>로그인 </span><span>회원가입</span></h6>
                    <input class="checkbox bg-primary" type="checkbox" id="reg-log" name="reg-log"/>
                    <label for="reg-log" >
                    </label>
                    <div class="card-3d-wrap mx-auto">
                        <div class="card-3d-wrapper">
                            <div class="card-front">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-3 pb-3 title fw-semibold fs-4">로그인</h4>
                                        <form action="${pageContext.request.contextPath}/member/login" method="post" name="loginForm">
                                            <div class="form-group">
                                                <input value="" type="text" name="userId" class="form-style" placeholder="Id 입력" autocomplete="off"/>
                                                <i class="input-icon bi bi-box-arrow-in-right"></i>
                                            </div>    
                                            <div class="form-group mt-2">
                                                <input value="" type="password" name="userPwd" class="form-style" placeholder="Password 입력" autocomplete="off">
                                                <i class="input-icon bi bi-lock-fill"></i>
                                            </div>
                                            <button type="button" onclick="sendLogin();" class="btn mt-4 fw-medium" data-bs-toggle="modal" data-bs-target="#alertModal">로그인하기</button>
                                            <p class="mb-0 mt-4 text-center"><a href="#0" class="forgetPwd link">${message}</a></p>
                                            <c:if test="${not empty dto2.reason}">
											    <p>${dto2.reason}의 사유로 ${dto2.ban_edate} 까지 차단되었습니다.</p>
											</c:if>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="card-back">
                                <div class="center-wrap">
                                    <div class="section text-center">
                                        <h4 class="mb-3 pb-2 title fw-semibold fs-4">회원가입</h4>
                                        <form action="${pageContext.request.contextPath}/member/signup" method="post" name="signupForm">
                                            <div class="form-group">
                                                <input type="text" name="userId" class="form-style" placeholder="Id 입력" autocomplete="off">
                                                <i class="input-icon bi bi-box-arrow-in-right"></i>
                                            </div>     
                                            <div class="form-group mt-2">
                                                <input type="password" name="userPwd" class="form-style" placeholder="Password 입력" autocomplete="off">
                                                <i class="input-icon bi bi-lock-fill"></i>
                                            </div>
                                            <div class="form-group mt-2">
                                                <input type="text" name="userName" class="form-style" placeholder="이름 입력" autocomplete="off">
                                                <i class="input-icon bi bi bi-person-plus"></i>
                                            </div>
  		                                    <div class="row gx-1">
  		                                    	<div class="form-group mt-2 col pr-0 pl-0">
  		                                    		<input type="text" name="userNickname" class="form-style" placeholder="닉네임 입력" autocomplete="off">
                                                	<i class="input-icon bi bi bi-person-plus"></i>
  		                                    	</div>
  		                                    	<div class="form-group mt-2 col pr-0 pl-0">
  		                                    		<input type="date" name="userBirth" class="form-style" placeholder="Your Birthday" autocomplete="off" style="color: #818181;">
                                                	<i class="input-icon bi bi-calendar-check"></i>
  		                                    	</div>
                                            </div>
                                            <button type="button" class="btn mt-4 fw-medium" onclick="sendSignup();" data-bs-toggle="modal" data-bs-target="#alertModal">회원가입하기</button>
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
		<div class="modal fade" id="alertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
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
        	$('#alertModal .modal-title').text('아이디를 입력하세요');
            f.userId.focus(); 
            return;
        }

        str = f.userPwd.value.trim();
        if (!str) {
        	$('#alertModal .modal-title').text('비밀번호를 입력하세요');
            f.userPwd.focus();
            return;
        }	
   
        $('#alertModal').html('');
        f.submit();
    }
    function sendSignup() {
    	const f=document.signupForm;
    	let str;
    	
    	str=f.userId.value.trim();
    	if (!str) {
    		$('#alertModal .modal-title').text('아이디를 입력하세요');
            f.userId.focus(); 
            return;
        }

        str = f.userPwd.value.trim();
        if (!str) {
        	$('#alertModal .modal-title').text('비밀번호를 입력하세요');
            f.userPwd.focus();
            return;
        }
        
        str = f.userName.value.trim();
        if (!str) {
        	$('#alertModal .modal-title').text('이름을 입력하세요');
            f.userName.focus(); 
            return;
        }

        str = f.userNickname.value.trim();
        if (!str) {
        	$('#alertModal .modal-title').text('닉네임을 입력하세요');
            f.userNickname.focus();
            return;
        }
        
        str = f.userBirth.value.trim();
        if (!str) {
        	$('#alertModal .modal-title').text('생년월일을 입력하세요');
            f.userBirth.focus();
            return;
        }

        $('#alertModal').html('');
        f.submit();
    }
    
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
