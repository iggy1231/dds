<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
hr {
  border-top: 0.5px solid gray;
}

.keyword-btn {
  font-size: 17.5px !important;
  font-weight: 500 !important;
}
.filter-box {
  width: 100%;
}


.text-primary {
  color: #18A8F1 !important;
}

td {
	padding-bottom: 3px;
}

ul.payment-info {
  list-style-type: none;
  padding: 0;
}

ul.payment-info li {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}
</style>

<div class="container py-5 d-flex justify-content-center" style="margin-top: 50px;">
  <div class="border border-1 rounded p-3" style="max-width: 800px; width: 100%;">
    <img src="${pageContext.request.contextPath}/resources/images/check.png" class="mx-auto d-block m-2 mb-4 mt-3" style="width: 80px;">
    <h4 style="font-weight: 700;" class="pb-3 text-center">결제가 완료 되었습니다.</h4>
    <ul class="payment-info">
        <li class="px-4 py-2">
          <span class="fs-6 fw-medium">객실 가격(1박)</span>
          <span class="fs-6 fw-medium">${total_price}원</span>
        </li>
        <li class="px-4 py-2">
          <span class="fs-6 fw-medium">결제카드</span>
          <span class="fs-6 fw-medium">${card_name}</span>
        </li>
        <hr class="pb-2 m-3">
        <li class="px-4 py-2">
          <span class="fs-4 fw-semibold">총 결제 금액</span>
          <span class="fs-4 fw-semibold" style="color: #f45858;">${final_price}원</span>
        </li>
      </ul>
    <div class="text-center">
      <button class="btn btn-primary rounded mt-3 px-4 py-2 fw-medium" onclick="location.href='${pageContext.request.contextPath}/'">메인으로 돌아가기</button>
    </div>
  </div>
</div>
