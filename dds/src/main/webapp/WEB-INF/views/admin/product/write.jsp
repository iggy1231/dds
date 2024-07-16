<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Content wrapper -->
<div class="content-wrapper">
            <!-- Content -->
            <div class="container mt-5 ">
	<div class="body-container">
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 상품관리 </h3>
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
										<option value="">:: 메인 카테고리 선택 ::</option>
										<c:forEach var="vo" items="${listCategory}">
											<option value="${vo.categoryNum}" ${parentNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-6 ps-1">
									<select name="categoryNum" class="form-select">
										<option value="">:: 카테고리 선택 ::</option>
										<c:forEach var="vo" items="${listSubCategory}">
											<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected":""}>${vo.categoryName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품명</td>
						<td>
							<input type="text" name="productName" class="form-control" value="${dto.productName}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품구분</td>
						<td>
							<div class="row">
								<div class="col-6">
									<select name="classify" class="form-select">
										<option value="100" ${classify==100?"selected":""}>일반상품</option>
										<option value="200" ${classify==200?"selected":""}>특가상품</option>
										<option value="300" ${classify==300?"selected":""}>기획상품</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품가격</td>
						<td>
							<input type="text" name="price" class="form-control" value="${dto.price}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">할인율</td>
						<td>
							<input type="text" name="discountRate" class="form-control" value="${dto.discountRate}">
							<small class="form-control-plaintext help-block">할인율이 0인 경우 상품가격이 판매가격입니다.</small>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">적립금</td>
						<td>
							<input type="text" name="savedMoney" class="form-control" value="${dto.savedMoney}">
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">배송비</td>
						<td>
							<input type="text" name="delivery" class="form-control" value="${dto.delivery}">
							<small class="form-control-plaintext help-block">배송비가 0인 경우 무료 배송입니다.</small>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품 옵션</td>
						<td>
							<div class="row">
								<div class="col-6">
									<select name="optionCount" class="form-select">
										<option value="2" ${dto.optionCount==2?'selected':''}>옵션 둘</option>
										<option value="1" ${dto.optionCount==1?'selected':''}>옵션 하나</option>
										<option value="0" ${dto.optionCount==0?'selected':''}>옵션 없음</option>
									</select>
								</div>
							</div>
							<small class="form-control-plaintext help-block">상품 재고가 존재하면 옵션 변경은 불가능합니다.</small>
						</td>
					</tr>
					<tr class="product-option-1">
						<td class="table-light col-sm-2">옵션 1</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName" class="form-control" style="width: 250px;" placeholder="옵션명" value="${dto.optionName}">
								<c:if test="${mode=='update'}">
									<input type="hidden" name="optionNum" value="${empty dto.optionNum ? 0 : dto.optionNum}">
								</c:if>
							</div>
							<div class="row option-area">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area">
									<c:forEach var="vo" items="${listOptionDetail}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
											<input type="hidden" name="detailNums" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail || listOptionDetail.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>
					<tr class="product-option-2">
						<td class="table-light col-sm-2">옵션 2</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName2" style="width: 250px;" class="form-control" placeholder="옵션명" value="${dto.optionName2}">
								<c:if test="${mode=='update'}">
									<input type="hidden" name="optionNum2" value="${empty dto.optionNum2 ? 0 : dto.optionNum2}">
								</c:if>
							</div>
							<div class="row option-area2">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area2">
									<c:forEach var="vo" items="${listOptionDetail2}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' value="${vo.optionValue}">
											<input type="hidden" name="detailNums2" value="${vo.detailNum}">
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>
										</div>
									</c:forEach>
									<c:if test="${empty listOptionDetail2 || listOptionDetail2.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값'>
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd2">추가</button>
								</div>
							</div>
							<small class="form-control-plaintext help-block">판매 상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
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
						<td class="table-light col-sm-2">상품설명</td>
						<td>
							<textarea name="content" id="ir1" class="form-control" style="max-width: 95%; height: 290px;">${dto.content}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class="table-light col-sm-2">대표이미지</td>
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
