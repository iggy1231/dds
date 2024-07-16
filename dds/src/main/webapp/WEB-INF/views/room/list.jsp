<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style>
.search-bar {
  background-color: #F2F2F2;
  border-radius: 30px;
  padding: 15px 25px;
  display: flex;
  align-items: center;
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
  margin-right: 15px;
  color: #6c757d;
}
.search-bar span {
  margin: 0 15px;
  color: #6c757d;
}
.form-check-label {
  font-size: 1.2rem !important;
  padding-left: 20px !important;
  color : #454545 !important;
}

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
  .col-lg-3 {
    flex: 0 0 auto;
    width: 30%;
  }
  .col-lg-8 {
    width: 70%;
  }
}    

.text-primary {
	color: #18A8F1 !important;
}



</style>


 <!-- 숙소 Start-->
<div class="container px-2 py-5">
                <h3 class="mb-4">✅ 선택한 여정</h3>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="search-bar d-flex align-items-center">
                        <i class="pl-2 bi bi-search"></i>
                        <h5 class="text-gray" style="font-weight: 600;">${kwd}</h5>
                        <span>|</span>
                        <h5 class="p-1" style="font-weight: 600;">07.19 ~ 07.21</h5>
                        <span>|</span>
                        <h5 class="p-1" style="font-weight: 600;">인원 2</h5>        
                    </div>
                    <div class="text-start">
                    	<h2 class="text-start mt-0 pb-1 bold">${kwd} 숙소 '${dataCount}'개</h2>
                    </div>
                    <div class="sort ps-3 py-3 rounded d-flex justify-content-between" style="background-color: #F2F2F2;">
                        <select id="sort" name="sortlist" class="border-0 form-select-sm me-3" style="background-color: #F2F2F2;" form="fruitform">
                            <option value="volvo">인기순</option>
                            <option value="saab">낮은 가격순</option>
                            <option value="opel">높은 가격순</option>
                        </select>
                    </div>
                 
                    
                </div>

                        <div class="row g-4">
                            <div class="col-lg-3">
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
                            </div>
                 <!-- 필터 end -->

<!-- 각 숙소 정보 -->                                
<div class="col-lg-8 mt-0">
    <c:forEach var="dto" items="${list}">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="d-flex pt-1 p-3">
                    <div class="ratio ratio-4x3" style="width:530px; height: 200px;">
                        <img src="https://i.namu.wiki/i/SQLwKua_xTO96XEaWDnHv4dt4ESeqQb5a7u3BTQUSOwvAoLFUP34ACl15C-spwbFbPt_rN47Dk95YZzeb0tRlg.webp" class="img-fluid rounded" alt="숙소 이미지">
                    </div>
                    <div class="d-flex flex-column justify-content-between w-100 pl-5">
                        <div class="p-3">
                            <h5 class="mb-2 fw-semibold">${dto.room_type}</h5>
                            <h4 class="mb-2 fw-semibold">${dto.subject}</h4>
                            <h5 class="mb-2 text-muted fw-semibold">${dto.addr1} , ${dto.addr2}</h5>
                            <div class="d-flex align-items-center mb-2">
                                <h5 class="p-2 text-white rounded border-primary mr-2" style="background-color: #18A8F1; font-size: 0.875rem;">★ 10.0</h5>
                                <h6 class="px-3 text-muted">5조5억명 평가</h6>
                            </div>
                            <h4 class="text-end mb-0">할인가 <strong class="text-primary">123456789원 /박</strong></h4>
                        </div>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </c:forEach>
</div>
        <!-- 더 많은 숙소 항목 추가 -->
        
        
    </div>
</div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->

</div>



