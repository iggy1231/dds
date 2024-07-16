<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.form-control.address {
	display: inline;
    width: 50%;
}

.form-control.address1 {
	display: inline;
    width: 70%;
}

.form-control.address2 {
	display: inline;
    width: 35%;
}


</style>

<!-- Content wrapper -->
<div class="content-wrapper">
            <!-- Content -->
            <div class="container mt-5 ">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 숙소 상품관리 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="productForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 table-form">
					<tr>
						<td class="table-light col-sm-2">카테고리</td>
						<td>
							<div class="row">
								<div class="col-6 pe-1">
									<select name="parentNum" class="form-select">
										<option value="">:: 숙소 카테고리 선택 ::</option>
											<option value="pension">펜션</option>
											<option value="camping">캠핑/글램핑</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품명</td>
						<td>
							<input type="text" name="productName" class="form-control" value="">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">키워드 선택</td>
						<td>
							<input type="checkbox" value="1" class="ms-1"> 가족여행
							<input type="checkbox" value="2" class="ms-1"> 힙한감성
							<input type="checkbox" value="3" class="ms-1"> 연인끼리
							<input type="checkbox" value="4" class="ms-1"> 뷰맛집
							<input type="checkbox" value="5" class="ms-1"> 감성숙소
							<input type="checkbox" value="6" class="ms-1"> 친구와함께
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">시설 선택</td>
						<td>
							<input type="checkbox" value="1" class="ms-1"> 사우나
							<input type="checkbox" value="2" class="ms-1"> 취사가능
							<input type="checkbox" value="2" class="ms-1"> 바베큐
							<input type="checkbox" value="3" class="ms-1"> 수영장
							<input type="checkbox" value="4" class="ms-1"> 노래방
							<input type="checkbox" value="5" class="ms-1"> 스파
							<input type="checkbox" value="6" class="ms-1"> 피트니스
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">숙소 주소</td>
						<td>
							<input type="text" id="sample6_postcode" placeholder="우편번호" class="my-1 form-control address">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="my-1  btn btn-light "><br>
							<input type="text" id="sample6_address" placeholder="주소" class="my-1  form-control address1"><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="my-1  form-control address2">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="my-1  form-control address2">
						</td>
					</tr>
	<tr class="product-option-1">
    <td class="table-light col-sm-2">객실 옵션</td>
    <td>
        <table class="table mb-2 option-table">
            <tr>
                <td>객실/구역명</td>
                <td><input type="text" name="optionName" class="form-control" placeholder="객실/구역명" value=""></td>
            </tr>
            <tr>
                <td>최대 인원수</td>
                <td><input type="text" name="optionPeople" class="form-control" placeholder="최대 인원수" value=""></td>
            </tr>
            <tr>
                <td>옵션가격</td>
                <td><input type="text" name="optionPrice" class="form-control" placeholder="옵션 가격" value=""></td>
            </tr>
            <tr>
                <td>상세설명</td>
                <td><input type="text" name="optionContent" class="form-control" placeholder="옵션 상세 설명" value=""></td>
            </tr>
            <tr>
                <td>객실/구역 썸네일</td>
                <td><input type="file" name="optionContent" class="form-control" placeholder="객실/구역 썸네일" value=""></td>
            </tr>
            <tr>
				<td>할인율</td>
					<td>
						<input type="text" name="discountRate" class="form-control" value="${dto.discountRate}">
					</td>
			</tr>
			<tr>
						<td>포인트</td>
						<td>
							<input type="text" name="point" class="form-control" value="point" readonly>
						</td>
					</tr>
			
        </table>
    </td>
</tr>
<tr id="addOptionRow">
           <td colspan="2" class="text-center"><button type="button" id="addOptionBtn" class="btn btn-primary">+ 옵션 추가하기</button></td>
</tr>
					
					
					
					<tr>
						<td class="table-light col-sm-2">상품 진열</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="productShow" class="form-check-input" id="productShow1" value="1" ${dto.productShow==1 ? "checked='checked'" : "" }> <label class="form-check-label" for="productShow1">상품진열</label>
								&nbsp;&nbsp;
								<input type="radio" name="productShow" class="form-check-input" id="productShow0" value="0" ${dto.productShow==0 ? "checked='checked'" : "" }> <label class="form-check-label" for="productShow0">진열안함</label>
							</div>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">상세 설명</td>
						<td>
							<textarea name="content" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">썸네일 이미지</td>
						<td>
							<div class="thumbnail-viewer"></div>
							<input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">추가이미지</td>
						<td>
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
								<c:forEach var="vo" items="${listFile}">
									<img src="${pageContext.request.contextPath}/uploads/product/${vo.filename}"
										class="item delete-img"
										data-fileNum="${vo.fileNum}"
										data-filename="${vo.filename}">
								</c:forEach>
							</div>
							<input type="file" name="addFiles" accept="image/*" multiple class="form-control" style="display: none;">
						</td>
					</tr>
					
				</table>
				
				<table class="table table-borderless">
					<tr>
						<td class="text-center">
							<c:url var="url" value="/admin/product/${classify}/main">
								<c:if test="${not empty page}">
									<c:param name="page" value="${page}"/>
								</c:if>
							</c:url>
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=="update"?"수정완료":"등록완료"}</button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${url}';">${mode=="update"?"수정취소":"등록취소"}</button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="productNum" value="${dto.productNum}">
								<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
								<input type="hidden" name="page" value="${page}">
								
								<input type="hidden" name="prevOptionNum" value="${empty dto.optionNum ? 0 : dto.optionNum}">
								<input type="hidden" name="prevOptionNum2" value="${empty dto.optionNum2 ? 0 : dto.optionNum2}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
let optionCount = 1; // 옵션 번호를 추적하는 변수

document.getElementById('addOptionBtn').addEventListener('click', function() {
    optionCount++; // 옵션 번호 증가

    const optionTable = `
        <tr class="product-option">
            <td class="table-light col-sm-2">객실 옵션 ${optionCount}</td>
            <td>
                <table class="table mb-2 option-table">
                    <tr>
                        <td>객실/구역명</td>
                        <td><input type="text" name="optionName" class="form-control" placeholder="객실/구역명" value=""></td>
                    </tr>
                    <tr>
                        <td>최대 인원수</td>
                        <td><input type="text" name="optionPeople" class="form-control" placeholder="최대 인원수" value=""></td>
                    </tr>
                    <tr>
                        <td>옵션가격</td>
                        <td><input type="text" name="optionPrice" class="form-control" placeholder="옵션 가격" value=""></td>
                    </tr>
                    <tr>
                        <td>상세설명</td>
                        <td><input type="text" name="optionContent" class="form-control" placeholder="옵션 상세 설명" value=""></td>
                    </tr>
                    <tr>
                        <td>객실/구역 썸네일</td>
                        <td><input type="file" name="optionContent" class="form-control" placeholder="객실/구역 썸네일" value=""></td>
                    </tr>
                    
                    <tr>
    					<td>할인율</td>
    						<td>
    							<input type="text" name="discountRate" class="form-control" value="${dto.discountRate}">
    						</td>
    					</tr>
    				<tr>
    						<td>포인트</td>
    						<td>
    							<input type="text" name="point" class="form-control" value="" readonly>
    						</td>
    				</tr>
                </table>
            </td>
        </tr>
    `;
    const referenceNode = document.getElementById('addOptionRow');
    referenceNode.insertAdjacentHTML('beforebegin', optionTable);
});
</script>





<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/product/"+img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=productForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=productForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".table-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/product/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

// 수정에서 등록된 추가 이미지 삭제
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let fileNum = $img.attr("data-fileNum");
		let filename = $img.attr("data-filename");
		let url="${pageContext.request.contextPath}/admin/product/deleteFile";
		$.post(url, {fileNum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});

// 추가 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".table-form .img-add", function(){
		$("form[name=productForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=productForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.productForm.addFiles.files = dt.files;
			
			return false;
		}
		
        for(let file of this.files) {
        	sel_files.push(file);
        	
            const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
            reader.onload = e => {
            	$img.attr("src", e.target.result);
            };
			reader.readAsDataURL(file);
            
            $(".img-grid").append($img);
        }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.addFiles.files = dt.files;
	});
	
	$("body").on("click", ".table-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});
</script>

<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


<!-- 스마트 에디터 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
