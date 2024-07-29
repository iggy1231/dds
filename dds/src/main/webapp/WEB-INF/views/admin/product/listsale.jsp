<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card">
				<div class="card-header ps-3 fw-semibold fs-3 text-center mb-3 text-primary">숙소 상품 리스트</div>
					<div class="table-responsice text-nowrap" style="overflow: auto; max-height: 400px;">
						<table class="table">
								<thead>
									<tr class="text-center"> 
										<th>주문번호</th>
										<th>예약일자</th>
										<th>체크인</th>
										<th>체크아웃</th>
										<th>가격</th>
										<th>쿠폰차감</th>
										<th>포인트차감</th>
										<th>할인</th>
										<th>결제금액</th>
										<th>상품이름</th>
										<th>방이름</th>
										<th>방(고유번호)</th>
										<th>유저번호</th>
										<th>유저닉네임</th>
										<th>환불</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="list" items="${list}" varStatus="status">
										<tr class="text-center">
											<td>${list.sale_num}  <input type="hidden" id="sale_num-${list.sale_num}" value="${list.sale_num}">
            <input type="hidden" id="final_price-${list.sale_num}" value="${list.final_price}">
            <input type="hidden" id="card_num-${list.sale_num}" value="${list.card_num}">
            <input type="hidden" id="user_num-${list.sale_num}" value="${list.user_num}">
											</td>
											<td>${list.reg_date}</td>
											<td>${list.sdate} 15:00</td>
											<td>${list.edate} 11:00</td>
											<td>${list.total_price}</td>
											<td>${list.coupon_price}</td>
											<td>${list.point_price} </td>
											<td>${list.discount}</td>
											<td>${list.final_price}</td>
											<td>${list.subject}</td>
											<td>${list.name}</td>
											<td>${list.detail_num}</td>
											<td>${list.user_num}</td>
											<td>${list.nickName}</td>	
											<td> <input type="text" id="description-${list.sale_num}"> <button type="button" onclick="getToken('${list.imp_uid}',0,${list.sale_num});" > 환 불 </button> </td>			
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="col-auto pt-4 ps-4 text-start">${dataCount}개(${page}/${total_page} 페이지)</div>
						<div class="page-navigation">${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
						</div>
					</div>
				</div>
				<!-- tab-content _ end -->
			</div>
			<!-- body-main -->


<script type="text/javascript">


function getToken(num, point,sale_num) {
    // ajaxFun 함수 정의    
    function ajaxFun(url, method, query, dataType, successCallback) {
        $.ajax({
            url: url,
            method: method,
            data: query,
            dataType: dataType,
            success: successCallback,
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패:", status, error);
                alert("AJAX 요청에 실패했습니다.");
            }
        });
    }

    let url = "${pageContext.request.contextPath}/admin/product/token";
    let query = "";

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("불러오기 성공");
            console.log(data.access_token);
            console.log(sale_num);
            let access_token = data.access_token;
            cancel(num, access_token, point,sale_num);
        } else {
            alert("불러오기 실패");
        }
    };

    // ajaxFun 함수 호출
    ajaxFun(url, "post", query, "json", fn);
    
}

function cancel(num, access_token,point,sale_num) {
		console.log("셀넘" + sale_num)
		var sale_num = sale_num;
	 	var cardNum = document.getElementById("card_num-"+sale_num).value;
	    var userNum = document.getElementById("user_num-"+sale_num).value;
	    var finalPrice = document.getElementById("final_price-"+sale_num).value;
	    var description = document.getElementById("description-"+sale_num).value;
	    
	    sale_num = parseInt(sale_num, 10); 
	    userNum = parseInt(userNum, 10);   
	    finalPrice = parseInt(finalPrice, 10); 
    
    var url = "${pageContext.request.contextPath}/admin/product/cancel";
    
    var formData = {
        imp_uid: num,
        reason: description,
        access_token: access_token, // 액세스 토큰 추가
        sale_num : sale_num,
        card_num : cardNum,
        final_price : finalPrice,
        user_num : userNum,
    };

    const fn = function(data) {
        let state = data.state;
        if (state === "true") {
            alert("환불 성공");
            window.location.reload();
        } else {
            alert("환불 실패");
            console.log(data.message);
        }
    };

    // ajaxFun 함수 예시
    function ajaxFun(url, type, data, dataType, successFn) {
        $.ajax({
            url: url,
            type: type,
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: dataType,
            success: successFn,
            error: function(xhr, status, error) {
                alert("전송 실패: " + xhr.responseText);
            }
        });
    }

    ajaxFun(url, "post", formData, "json", fn);
};
</script>