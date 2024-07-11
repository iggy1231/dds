<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style>
        .search-bar {
            background-color: #f8f9fa;
            border-radius: 30px;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .search-bar input[type="text"] {
            border: none;
            outline: none;
            box-shadow: none;
        }
        .search-bar .form-control:focus {
            box-shadow: none;
        }
        .search-bar i {
            margin-right: 10px;
            color: #6c757d;
        }
        .search-bar span {
            margin: 0 15px;
            color: #6c757d;
        }
        
        .form-check-label {
        	font-size: 1.2rem !important;
        	padding-left: 20px  !important;
        	color : #454545 !important;
        }
        
        hr {
            border-top: 0.5px solid gray;
        }
        
        .keyword-btn {
        font-size: 17.5px  !important;
        font-weight: 500 !important;
        }
        
            .filter-box {
        width: 100%;
    }

    @media (min-width: 992px) {
        .filter-box {
            width: 90%; /* 너비를 조절하려면 이 값을 변경 */
        }
    }
        
    </style>
</head>
<body>

 <!-- 숙소 Start-->
            <div class="container py-5">
                <h3 class="mb-4">✅ 선택한 여정</h3>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="search-bar d-flex align-items-center">
                        <i class="pl-2 bi bi-search"></i>
                        <h5 class="text-gray" style="font-weight: 600;">순천</h5>
                        <span>|</span>
                        <h5 class="p-1" style="font-weight: 600;">07.19 ~ 07.21</h5>
                        <span>|</span>
                        <h5 class="p-1" style="font-weight: 600;">인원 2</h5>        
                    </div>
                    <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between">
                        <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                            <option value="volvo">인기순</option>
                            <option value="saab">낮은 가격순</option>
                            <option value="opel">높은 가격순</option>
                        </select>
                    </div>
                </div>

                        <div class="row g-4">
                            <div class="col-lg-4">
                             	<!-- 필터 start -->
                                <div class="p-3 border border-1 rounded pr-4 row g-4">
                                <h3 class="pb-2" style="font-weight: 700;"><i class="bi bi-filter-left"></i>  필터</h3>
                                    <div class="col-lg-12">
                                        <div class="mb-2">
                                            <h4 class="pb-2" style="font-weight: 600;">숙소유형</h4>
                                            <div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
											  <label class="form-check-label" for="flexRadioDefault1">
											    전체
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
											  <label class="form-check-label" for="flexRadioDefault2">
											    펜션
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3">
											  <label class="form-check-label" for="flexRadioDefault3">
											    캠핑/글램핑
											  </label>
											</div>
                                        </div>
                                    </div>
                                    
                                    <hr>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="pb-2" style="font-weight: 600;">가격대</h4>
                                            <div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioPrice" id="flexRadioPrice1" checked>
											  <label class="form-check-label" for="flexRadioPrice1">
											    0 원 ~ 10 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioPrice" id="flexRadioPrice2">
											  <label class="form-check-label" for="flexRadioPrice2">
											    10 만원 ~ 20 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioPrice" id="flexRadioPrice3">
											  <label class="form-check-label" for="flexRadioPrice3">
											    20 만원 ~ 30 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioPrice" id="flexRadioPrice4">
											  <label class="form-check-label" for="flexRadioPrice4">
											    30 만원 ~ 40 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="flexRadioPrice" id="flexRadioPrice5">
											  <label class="form-check-label" for="flexRadioPrice5">
											    40만원 ~ 
											  </label>
											</div>
                                        </div>
                                    </div>
                                    
                                    <hr>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="pb-2" style="font-weight: 600;">키워드</h4>
                                             <div id="keywords">
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick=""># 가족여행</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick=""># 스파</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick=""># 힙한감성</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick=""># OTT</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick=""># 피고내</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick=""># 감성숙소</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick=""># 뷰맛집</button>
		                                    </div>
		                                 </div>
                                    </div>
                                    
                                    <hr>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="pb-2" style="font-weight: 600;">시설</h4>
                                             <div id="keywords">
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">사우나</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">수영장</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">바비큐시설</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">피트니스</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">수영장</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">공용화장실</button>
		                                    </div>
		                                 </div>
                                    </div>
                                </div>
                                
                                <!-- 필터 end -->
                            </div>
                            <div class="col-lg-7">
							    <div class="row g-4 justify-content-center">
							        <div class="col-md-12">
							            <div class="d-flex border p-3 rounded">
							                <img src="https://cdn.imweb.me/thumbnail/20220827/2572710192af0.png" class="img-fluid rounded" style="width: 200px; height: 150px;" alt="숙소 이미지">
							                <div class="pl-3">
							                    <h5 class="mb-1">펜션</h5>
							                    <a class="pl-5 d-block h4 mb-2" href="" style="font-weight: 600;">익산 함께해요 펜션</a>
							                    <p class="mb-1 text-muted">전라남도 순천시 OO로</p>
							                    <div class="d-flex align-items-center mb-2">
							                        <span class="badge badge-danger mr-2">9.6</span>
							                        <span class="text-muted">1,209명 평가</span>
							                    </div>
							                    <p class="mb-0">할인가 <strong class="text-danger">100,324원 /박</strong></p>
							                </div>
							            </div>
							        </div>
							        <!-- 더 많은 숙소 항목 추가 -->
							    </div>
						</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->




</body>
</html>