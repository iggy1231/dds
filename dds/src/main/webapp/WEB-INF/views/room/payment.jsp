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

<input type="hidden" name="num" value="${dto.num}">
<input type="hidden" name="page" value="1">

  <div class="row g-4">
    <div class="col-lg-8">
      <h4 style="font-weight: 700;" class="ps-2 pb-0">✅ 예약 확인 및 결제</h4>
      <!-- 예약자 정보 -->
      <div class="px-3 rounded row gx-4 gy-3 mb-3 pt-3">
        <h5 class="ps-2 pb-0 fw-semibold fs-5">예약자 정보</h5>
        <div class="col-12">
          <label for="name" class="form-label">예약자 이름</label>
          <input type="text" class="form-control" id="name" value="${sessionScope.member.userName}">
        </div>
        <div class="col-12 mt-3">
          <label for="phone" class="form-label">휴대폰 번호</label>
          <input type="text" class="form-control" id="phone" value="${tel}">
        </div>
      </div>
      
      <hr class="m-3 my-4">
      <!-- 할인 사용 -->
<div class="px-3 rounded row gx-4 gy-3 mb-3 pt-3">
    <h5 class="ps-2 pb-0 fw-semibold fs-5">할인 적용</h5>
    <div class="col-8">
        <label for="point" class="form-label">적립 포인트</label>
        <input type="text" class="form-control" id="point" value="${point_price}">
    </div>
    <div class="col-4 d-flex align-items-end">
        <button class="btn btn-secondary w-100" onclick="applyPoint()">포인트 바로 사용</button>
    </div>
    
    <div class="col-12">
        <label for="current-point" class="form-label">현재 보유 포인트</label> <span class="text-primary">: 0 p</span>
        <input type="text" placeholder="사용할 포인트 입력" class="form-control" id="user-point">
    </div>
    <!--  
    <div class="col-12">
        <label for="coupon" class="form-label pe-2">쿠폰</label>
        <select class="form-select" id="coupon-select" onchange="updateCoupon();">
            <option value="">:: 쿠폰 선택 ::</option>
            <option value="회원가입 축하 쿠폰(10% 할인)">회원가입 축하 쿠폰(10% 할인)</option>
        </select>
    </div>
    -->
</div>

     <!-- 최종 가격 -->
		<hr class="m-3 my-4">
		<div class="px-3 rounded row gx-4 gy-1 pt-3 d-flex justify-content-between align-items-center">
		    <h5 class="flex-grow-1 col">객실 가격(1박)</h5>
		    <div class="col-3 d-flex align-items-end">
		        <h4 class="total text-end" style="color: #A6A6A6;">${dto.price}원</h4>
		    </div>
		</div>
		<div class="px-3 rounded row gx-4 gy-1 pt-3 d-flex justify-content-between align-items-center">
		    <h5 class="flex-grow-1 col">포인트 사용액</h5>
		    <div class="col-3 d-flex align-items-end">
		        <h4 id="point-used" class="total  text-end" style="color: #A6A6A6;">0원</h4>
		    </div>
		</div>
		<!--  
		<div class="px-3 rounded row gx-4 gy-1 pt-3 d-flex justify-content-between align-items-center">
		    <h5 class="flex-grow-1 col">쿠폰 할인</h5>
		    <div class="col-3 d-flex align-items-end">
		        <h4 id="coupon-discount" class="total  text-end" style="color: #A6A6A6;">0원</h4>
		    </div>
		</div>
		<div class="px-3 rounded row gx-4 gy-1 pt-3 d-flex justify-content-between align-items-center">
		    <h5 class="flex-grow-1 col">총 할인된 금액</h5>
		    <div class="col-3 d-flex align-items-end">
		        <h4 id="total-discount" class="total  text-end" style="color: #A6A6A6;">${final_price }원</h4>
		    </div>
		</div>
		-->
		<hr class="m-3 my-2">
		<div class="px-3 rounded row gx-4 gy-3 mt-2 pt-3 d-flex justify-content-between align-items-center">
		    <h3 class="flex-grow-1 col fw-semibold">최종 가격</h3>
		    <div class="col-3 d-flex align-items-end">
		        <h4 id="final-price" class="total fw-semibold" style="color: #f45858;">${final_price}원</h4>
		    </div>
		</div>
    </div>
<div class="col-lg-4">
  <div class="px-3 border border-1 rounded row gx-4 gy-3 mb-3">
    <h5 style="font-weight: 700;" class="ps-2 pb-0 text-center">${dto.subject}</h5>
    <div class="ratio ratio-4x3">
      <img src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}" class="img-fluid rounded" alt="객실 이미지">
    </div>
    <div class="p-2 mt-2">
      <table>
        <tr>
          <td class="fw-semibold fs-6 text-nowrap">객실</td>
          <td class="ps-3 fs-6">${dto.name}</td>
        </tr>
        <tr>
          <td class="fw-semibold fs-6 text-nowrap "><strong>일정</strong></td>
          <td class="ps-3 fs-6">${sdate} - ${edate}</td>
        </tr>
        <tr>
          <td class="fw-semibold fs-6 text-nowrap "><strong>인원</strong></td>
          <td class="ps-3 fs-6">최대 ${dto.people}명</td>
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
          <span>${dto.price}원</span>
        </li>
        <hr class="pb-2">
        <li>
          <span class="total fw-semibold">총 결제 금액</span>
          <span class="total fw-semibold" style="color: #f45858;">0원</span>
        </li>
      </ul>
      <div class="d-flex justify-content-center mt-4 mb-3 pt-2">
        <button class="text-center text-white fs-5 btn btn-primary px-4 py-2 rounded" onclick="requestPay()">${total_price - point_price}원 결제하기</button>
      </div>
    </div>
  </div>
</div>
  </div>
</div>


<script>
function applyPoint() {
    var pointField = document.getElementById('point');
    var point = pointField.value.replace(/,/g, '');
    var pointUsed = document.getElementById('point-used');
    var couponDiscount = document.getElementById('coupon-discount').innerText.replace(/,/g, '').replace('원', '');
    var finalPrice = document.getElementById('final-price');
    var roomPrice = ${dto.price};

    point = parseInt(point) || 0; // Remove commas for calculation and handle NaN
    couponDiscount = parseInt(couponDiscount) || 0;

    if (!isNaN(point)) {
        pointUsed.innerText = formatNumber(point) + '원';
        var totalDiscount = point + couponDiscount;
        document.getElementById('total-discount').innerText = formatNumber(totalDiscount) + '원';
        finalPrice.innerText = formatNumber(roomPrice - totalDiscount) + '원';
    } else {
        pointUsed.innerText = '0원';
        finalPrice.innerText = formatNumber(roomPrice - couponDiscount) + '원';
    }
}



</script>


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
