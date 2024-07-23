<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="card mb-4">
	<h5 class="card-header">프로필 상세</h5>
	<!-- Account -->
	
		<form action="${pageContext.request.contextPath}/mypage/profileUpdate" id="formAccountSettings" method="POST" enctype="multipart/form-data" class="write-form">
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
				<div class="mb-3 col-md-6">
					<label for="content" class="form-label mb-1 mt-2">자기소개</label> <input
							class="form-control" type="text" id="content" name="content"
							value="${dto.content}"/>
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
					<label for="passwordCheck" class="form-label">패스워드 확인</label> <input
						type="text" class="form-control" id="passwordCheck" name="passwordCheck"
						placeholder="패스워드를 입력하세요" />
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
			</div>
			<div class="mt-2">
				<button type="submit" class="btn btn-primary me-2">저장</button>
				<button type="reset" class="btn btn-outline-secondary">수정취소</button>
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
$(function() {

	let img = "${dto.photo}";
	if(img) {
		$('.profile-photo').attr('src', '${pageContext.request.contextPath}/uploads/mypage/'+img);
	} else {
		$('.profile-photo').attr('src', '${pageContext.request.contextPath}/resources/images/profile_image_default.png');
	}
	
	$(".write-form input[name=photoFile]").change(function(){
		let file = this.files[0];
		if(! file) {
			
			let img2;
			if( img ) {
				img2 = "${pageContext.request.contextPath}/uploads/mypage/" + img;
			} else {
				img2 = "${pageContext.request.contextPath}/resources/images/profile_image_default.png";
			}
			$('.profile-photo').attr('src', img2);
			
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$('.profile-photo').attr('src', e.target.result);
		}
		reader.readAsDataURL(file);
	});
});
</script>
