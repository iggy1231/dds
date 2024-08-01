<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">

.btn {
	border: 1px solid #696cff;
	border-radius: 8px; 
	color: #696cff;
	background: white;
	
} 

.btn:hover {
	border: 1px solid #696cff;
	background: #696cff;  
	color: white;
}

.btn3 {
	border: 1px solid #696cff;
	background: #696cff;  
	color: white;
	border-radius: 8px; 
	padding: 0.4375rem 1.25rem;
}

.table-category {
	border-spacing: 1px;
	background: #999;
	width: 100%;
}
.table-category thead>tr {
	text-align: center;
	background: #f8f9fa;
}
.table-category thead tr>th {
	color:  #787878;
	padding: 10px 0;
}

.table-category tbody>tr, .table-category tfoot>tr {
	text-align: center;
	background: #fff;
	height: 30px;
}

.table-category input {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	box-sizing: border-box;
}
.table-category button {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category input[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.table-category select {
	border:1px solid #ccc;
	padding:3px 5px 3px;
	background-color:#fff;
	width:100%;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
	box-sizing: border-box;
}
.table-category select[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.btnCategoryAddOk, .btnSpanIcon {
	cursor: pointer;
}

.text-primary {
	color: #696cff !important;
}

.table-category th {
        background-color: rgba(105, 108, 255, 0.16); /* 헤더 배경색 */ /* 수정된 부분 */
        color: white; /* 텍스트 색상 */ /* 수정된 부분 */
    }
    .btnCategoryAddOk {
        background-color: #696cff; /* 버튼 배경색 */ /* 수정된 부분 */
        color: #5a5cbf; /* 버튼 텍스트 색상 */ /* 수정된 부분 */
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer; 
    }
    .btnCategoryAddOk:hover {
        background-color: #5a5cbf;
        color: white;
    }
</style>

<script type="text/javascript">
function sendOk() {
    const f = document.faqForm;
    if(! f.categoryNum.value) {
        alert("카테고리를 선택하세요. ");
        f.categoryNum.focus();
        return;
    }
    
	let str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
    f.action="${pageContext.request.contextPath}/admin/faqManage/${mode}";
    f.submit();
}
</script>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
    
    <div class="card">
    	<div class="card-header">
		<div> 
			<h2 style="color: #696cff; font-weight: bold;"> 자주하는 질문 </h2>
    	</div>
		<form name="faqForm" method="post">
			<table class="table table-border border-top2 table-formm">  
				<tr style="border-top: 2px solid black;"> 
					<td style="background: rgba(105, 108, 255, 0.16); text-align: center; width: 250px;">카테고리</td>
					<td>
						<div style="display: flex; align-items: center; gap: 10px;">
						<select name="categoryNum" class="form-select" style="width: 150px;">
							<c:forEach var="vo" items="${listCategory}">
								<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected":""}>${vo.category}</option>
							</c:forEach>
						</select>
						<button type="button" class="btn btnCategoryDialog"> 변경 </button>
						</div>
					</td>
				</tr>
			
				<tr> 
					<td style="background: rgba(105, 108, 255, 0.16); text-align: center; width: 250px; border-top: 2px solid #d5d5d5;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td> 
						<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
					</td>
				</tr>
			
				<tr>
					<td style="background: rgba(105, 108, 255, 0.16); text-align: center; width: 250px; border-top: 2px solid #d5d5d5;">작성자</td>
					<td> 
						${sessionScope.member.userName} 
					</td>
				</tr>
			
				<tr> 
					<td valign="top" style="background: rgba(105, 108, 255, 0.16); text-align: center; width: 250px; line-height: 60px; border-top: 2px solid #d5d5d5;">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td valign="top"> 
						<textarea name="content" class="form-control">${dto.content}</textarea>
					</td>
				</tr>
			</table>
			
			<table class="table">
				<tr>
					<td align="center">
						<button type="button" class="btn3" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/faqManage/main?pageNo=${pageNo}';">${mode=='update'?'수정취소':'등록취소'}</button>
						<c:if test="${mode=='update'}">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="pageNo" value="${pageNo}">
						</c:if>
					</td>
				</tr>
			</table>
		</form>
		
		<div id="category-dialog" style="display: none;">
			<form name="categoryForm" method="post">
				<table class="table-category">
					<thead>
						<tr> 
							<th width="170">카테고리</th>
							<th width="90">활성</th>
							<th width="80">출력순서</th>
							<th>변경</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center" height="30" bgcolor="#fff">
							<td> <input type="text" name="category"> </td>
							<td>
								<select name="enabled">
									<option value="1">활성</option>
									<option value="0">비활성</option>
								</select>
							</td>
							<td> <input type="text" name="orderNo"> </td>
							<td> <button type="button" class="btnCategoryAddOk">등록하기</button> </td>
						</tr>
					</tbody>
					<tfoot class="category-list"></tfoot>
				</table>
			</form>
		</div>
		</div>
	</div>
    	</div>
</div>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

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
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

$(function(){
	// 카테고리 수정 대화상자
	$(".table-formm").on("click", ".btnCategoryDialog", function(){
		$("form[name=categoryForm]").each(function(){
			this.reset();
		}); 
		
		$("#category-dialog").dialog({
			  modal: true,
			  height: 500,
			  width: 500,
			  title: '카테고리 수정',
			  open : function(){
				let url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
				$(".category-list").load(url);  
			  },
			  close: function(event, ui) {
				  $("form[name=faqForm] select[name=categoryNum]").find('option').remove();
				  
				  let url = "${pageContext.request.contextPath}/admin/faqManage/listCategory";
				  let query = "mode=enabled";

				  const fn = function(data) {
						$.each(data.listCategory, function(index, item){
							let categoryNum = item.categoryNum;
							let category = item.category;
							let s = "<option value='"+categoryNum+"'>"+category+"</option>";
							$("form[name=faqForm] select[name=categoryNum]").append(s);
						});
						
						let mode = "${mode}";
						if(mode === "update") {
							$("form[name=faqForm] select[name=categoryNum]").val("${dto.categoryNum}");
						}
				  };
				  ajaxFun(url, "get", query, "json", fn);

			  }
		});
	});
	// $('.category-dialog').dialog("close"); // 창종료

	// 카테고리 등록
	$("#category-dialog").on("click", ".btnCategoryAddOk", function(){	
		const $tr = $(this).closest("tr");
		let category = $tr.find("input[name=category]").val().trim();
		let enabled = $tr.find("select[name=enabled]").val().trim();
		let orderNo = $tr.find("input[name=orderNo]").val().trim();
		
		if(! category) {
			$tr.find("input[name=category]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)) {
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		category = encodeURIComponent(category);
		let url = "${pageContext.request.contextPath}/admin/faqManage/insertCategory";
		let query = "category="+category+"&enabled="+enabled+"&orderNo="+orderNo;
		
		const fn = function(data){
			// let state = data.state;
			$("form[name=categoryForm]").each(function(){
				this.reset();
			});
			
			url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});

	// 카테고리 수정
	$(".category-list").on("click", ".btnCategoryUpdate", function(){	
		const $tr = $(this).closest("tr");
		$tr.find("input").prop("disabled", false);
		$tr.find("select").prop("disabled", false);
		
		$tr.find(".btnCategoryUpdate").hide();
		$tr.find(".btnCategoryDeleteOk").hide();

		$tr.find(".btnCategoryUpdateOk").show();
		$tr.find(".btnCategoryUpdateCancel").show();
	});

	// 카테고리 수정 완료
	$(".category-list").on("click", ".btnCategoryUpdateOk", function(){	
		const $tr = $(this).closest("tr");
		let categoryNum = $tr.find("input[name=categoryNum]").val();
		let category = $tr.find("input[name=category]").val().trim();
		let enabled = $tr.find("select[name=enabled]").val().trim();
		let orderNo = $tr.find("input[name=orderNo]").val().trim();
		
		if(! category) {
			$tr.find("input[name=category]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)) {
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		category = encodeURIComponent(category);
		let url = "${pageContext.request.contextPath}/admin/faqManage/updateCategory";
		let query = "categoryNum="+categoryNum+"&category="+category+"&enabled="+enabled+"&orderNo="+orderNo;
		const fn = function(data){
			let state = data.state;
			if(state === "false") {
				alert("카테고리 삭제가 불가능합니다.");
				return false;
			}
			
			url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});

	// 카테고리 수정 취소
	$(".category-list").on("click", ".btnCategoryUpdateCancel", function(){	
		const $tr = $(this).closest("tr");
		$tr.find("input").prop("disabled", true);
		$tr.find("select").prop("disabled", true);
		
		$tr.find(".btnCategoryUpdateOk").hide();
		$tr.find(".btnCategoryUpdateCancel").hide();

		$tr.find(".btnCategoryUpdate").show();
		$tr.find(".btnCategoryDeleteOk").show();
	});

	// 카테고리 삭제
	$(".category-list").on("click", ".btnCategoryDeleteOk", function(){
		if(! confirm("카테고리를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		const $tr = $(this).closest("tr");
		let categoryNum = $tr.find("input[name=categoryNum]").val();
		
		let url = "${pageContext.request.contextPath}/admin/faqManage/deleteCategory";
		let query = "categoryNum="+categoryNum;
		
		const fn = function(data){
			url = "${pageContext.request.contextPath}/admin/faqManage/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});
</script>
