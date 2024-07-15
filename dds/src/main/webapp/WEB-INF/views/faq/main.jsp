<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
p {
	margin: 0px;
}

.css-6dsmwj {
	padding-top: 16px;
	padding-bottom: 20px; 
}

.css-117epsa {
	margin-top: 2px;
	margin-bottom: 2px;
	font-size: 1.5rem;
	line-height: normal;
	letter-spacing: 0px;
	font-weight: 700;
	--tw-text-opacity: 1;
	color: rgb(51 51 51 / var(--tw-text-opactiy));
}

.css-1cjo2yk {
	margin-top: 4px;
	font-size: 1rem;
	line-height: 1.5rem;
	letter-spacing: 0px;
	--tw-text-opacity: 1;
	color: rgb(153 153 153 / var(--tw-text-opacity));
}

.card-body {
	flex: 1 1 auto;
	--bs-card-spacer-y: 1.5rem;
	--bs-card-spacer-x: 1.5rem;
}

.card-title {
	--bs-card-title-spacer-y: 0.875rem;
	--bs-card-title-color: #566a7f;
}

.css-140ci6h {
	padding-top: 16px;
	padding-bottom: 16px;
	font-size: 1.125rem;
	line-height: normal;
	letter-spacing: 0px;
	font-weight: 700;
	--tw-text-opacity: 1;
	color: rgb(51 51 51 / var(--tw-text-opactiy));
}

.css-1sppzbr {
	margin-bottom: 8px;
}

.css-1l5q1e2 {
	display:flex;
	width: 100%;
	padding-bottom: 12px;
}

.css-rejq6k {
	display:flex;
	width: 100%;
	overflow-x: auto;
	overscroll-behavior: none;
	gap: 6px 8px;
	flex-wrap: wrap;
}

.css-1ax683h {
	height: 32px;
	max-width: 212px;
	padding: 8px; 16px;
	font-size: 0.8125rem;
	line-height: 0.8125rem;
	letter-spacing: 0px;
	font-weight: 600;
	flex: 0 0 auto;
	cursor: pointer;
	-webkit-box-align: center;
	display: block;
	overflow: ellipsis;
	white-space: nowrap;
	border-radius: 100px;
	border-width: 1.5px;
	--tw-bg-opacity: 1;
	background-color: #18A8F1;
	color: #ffffff;
}

ol, ul {
    padding-left: 0rem;
}
</style>

<div class="container">
	<div class="body-container">
		<div class="css-6dsmwj">
			<h1 class="css-117epsa">고객센터</h1>
			<p class="css-1cjo2yk">어려움이나 궁금한 점이 있으신가요?</p>
		</div>
		<div class="col-md-6 col-lg-4">
        	<div class="card mb-3">
        		<div class="card-body">
        			<h5 class="card-title"><i class="bi bi-telephone"></i> 1234-5678</h5>
        				<p class="card-text">예약·취소 문의</p>
        				<p class="card-text">오전 9시 ~ 새벽 3시></p>
        				<a href="javascript:void(0)" class="btn btn-primary float-end" style="margin-top: 5px;">카카오톡 문의</a>
       			</div>
        	</div>
        </div>
		<h2 class="css-140ci6h">자주 묻는 질문</h2>
		<div class="css-1sppzbr">
			<div class="gc-expandable-tab css-1l5q1e2">
				<ul role="tablist" aria-label="고객 센터 문의 탭" class="css-rejq6k">
					<li tabindex="0" role="tab" aria-selected="true" aria-controls="TOP7" class="px-4  py-2 css-1ax683h">TOP7</li>
					<li class="nav-item" role="presentation">
                        <button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 리뷰 </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 상품문의 </button>
                    </li>
				</ul>

			</div>
		</div>
		
	</div>
</div>		