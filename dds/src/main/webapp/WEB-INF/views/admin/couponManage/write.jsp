<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
          
<!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            	<div class="row">
    	        	<div>쿠폰 코드 생성</div>
				</div>
				<form name="couponManageForm" action="${pageContext.request.contextPath}/admin/couponManage/${mode}" method="post" enctype="multipart/form-data">
					<input type="hidden" name="num" value="${dto.num}">
					<input type="text" name="name" value="${dto.name}">
					<input type="text" name="content" value="${dto.content}">
					<input type="text" name="code" value="${dto.code}">
					<input type="number" name="rate_discount" value="${dto.rate_discount}">
					<input type="date" name="issue_date" value="${dto.issue_date}">
					<input type="date" name="expiry_date" value="${dto.expiry_date}">
					<input type="file" accept="image/*" name="coupon_image">
					<button type="button" onclick="submit();">${mode=="update"?"쿠폰 코드 수정":"쿠폰 코드 생성"}</button>
				</form>
            </div>
          </div>
          <script type="text/javascript">
          	function submit() {
          		f=document.couponManageForm;
          		f.submit;
          	}
          </script>