<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="vo" items="${listAllCategory}">
	<tr>
		<td> <input type="text" name="category" class="form-control" disabled value="${vo.category}"> </td>
		<td>
			<select name="enabled" class="form-select" disabled>
				<option value="1" ${vo.enabled==1?"selected":"" }>활성</option>
				<option value="0" ${vo.enabled==0?"selected":"" }>비활성</option>
			</select>
		</td>
		<td> <input type="text" name="orderNo" class="form-control" disabled value="${vo.orderNo}"> </td>
		<td>
			<input type="hidden" name="categoryNum" value="${vo.categoryNum}">
			<span class="btnSpanIcon btnCategoryUpdate" title="수정"><i class="fa-regular fa-pen-to-square"></i></span>&nbsp;
			<span class="btnSpanIcon btnCategoryDeleteOk" title="삭제"><i class="fa-solid fa-trash-can"></i></span>
			<span class="btnSpanIcon btnCategoryUpdateOk" title="수정완료" style="display: none;"><i class="fa-solid fa-check"></i></span>&nbsp;
			<span class="btnSpanIcon btnCategoryUpdateCancel" title="수정취소" style="display: none;"><i class="fa-solid fa-arrow-rotate-left"></i></span>
		</td>
	</tr>
</c:forEach>

