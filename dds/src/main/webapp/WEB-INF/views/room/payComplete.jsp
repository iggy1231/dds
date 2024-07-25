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

ul.payment-info li span {
  font-weight: 500;
  font-size: 1rem;
}

ul.payment-info li span.total {
  font-size: 1.25rem;
}
</style>

<div class="container py-5 d-flex justify-content-center">
  <div class="border border-1 rounded p-3" style="max-width: 900px; width: 100%;">
    <h4 style="font-weight: 700;" class="pb-0 text-center">✅ 결제가 완료 되었습니다.</h4>
    <h5 style="font-weight: 700;" class="pb-0 text-center">${dto.subject}</h5>
    <div class="text-center">
      <button class="btn btn-primary rounded mt-3"  >메인으로 돌아가기</button>
    </div>
  </div>
</div>
