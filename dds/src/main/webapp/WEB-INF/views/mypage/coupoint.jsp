<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .input-container {
        display: flex;
        align-items: center;
        margin-top: 20px;
    }
    .input-container input[type="text"] {
        flex: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .input-container button {
        padding: 10px 20px;
        margin-left: 10px;
        border: none;
        background-color: #00aaff;
        color: white;
        border-radius: 5px;
        cursor: pointer;
    }
    .button-group {
        display: flex;
        margin-top: 20px;
    }
    .button-group .btn {
        padding: 10px 20px;
        margin: 5px;
        border-radius: 20px;
        border: 2px solid #00aaff;
        background-color: transparent;
        color: #00aaff;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }
    .button-group .btn.active {
        background-color: #00aaff;
        color: white;
    }
    .coupon-content {
        display: none;
        margin-top: 20px;
    }
    .coupon-content.active {
        display: block;
    }
    .coupon-card {
        background-color: #0080ff;
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        position: relative;
    }
    .coupon-card::before, .coupon-card::after {
        content: '';
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 20px;
        height: 20px;
        background-color: #fff;
        border-radius: 50%;
        z-index: 1;
    }
    .coupon-card::before {
        left: -10px;
    }
    .coupon-card::after {
        right: -10px;
    }
    .coupon-info {
        flex: 1;
        color: white;
    }
    .coupon-info h4 {
        margin: 0;
        font-size: 24px;
    }
    .coupon-info p {
        margin: 5px 0;
        font-size: 16px;
    }
    .coupon-brand {
        writing-mode: vertical-rl;
        text-orientation: mixed;
        color: white;
        font-size: 18px;
        padding-left: 10px;
    }
    .points-section {
        background-color: #f0f8ff;
        border-radius: 10px;
        padding: 20px;
        margin-top: 20px;
    }
    .points-section h2 {
        font-size: 36px;
        color: #00aaff;
        margin: 0;
    }
    .points-section p {
        color: #999;
        margin-top: 10px;
    }
    .info-icon {
        font-size: 16px;
        color: #999;
        float: right;
    }
    .points-buttons {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .points-buttons .btn {
        padding: 10px 20px;
        margin: 5px;
        border-radius: 20px;
        border: 1px solid #ddd;
        background-color: transparent;
        color: #666;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }
    .points-buttons .btn.active {
        background-color: #00aaff;
        color: white;
        border: none;
    }
    .points-history {
        margin-top: 20px;
    }
    .points-history h3 {
        font-size: 18px;
        color: #333;
        margin-bottom: 10px;
    }
    .points-history .history-item {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
    .points-history .history-item .date {
        color: #999;
    }
    .points-history .history-item .description {
        flex: 1;
        margin-left: 10px;
    }
    .points-history .history-item .points {
        color: #00aaff;
    }
    
    .usable-background-primary {
	background-color: #18A8F1 !important;
}

.disusable-background-primary {
	background-color: #BEE8FD !important;
}
</style>

<div class="my-info">
    <div class="page-title">
        <div class="spacing-top"></div>
        <div class="content">
            <div class="title-row">
                <div class="title title--show">
                    <h1 class="text">쿠폰·포인트</h1>
                </div>
                <div class="action-btn-area"></div>
            </div>
        </div>
        <div class="spacing-bottom"></div>

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="pane-1" aria-selected="false"> 쿠폰 </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="pane-2" aria-selected="false"> 포인트 </button>
            </li>
        </ul>

        <div class="tab-content mt-3">
            <div id="tab-pane-1" class="tab-pane fade show active">
                <div class="input-container">
	            	<input id="couponCode" type="text" placeholder="쿠폰코드를 입력하세요.">
	            	<button onclick="addCoupon();" data-bs-toggle="modal" data-bs-target="#alertModal">등록</button>
                </div>
                <div class="button-group">
                    <button class="btn active" onclick="showCoupons('available')">사용가능한 쿠폰</button>
                    <button class="btn" onclick="showCoupons('expired')">지난 쿠폰</button>
                </div>
                <div id="available-coupons" class="coupon-content active">
                <c:forEach var="dto" items="${list1}">
                	<div class="coupon-card usable-background-primary">
                        <div class="coupon-info">
                            <h4>${dto.name}</h4>
                            <p>${dto.content}<br>${dto.content}</p>
                        </div>
                        <div class="coupon-brand">DoDoongSil</div>
                    </div>
                </c:forEach>
                    
                </div>
                <div id="expired-coupons" class="coupon-content">
                <c:forEach var="dto" items="${list2}">
                    <div class="coupon-card disusable-background-primary">
                        <div class="coupon-info">
                            <h4>${dto.name}</h4>
                            <p>${dto.content}<br>${dto.content}</p>
                        </div>
                        <div class="coupon-brand">EXPIRED</div>
                    </div>
                </c:forEach>
                </div>
            </div>
            <div id="tab-pane-2" class="tab-pane fade">
                <div class="points-section">
                    <h2>1580 P <span class="info-icon">i</span></h2>
                    <p>30일 내 500P가 소멸될 예정이에요</p>
                </div>
                <div class="points-buttons">
                    <button class="btn active" data-type="all">전체</button>
                    <button class="btn" data-type="earned">적립</button>
                    <button class="btn" data-type="used">사용</button>
                    <button class="btn" data-type="expiring">소멸</button>
                </div>
                <div class="points-history" id="points-history">
                    <h3>24년 08월</h3>
                    <div class="history-item">
                        <div class="date">24.07.28</div>
                        <div class="description">주문포인트 사용</div>
                        <div class="points">-2,000 P</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="alertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
<script>
	function addCoupon() {
		let code=document.getElementById('couponCode');
		let url="${pageContext.request.contextPath}/mypage/addcoupon";
		let query="code="+code.value;
		
		const fn = function(data) {
			let state=data.state;
			if(state === "true") {
				$('#alertModal .modal-title').text("쿠폰 등록에 성공했습니다");
				location.href="${pageContext.request.contextPath}/mypage/coupoint";
			} else if(state === "used") {
				$('#alertModal .modal-title').text("이미 사용된 쿠폰 코드입니다");
				return;
			} else {
				$('#alertModal .modal-title').text("쿠폰 등록에 실패했습니다");
			}
		}
		
		ajaxFun(url, "post", query, "json", fn);
	}
	
    function showCoupons(type) {
        var availableBtn = document.querySelector(".button-group .btn:nth-child(1)");
        var expiredBtn = document.querySelector(".button-group .btn:nth-child(2)");
        var availableCoupons = document.getElementById("available-coupons");
        var expiredCoupons = document.getElementById("expired-coupons");

        if (type === 'available') {
            availableBtn.classList.add("active");
            expiredBtn.classList.remove("active");
            availableCoupons.classList.add("active");
            expiredCoupons.classList.remove("active");
        } else {
            availableBtn.classList.remove("active");
            expiredBtn.classList.add("active");
            availableCoupons.classList.remove("active");
            expiredCoupons.classList.add("active");
        }
    }
    
    document.addEventListener("DOMContentLoaded", function() {
        const buttons = document.querySelectorAll(".points-buttons .btn");
        buttons.forEach(button => {
            button.addEventListener("click", function() {
                buttons.forEach(btn => btn.classList.remove("active"));
                this.classList.add("active");
                showPoints(this.getAttribute("data-type"));
            });
        });
    });

    function showPoints(type) {
        const history = document.getElementById("points-history");
        history.innerHTML = '';

        if (type === 'all') {
            history.innerHTML = '<h3>24년 8월</h3><div class="history-item"><div class="date">24.08.01</div><div class="description">주문포인트 사용</div><div class="points">-2,000 P</div></div>';
        } else if (type === 'earned') {
            history.innerHTML = '<h3>24년 07월</h3><div class="history-item"><div class="date">24.07.30</div><div class="description">포인트 적립</div><div class="points">+1,000 P</div></div>';
        } else if (type === 'used') {
            history.innerHTML = '<h3>24년 08월</h3><div class="history-item"><div class="date">24.08.01</div><div class="description">주문포인트 사용</div><div class="points">-2,000 P</div></div>';
        } else if (type === 'expiring') {
            history.innerHTML = '<h3>23년 08월</h3><div class="history-item"><div class="date">24.08.18</div><div class="description">포인트 소멸 예정</div><div class="points">-500 P</div></div>';
        }
    }
    function ajaxFun(url, method, formData, dataType, fn, file = false) {
    	const settings = {
    			type: method, 
    			data: formData,
    			dataType:dataType,
    			success:function(data) {
    				fn(data);
    			},
    			beforeSend: function(jqXHR) {
    			},
    			complete: function () {
    			},
    			error: function(jqXHR) {
    				console.log(jqXHR.responseText);
    			}
    	};
    	
    	if(file) {
    		settings.processData = false;
    		settings.contentType = false;
    	}
    	
    	$.ajax(url, settings);
    }
</script>
