<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
test
</body>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
var IMP = window.IMP;
IMP.init("imp22381535");

function requestPay() {
    IMP.request_pay({
        pg : 'html5_inicis.INIpayTest', // 테스트 시 html5_inicis.INIpayTest 기재 
        pay_method : 'card',
        merchant_uid: "order_no_0001", // 상점에서 생성한 고유 주문번호
        name : '주문상품명:결제테스트',
        amount : 1004,                           // 금액
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