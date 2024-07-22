<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card mb-4">
	<h5 class="card-header">프로필 상세</h5>
	<!-- Account -->
	<div class="card-body">
		<div class="d-flex align-items-start align-items-sm-center gap-4">
			<img src="${pageContext.request.contextPath}/resources/images/profile-image.png" alt="user-avatar"
				class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
			<div class="button-wrapper">
				<label for="upload" class="btn btn-primary me-2 mb-0" tabindex="0">
					<span class="d-none d-sm-block">사진 Upload</span> <i
					class="bx bx-upload d-block d-sm-none"></i> <input type="file"
					id="upload" class="account-file-input" hidden accept="image/png, image/jpeg" />
				</label>
				<button type="button"
					class="btn btn-outline-secondary account-image-reset mb-0">
					<i class="bx bx-reset d-block d-sm-none"></i> <span
						class="d-none d-sm-block">Reset</span>
				</button>
				<div class="mb-3 col-md-6">
					<label for="self-introduction" class="form-label mb-1 mt-2">자기소개</label> <input
							class="form-control" type="text" id="self-introduction" name="self-introduction"
							value="안녕하세요"/>
				</div>
			</div>
		</div>
	</div>
	<hr class="my-0" />
	<div class="card-body">
		<form id="formAccountSettings" method="POST" onsubmit="return false">
			<div class="row">
				<div class="mb-3 col-md-6">
					<label for="Id" class="form-label">아이디</label> <input
						class="form-control" type="text" id="Id" name="Id"
						value="dodoongsil" autofocus />
				</div>
				<div class="mb-3 col-md-6">
					<label for="Name" class="form-label">이름</label> <input
						class="form-control" type="text" name="Name" id="Name"
						value="두둥실" />
				</div>
				<div class="mb-3 col-md-6">
					<label for="password" class="form-label">패스워드</label> <input
						class="form-control" type="text" id="password" name="password"
						value="john.doe@example.com" placeholder="john.doe@example.com" />
				</div>
				<div class="mb-3 col-md-6">
					<label for="nickName" class="form-label">닉네임</label> <input
						type="text" class="form-control" id="nickName"
						name="nickName" value="ThemeSelection" />
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
							id="phoneNumber" name="phoneNumber" class="form-control"
							placeholder="010 1234 5678" />
					</div>
				</div>
				<div class="mb-3 col-md-6">
					<label for="gender" class="form-label">성별</label> <select
						id="gender" class="select2 form-select">
						<option value="female">여성</option>
						<option value="male">남성</option>
						<option value="x">제 3의 성</option>
					</select>
				</div>
				<div class="mb-3 col-md-6">
					<label for="birth" class="form-label">생년월일</label> <input
						class="form-control" type="date" id="birth" name="birth"
						placeholder="생년월일" />
				</div>
			</div>
			<div class="mt-2">
				<button type="submit" class="btn btn-primary me-2">저장</button>
				<button type="reset" class="btn btn-outline-secondary">수정취소</button>
			</div>
		</form>
	</div>
	<!-- /Account -->
</div>
<div class="card">
	<h5 class="card-header">계정삭제</h5>
	<div class="card-body">
		<div class="mb-3 col-12 mb-0"> 
			<div class="alert alert-warning">
				<h6 class="alert-heading fw-bold mb-1">정말 계정을 삭제하시겠습니까?</h6>
				<p class="mb-0">한 번 계정을 삭제하면 되돌릴 수 없습니다. 신중히 결정해 주세요.</p>
			</div>
		</div>
		<form id="formAccountDeactivation" onsubmit="return false">
			<div class="form-check mb-3">
				<input class="form-check-input" type="checkbox"
					name="accountActivation" id="accountActivation" />
				<label class="form-check-label" for="accountActivation">계정을 비활성화하는데 동의합니다.</label>
			</div>
			<button type="submit" class="btn btn-danger deactivate-account">계정삭제</button>
		</form>
	</div>
</div>

