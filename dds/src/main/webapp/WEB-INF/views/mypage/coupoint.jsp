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
        border: 1px solid #0073e6;
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
                    <input type="text" placeholder="쿠폰코드를 입력하세요.">
                    <button>등록</button>
                </div>
                <div class="button-group">
                    <button class="btn active" onclick="showCoupons('available')">사용가능한 쿠폰</button>
                    <button class="btn" onclick="showCoupons('expired')">지난 쿠폰</button>
                </div>
                <div id="available-coupons" class="coupon-content active">
                    <div class="coupon-card">
                        <div class="coupon-info">
                            <h4>50% 첫 구매 쿠폰</h4>
                            <p>ID당 1회, 최대 5천원<br>지오다노 모바일 APP 전용</p>
                        </div>
                        <div class="coupon-brand">GIORDANO</div>
                    </div>
                </div>
                <div id="expired-coupons" class="coupon-content">
                    <div class="coupon-card">
                        <div class="coupon-info">
                            <h4>10% 할인 쿠폰</h4>
                            <p>2023년 12월 31일 만료</p>
                        </div>
                        <div class="coupon-brand">EXPIRED</div>
                    </div>
                </div>
            </div>
            <div id="tab-pane-2" class="tab-pane fade">
                <div class="points-section">
                    <h2>0 P <span class="info-icon">i</span></h2>
                    <p>30일 내 0P가 소멸될 예정이에요</p>
                </div>
                <div class="points-buttons">
                    <button class="btn active" data-type="all">전체</button>
                    <button class="btn" data-type="earned">적립</button>
                    <button class="btn" data-type="used">사용</button>
                    <button class="btn" data-type="expiring">소멸</button>
                </div>
                <div class="points-history" id="points-history">
                    <h3>23년 08월</h3>
                    <div class="history-item">
                        <div class="date">23.08.10</div>
                        <div class="description">주문포인트 사용</div>
                        <div class="points">-2,000 P</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
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
            history.innerHTML = '<h3>23년 08월</h3><div class="history-item"><div class="date">23.08.10</div><div class="description">주문포인트 사용</div><div class="points">-2,000 P</div></div>';
        } else if (type === 'earned') {
            history.innerHTML = '<h3>23년 08월</h3><div class="history-item"><div class="date">23.08.05</div><div class="description">포인트 적립</div><div class="points">+1,000 P</div></div>';
        } else if (type === 'used') {
            history.innerHTML = '<h3>23년 08월</h3><div class="history-item"><div class="date">23.08.10</div><div class="description">주문포인트 사용</div><div class="points">-2,000 P</div></div>';
        } else if (type === 'expiring') {
            history.innerHTML = '<h3>23년 08월</h3><div class="history-item"><div class="date">23.08.15</div><div class="description">포인트 소멸 예정</div><div class="points">-500 P</div></div>';
        }
    }
</script>
