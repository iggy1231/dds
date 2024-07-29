<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="card mb-4">
	<h5 class="card-header">프로필 상세</h5>
	<!-- Account -->
	
		<form name="updateForm" action="${pageContext.request.contextPath}/mypage/profileUpdate" id="formAccountSettings" method="POST" enctype="multipart/form-data" class="write-form">
	<div class="card-body">
		<div class="d-flex align-items-start align-items-sm-center gap-4">
			<img alt="user-avatar"
				class="d-block rounded profile-photo" height="100" width="100" id="uploadedAvatar" />
			<div class="button-wrapper">
				<label for="upload" class="btn btn-primary me-2 mb-0" tabindex="0">
					<span class="d-none d-sm-block">사진 Upload</span> <i
					class="bx bx-upload d-block d-sm-none"></i> <input name="photoFile" type="file"
					id="upload" class="account-file-input" hidden accept="image/png, image/jpeg" />
				</label>
				<button type="button"
					class="btn btn-outline-secondary account-image-reset mb-0">
					<i class="bx bx-reset d-block d-sm-none"></i> <span
						class="d-none d-sm-block">Reset</span>
				</button>
				<div class="mb-3 col-md-12">
					<label for="content" class="form-label mb-1 mt-2">자기소개</label> 
					<input class="form-control" type="text" id="content" name="content" value="${dto.content}" style="width: 100%;"/>
				</div>


			</div>
		</div>
	</div>
	<hr class="my-0" />
	<div class="card-body">
			<div class="row">
				<div class="mb-3 col-md-6">
					<label for="Id" class="form-label">아이디</label> <input
						class="form-control" type="text" id="Id" name="userId"
						value="${dto.userId}" autofocus />
				</div>
				<div class="mb-3 col-md-6">
					<label for="Name" class="form-label">이름</label> <input
						class="form-control" type="text" name="userName" id="Name"
						value="${dto.userName}" />
				</div>
				<div class="mb-3 col-md-6">
					<label for="password" class="form-label">패스워드</label> <input
						class="form-control" type="text" id="password" name="pwd"
						value="${dto.pwd}" placeholder="패스워드입력하쇼" />
				</div>
				<div class="mb-3 col-md-6">
					<label for="nickName" class="form-label">닉네임</label> <input
						type="text" class="form-control" id="nickName"
						name="nickName" value="${dto.nickName}" />
				</div>
				<div class="mb-3 col-md-6">
					<label for="passwordCheck" class="form-label">이메일</label> <input
						type="text" class="form-control" id="email" name="email"
						value="${dto.email}"/>
				</div>
				<div class="mb-3 col-md-6">
					<label class="form-label" for="phoneNumber">전화번호</label>
					<div class="input-group input-group-merge">
						<span class="input-group-text">KOR (+82)</span> <input type="text"
							id="phoneNumber" name="tel" class="form-control"
							placeholder="010 1234 5678" value="${dto.tel}" />
					</div>
				</div>
				<div class="mb-3 col-md-6">
					<label for="gender" class="form-label">성별</label> <select
						id="gender" class="select2 form-select" name="gender">
						<option value="여성">여성</option>
						<option value="남성">남성</option>
						<option value="제3">제 3의 성</option>
					</select>
				</div>
				<div class="mb-3 col-md-6">
					<label for="birth" class="form-label">생년월일</label> <input
						class="form-control" type="date" id="birth" name="birth"
						placeholder="생년월일" value="${dto.birth}"/>
				</div>
				<div class="mb-3 col-md-6">
					<label for="passwordCheck" class="form-label">패스워드 확인</label> <input
						type="password" class="form-control" id="passwordCheck" name="passwordCheck"
						placeholder="현재 패스워드를 입력하세요" />
				</div>
			</div>
			<div class="mt-2">
				<button type="button" class="btn btn-primary me-2" onclick="updateSubmit();">저장</button>
				<button type="reset" class="btn btn-outline-secondary" onclick="window.location.href='${pageContext.request.contextPath}/mypage/profile'">수정취소</button>
			</div>
</div>
		</form>
	</div>
	<!-- /Account -->
<div class="card">
	<h5 class="card-header">계정삭제</h5>
	<div class="card-body">
		<div class="mb-3 col-12 mb-0"> 
			<div class="alert alert-warning">
				<h6 class="alert-heading fw-bold mb-1">정말 계정을 삭제하시겠습니까?</h6>
				<p class="mb-0">한 번 계정을 삭제하면 되돌릴 수 없습니다. 신중히 결정해 주세요.</p>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/mypage/deleteMember" id="formAccountDeactivation" method="post">
			<div class="form-check mb-3">
				<input class="form-check-input" type="checkbox"
					name="accountActivation" id="accountActivation" />
				<label class="form-check-label" for="accountActivation">계정을 비활성화하는데 동의합니다.</label>
			</div>
			<button type="submit" class="btn btn-danger deactivate-account">계정삭제</button>
		</form>
	</div>
</div>

<script type="text/javascript">
function updateSubmit() {
	const f=document.updateForm;
	let check=f.passwordCheck.value;
	console.log(check);
	console.log('${dto.pwd}');
	if(check=='${dto.pwd}') {
		f.submit();
	} else {
		console.log('패스워드가 불일치합니다');
		alert('패스워드가 불일치합니다');
		return false;
	}
}

$(document).ready(function() {
    let img = "${dto.photo}";
    let originalValues = {
        userId: "${dto.userId}",
        userName: "${dto.userName}",
        pwd: "${dto.pwd}",
        nickName: "${dto.nickName}",
        tel: "${dto.tel}",
        content: "${dto.content}",
        birth: "${dto.birth}",
        gender: "${dto.gender}"
    };

    if (img) {
        console.log("Image found:", img);
        $('.profile-photo').attr('src', '${pageContext.request.contextPath}/uploads/mypage/' + img);
    } else {
        console.log("No image found, setting default.");
        $('.profile-photo').attr('src', '${pageContext.request.contextPath}/resources/images/profile_image_default.png');
    }

    $(".write-form input[name=photoFile]").change(function() {
        let file = this.files[0];
        if (!file) {
            let img2;
            if (img) {
                img2 = "${pageContext.request.contextPath}/uploads/mypage/" + img;
            } else {
                img2 = "${pageContext.request.contextPath}/resources/images/profile_image_default.png";
            }
            $('.profile-photo').attr('src', img2);
            console.log("No file selected, resetting image.");
            return false;
        }

        if (!file.type.match("image.*")) {
            this.focus();
            console.log("Invalid file type:", file.type);
            return false;
        }

        let reader = new FileReader();
        reader.onload = function(e) {
            $('.profile-photo').attr('src', e.target.result);
            console.log("File selected, updating image.");
        }
        reader.readAsDataURL(file);
    });    
    
    // RESET 버튼 클릭 시 폼 초기화
    $(".account-image-reset").click(function() {
        console.log("Reset button clicked.");

        // 이미지 초기화
        if (img) {
            $('.profile-photo').attr('src', '${pageContext.request.contextPath}/uploads/mypage/' + img);
            console.log("Resetting to original image:", img);
        } else {
            $('.profile-photo').attr('src', '${pageContext.request.contextPath}/resources/images/profile_image_default.png');
            console.log("Resetting to default image.");
        }

        // 폼의 모든 입력 값 초기화
        $("#formAccountSettings")[0].reset();
        console.log("Form reset.");

        // 수동으로 폼 필드 값 초기화
        $('#Id').val(originalValues.userId);
        $('#Name').val(originalValues.userName);
        $('#password').val(originalValues.pwd);
        $('#nickName').val(originalValues.nickName);
        $('#phoneNumber').val(originalValues.tel);
        $('#content').val(originalValues.content);
        $('#birth').val(originalValues.birth);
        $('#gender').val(originalValues.gender).trigger('change');
        console.log("Form fields manually reset to original values.");
    });
});
</script>

