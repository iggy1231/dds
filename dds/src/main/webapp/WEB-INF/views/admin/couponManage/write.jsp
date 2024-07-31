<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<style>
	.accordion-body input {
	width: 100%
}

/* 버튼 기본 스타일 */
.btn {
    background-color: #ffffff; /* 기본 배경색: 하얀색 */
    color: #000000; /* 기본 텍스트 색상: 검정색 */
    border-radius: 8px; /* 테두리 둥글게 */
    padding: 10px 20px; /* 버튼 여백 */
    cursor: pointer; /* 커서 포인터 */
    transition: background-color 0.3s, color 0.3s; /* 색상 전환 애니메이션 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 박스 그림자 */
}

/* 버튼 클릭 시 스타일 */
.btn:active {
    background-color: #696cff; /* 클릭 시 배경색: primary 색상 */
    color: #ffffff; /* 클릭 시 텍스트 색상: 하얀색 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 클릭 시 박스 그림자 변경 */
}

/* 버튼 hover 시 스타일 */
.btn:hover {
    background-color: #696cff;
    color: #ffffff;
}
</style>
<!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            	<div class="row fw-semibold fs-3 text-primary">
    	        	<div>쿠폰 코드 생성</div>
				</div>
				<div class="card">
				<form name="couponManageForm" action="${pageContext.request.contextPath}/admin/couponManage/${mode}" method="post" enctype="multipart/form-data">
				<input type="hidden" name="num" value="${dto.num}">
				<div class="accordion" id="accordionPanelsStayOpenExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
				        쿠폰 이름을 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
				      <div class="accordion-body">
				        <input type="text" name="name" value="${dto.name}">
				        </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
				        쿠폰 내용을 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">
				      <div class="accordion-body">
				        <input type="text" name="content" value="${dto.content}">
				        </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
				        쿠폰 코드를 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">
				      <div class="accordion-body">
				        <input type="text" name="code" value="${dto.code}">
				        </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
				        할인율을 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse">
				      <div class="accordion-body">
				        <input type="number" name="rate_discount" value="${dto.rate_discount}">
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
				        시작일과 만료일을 입력하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse">
				      <div class="accordion-body">
				        <input type="date" name="issue_date" value="${dto.issue_date}">
						<input type="date" name="expiry_date" value="${dto.expiry_date}">
				      </div>
				    </div>
				  </div>
				  	<div class="accordion-item">
				    <h2 class="accordion-header">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="panelsStayOpen-collapseSix" aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">
				        쿠폰 이미지를 선택하세요
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseSix" class="accordion-collapse collapse">
				      <div class="accordion-body">
				        <input type="file" accept="image/*" name="coupon_image">
				      </div>
				    </div>
				  </div>
				  <div class="text-center mb-3">
				  	<button class="btn btn-outlint-secondary" type="button" onclick="submit();">${mode=="update"?"쿠폰 코드 수정":"쿠폰 코드 생성"}</button>
				  	<button class="btn btn-outlint-secondary" type="button" onclick="cancel();">${mode=="update"?"쿠폰 수정 취소":"쿠폰 생성 취소"}</button>
				  </div>
				</div>
				</form>
				</div>
            </div>
          </div>
          <script type="text/javascript">
          	function submit() {
          		f=document.couponManageForm;
          		f.submit;
          	}
          	
          	function cancel() {
          		location.href="${pageContext.request.contextPath}/admin/couponManage/list";
          	}
          </script>