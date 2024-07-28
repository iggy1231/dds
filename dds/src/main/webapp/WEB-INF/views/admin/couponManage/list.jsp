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
						<tr class="table-primary">
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
							<td colspan="6">
								${paging}
							</td>
						</tr>
						<tr>
							<td colspan="6" class="text-center">
								<button class="btn" onclick="writeForm();">쿠폰 코드 생성</button>
								<button class="btn" onclick="updateForm();" data-bs-toggle="modal" data-bs-target="#inputModal">쿠폰 코드 수정</button>
								<button class="btn" onclick="deleteForm();" data-bs-toggle="modal" data-bs-target="#inputModal">쿠폰 코드 삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
    	        	<div>쿠폰 기록 확인</div>
				</div>
				<table class="table">
					<thead>
						<tr class="table-primary">
							<td>쿠폰번호</td>
							<td>회원이름</td>
							<td>상태</td>
							<td>등록일</td>
						</tr>
					</thead>
					<tbody id="CouponHistoryList" data-pageNo="0" data-totalPage="0">
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
         $(function(){
        	 CouponHistoryList(1); 
         });
         
         function ajaxFun(url, method, formData, dataType, fn, file = false) {
        		const settings = {
        				type: method, 
        				data: formData,
        				success:function(data) {
        					fn(data);
        				},
        				beforeSend: function(jqXHR) {
        					jqXHR.setRequestHeader('AJAX', true);
        				},
        				complete: function () {
        				},
        				error: function(jqXHR) {
        					if(jqXHR.status === 403) {
        						return false;
        					} else if(jqXHR.status === 400) {
        						alert('요청 처리가 실패 했습니다.');
        						return false;
        			    	}
        			    	
        					console.log(jqXHR.responseText);
        				}
        		};
        		
        		if(file) {
        			settings.processData = false;
        			settings.contentType = false;
        		}
        		$.ajax(url, settings);
        	}
         
         	function CouponHistoryList(page) {
         		let url="${pageContext.request.contextPath}/admin/couponManage/historyList";
         		let query="pageNo="+page;
         		
         		const fn = function(data) {
         			nextPage(data);
         		};
         		
         		ajaxFun(url, "get", query, "json", fn);
         	}
         	
         	function nextPage(data) {
         		$('#CouponHistoryList').html('');
         		
         		let pageNo = data.pageNo;
         		let total_page = data.total_page;
         		
         		$('#CouponHistoryList').attr('data-pageNo', pageNo);
         		$('#CouponHistoryList').attr('data-totalPage', total_page);

         		let htmlText="";
         		
         		for(let item of data.list) {
         			htmlText+='<tr>';
         			htmlText+='	<td>'+item.num+'</td>';
         			htmlText+='	<td>'+item.nickname+'</td>';
         			switch (item.use_state) {
						case "1": htmlText+='	<td>사용가능</td>'; break;
						case "0": htmlText+='	<td>사용불가</td>'; break;
					}
         			htmlText+='	<td>'+item.reg_date+'</td>';
         			htmlText+='</tr>';
         		}
         		
         		htmlText+='<tr><td colspan="4">'+data.paging+'</td></tr>';
         		$('#CouponHistoryList').append(htmlText);
         	}
         	
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