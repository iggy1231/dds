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

@media (min-width: 992px) {
  .col-lg-4 {
    flex: 0 0 auto;
    width: 30%; /* 오른쪽 영역 너비 조정 (30%) */
  }
  .col-lg-8 {
    width: 70%; /* 왼쪽 영역 너비 조정 (70%) */
  }
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

<div class="container px-1 py-5">
  <div class="row g-4">
    <div class="col-lg-8">
      <h4 style="font-weight: 700;" class="ps-2 pb-0">✅ 예약 확인 및 결제</h4>
      <!-- 예약자 정보 -->
      <div class="px-3 rounded row gx-4 gy-3 mb-3 pt-3">
        <h5 class="ps-2 pb-0 fw-semibold fs-5">예약자 정보</h5>
        <div class="col-12">
          <label for="name" class="form-label">예약자 이름</label>
          <input type="text" class="form-control" id="name">
        </div>
        <div class="col-12 mt-3">
          <label for="phone" class="form-label">휴대폰 번호</label>
          <input type="text" class="form-control" id="phone">
        </div>
      </div>
      
        <hr class="pb-3">
      <!-- 할인 사용 -->
      <div class="px-3 rounded row gx-4 gy-3 mb-3 pt-3">
        <h5 class="ps-2 pb-0 fw-semibold fs-5">할인 적용</h5>
        <div class="col-8">
          <label for="point" class="form-label">포인트</label>
          <input type="text" class="form-control" id="point" value="0">
        </div>
        <div class="col-4 d-flex align-items-end">
          <button class="btn btn-secondary w-100">잔액 확인</button>
        </div>
        
        <div class="col-8">
          <label for="coupon" class="form-label">쿠폰</label>
          <select class="ps-3 px-3 py-2">
          	<option class="px-3 py-2">:: 쿠폰 선택 ::</option>
          	<option class="px-3 py-2">회원가입 축하 쿠폰(10% 할인)</option>
          </select>
          <input type="text" class="form-control" id="point" value="0">
        </div>
      </div>
      
      
    </div>
<div class="col-lg-4">
  <div class="px-3 border border-1 rounded row gx-4 gy-3 mb-3">
    <h4 style="font-weight: 700;" class="ps-2 pb-0">롯데호텔 제주</h4>
    <div class="ratio ratio-4x3">
      <img src="https://yaimg.yanolja.com/v5/2021/03/29/15/6061f2a92f9b87.94225506.png" class="img-fluid rounded" alt="객실 이미지">
    </div>
    <div class="p-2 mt-2">
      <table>
        <tr>
          <td class="fw-semibold fs-6">객실</td>
          <td class="ps-3 fs-6">디럭스 패밀리트윈</td>
        </tr>
        <tr>
          <td class="fw-semibold fs-6"><strong>일정</strong></td>
          <td class="ps-3 fs-6">07.15 15:00 - 07.16 11:00 (1박)</td>
        </tr>
        <tr>
          <td class="fw-semibold fs-6"><strong>기준인원</strong></td>
          <td class="ps-3 fs-6">2인 기준, 최대 3인(유료)</td>
        </tr>
      </table>
    </div>
  </div>
  <div class="px-3 mt-4 border border-1 rounded pr-4 row g-4">
    <h4 style="font-weight: 700;" class="ps-2">결제 정보</h4>
    <div class="p-2 mt-1">
      <ul class="payment-info">
        <li>
          <span>객실 가격(1박)</span>
          <span>245,000원</span>
        </li>
        <hr class="pb-2">
        <li>
          <span class="total fw-semibold">총 결제 금액</span>
          <span class="total fw-semibold" style="color: #f45858;">245,000원</span>
        </li>
      </ul>
      <div class="d-flex justify-content-center mt-4 mb-3 pt-2">
        <button class="text-center text-white fs-5 btn btn-primary px-4 py-2 rounded" onclick="requestPay()">245,000원 결제하기</button>
      </div>
    </div>
  </div>
</div>
  </div>
</div>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
var IMP = window.IMP;
IMP.init("imp api 키");

function requestPay() {
    IMP.request_pay({
        pg : 'html5_inicis.INIpayTest', // 테스트 시 html5_inicis.INIpayTest 기재 
        pay_method : 'card',
        merchant_uid: "order_no_0001", // 상점에서 생성한 고유 주문번호
        name : '주문상품명:결제테스트',
        amount : 245000,                           // 금액
        buyer_email : 'test@portone.io',
        buyer_name : '구매자이름',
        buyer_tel : '010-1234-5678',   // 필수 파라미터
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456',
    }, function(resp) { // callback
            if(resp.success) {
                 alert('success...');
                 console.log(resp);
            } else {
                 alert('fail...');
                 console.log(resp);
            }
    });
}
</script>