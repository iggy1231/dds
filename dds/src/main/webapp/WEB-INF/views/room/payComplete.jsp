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
      <h4 style="font-weight: 700;" class="ps-2 pb-0 text-center">✅ 결제 완료 되었습니다.</h4>
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
          <span class="total fw-semibold" style="color: #f45858;">${total_price - point_price}원</span>
        </li>
      </ul>
      <div class="d-flex justify-content-center mt-4 mb-3 pt-2">
        <button class="text-center text-white fs-5 btn btn-primary px-4 py-2 rounded" id="final_price" onclick="requestPay()" value="${total_price - point_price}">${total_price - point_price}원 결제하기</button>
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
IMP.init("imp22381535");

function requestPay() {
	var saleNum = document.getElementById('sale_num').value;
	var subject = document.getElementById('subject').value;
	var tel = document.getElementById('tel').value;
	var userName = document.getElementById('userName').value;
	var final_price = document.getElementById('final_price').value;
	var room_name = document.getElementById('name').value;
	
    IMP.request_pay({
    	  pg : 'html5_inicis.INIpayTest', // 테스트 시 html5_inicis.INIpayTest 기재 
          pay_method : 'card',
          merchant_uid: "order_room_no_"+saleNum, // 상점에서 생성한 고유 주문번호
          name : subject + "," + room_name, // 템플릿 리터럴 사용
          amount : 104, // 금액을 변수로 사용
          buyer_email : 'kelios3693@gmail.com',
          buyer_name : userName, // 템플릿 리터럴 필요 없음
          buyer_tel : tel,   // 템플릿 리터럴 필요 없음
          buyer_addr : '서울특별시 강남구 삼성동',
          buyer_postcode : '123-456',
    }, function(resp) { // callback
            if(resp.success) {
                 alert('결제~~성공!');
                 console.log(resp);
                 savePaymentInfo();
                 console.log('호출 성공!');
            } else {
                 alert('결제 실패...');
            }
    });
}

function savePaymentInfo() {

	
	
	var paymentData = {
		sale_num : 3,
		sdate : '2024-07-25',
		edate : '2024-07-28',
		total_price : 150000,
		point_price : 7500,
		discount : 0,
		final_price : 142500 ,
		name : 'A1001호' ,
		detail_num : 33,
		user_num : 1,

	};
	
    // 서버로 결제 정보를 전송하는 AJAX 요청
	$.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/room/insertPayment', // 서버의 URL
        contentType: 'application/json', // 요청 본문의 타입
        data: JSON.stringify(paymentData), // 요청 본문
        success: function(response) {
            console.log('서버 응답:', response);
            if (response.success) {
                alert("결제 완료");
                console.log("결제 성공");
            } else {
                alert('결제 정보 저장 실패');
                console.log("결제 실패");
            }
        },
        error: function(xhr, status, error) {
            console.error('오류 발생:', error);
        }
    });
}
</script>
