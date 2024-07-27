<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
          
<!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            	<div class="row">
    	        	<div>쿠폰 코드 확인</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<td>번호</td>
							<td>이름</td>
							<td>내용</td>
							<td>시작일</td>
							<td>만료일</td>
							<td>승인</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.num}</td>
								<td>${dto.name}</td>
								<td>${dto.content} + ${dto.rate_discount}%</td>
								<td>${dto.issue_date}</td>
								<td>${dto.expiry_date}</td>
								<td>${dto.nickname}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5">
								${paging}
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<button class="btn" onclick="writeForm();">쿠폰 코드 생성</button>
								<button class="btn" onclick="updateForm();" data-bs-toggle="modal" data-bs-target="#inputModal">쿠폰 코드 수정</button>
								<button class="btn" onclick="deleteForm();" data-bs-toggle="modal" data-bs-target="#inputModal">쿠폰 코드 삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
            </div>
          </div>
          <div class="modal fade" id="inputModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
		      </div>
		      <div class="modal-body">
				<form name="couponManageForm" action="#" method="post">
		        	<input type="text" name="num" placeholder="쿠폰 번호를 입력하세요" required>
		        </form>
			  </div>  
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="submit();">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
         <Script type="text/javascript">
         	function writeForm() {
         		location.href="${pageContext.request.contextPath}/admin/couponManage/write"
         	}
         	
         	function updateForm() {
         		$('#inputModal .modal-title').text("쿠폰 코드 수정");
         		
         		const f=document.couponManageForm;
         		f.action="${pageContext.request.contextPath}/admin/couponManage/updateForm";
         	}
         	
         	function deleteForm() {
         		$('#inputModal .modal-title').text("쿠폰 코드 삭제");
         		
         		const f=document.couponManageForm;
         		f.action="${pageContext.request.contextPath}/admin/couponManage/delete";
         	}
         	
         	function submit() {
         		const f=document.couponManageForm;
         		
         		f.submit();
         	}
         </Script>