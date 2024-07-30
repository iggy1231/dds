<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style>
.search-bar {
  background-color: #F2F2F2;
  border-radius: 30px;
  padding: 10px 20px;
  display: flex;
  align-items: center;
  margin-left: 0 !important;
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

.img-fluid {
    transition: 0.3s ease; /* 부드러운 전환 효과 추가 */
}

.img-fluid:hover {
    filter: brightness(70%); /* 호버 시 이미지 밝기를 70%로 낮춤 */
}

.keyword-btn:hover {
	background-color: #18A8F1 !important; 
	color: #FFFFFF;
}

.keyword-btn.active {
	background-color: #18A8F1 !important; 
	color: #FFFFFF;
}
#keywords input, #facility input {
	display: none;
}

</style>

 <!-- 숙소 Start-->
<div class="container px-2 py-5">
                <h3 class="mb-4 fw-semibold">✅ 선택한 여정</h3>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="search-bar d-flex align-items-center">
                        <i class="pl-2 bi bi-search"></i>
                        <h6 class="text-gray" style="font-weight: 600;">${kwd}</h6>
                        <span>|</span>
                        <h6 class="p-1" style="font-weight: 600;">${sdate} ~ ${edate}</h6>
                        <span>|</span>
                        <h6 class="p-1" style="font-weight: 600;">인원 ${people}</h6>        
                    </div>
                    <div class="text-start">
                    	<h2 class="text-start mt-0 pb-1 bold">${kwd} 숙소 '${dataCount}'개</h2>
                    </div>
                    <div class="sort ps-3 py-3 rounded d-flex justify-content-between" style="background-color: #F2F2F2;">
                        <select id="sort" name="sortlist" class="border-0 form-select-sm me-3" style="background-color: #F2F2F2;" form="fruitform">
                            <option value="popular" ${sort=='popular'?'selected':''}>인기순</option>
                            <option value="lowprice" ${sort=='lowprice'?'selected':''}>낮은 가격순</option>
                            <option value="highprice" ${sort=='highprice'?'selected':''}>높은 가격순</option>
                        </select>
                    </div>
                </div>

                        <div class="row g-4">

                            <div class="col-lg-3">
                            	<form name="filterForm" action="${pageContext.request.contextPath}/room/list" method="get">
                            		<input type="hidden" name="kwd" value="${kwd}">
                            		<input type="hidden" name="sdate" value="${sdate}">
                            		<input type="hidden" name="edate" value="${edate}">
                            		<input type="hidden" name="people" value="${people}">
                            		<input type="hidden" name="sort" value="${sort}">
                             	<!-- 필터 start -->
                                <div class="p-3 border border-1 rounded pr-4 row g-4">
                                <h3 class="pb-2" style="font-weight: 700;"><i class="bi bi-filter-left"></i>  필터</h3>
                                    <div class="col-lg-12">
                                        <div class="mb-2">
                                            <h4 class="pb-2" style="font-weight: 600;">숙소유형</h4>
                                            <div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="roomType" id="roomTypeAll" value="all" ${roomType=='all' ? 'checked' : ''}>
											  <label class="form-check-label" for="roomTypeAll">
											    전체
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="roomType" value="펜션" id="roomTypePension" ${roomType=='펜션' ? 'checked' : ''}>
											  <label class="form-check-label" for="roomTypePension">
											    펜션
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="roomType" value="캠핑/글램핑" id="roomTypeCamping" ${roomType=='캠핑/글램핑' ? 'checked' : ''}>
											  <label class="form-check-label" for="roomTypeCamping">
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
											  <input class="p-2 form-check-input" type="radio" name="priceType" value="priceType1" id="priceType1" ${priceType=='priceType1' ? 'checked' : ''}>
											  <label class="form-check-label" for="flexRadioPrice1">
											    0 원 ~ 10 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="priceType" value="priceType2" id="priceType2" ${priceType=='priceType2' ? 'checked' : ''}>
											  <label class="form-check-label" for="flexRadioPrice2">
											    10 만원 ~ 20 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="priceType" value="priceType3" id="priceType3" ${priceType=='priceType3' ? 'checked' : ''}>
											  <label class="form-check-label" for="flexRadioPrice3">
											    20 만원 ~ 30 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="priceType" value="priceType4" id="priceType4" ${priceType=='priceType4' ? 'checked' : ''}>
											  <label class="form-check-label" for="flexRadioPrice4">
											    30 만원 ~ 40 만원
											  </label>
											</div>
											<div class="pb-2 form-check">
											  <input class="p-2 form-check-input" type="radio" name="priceType" value="priceType5" id="priceType5" ${priceType=='priceType5' ? 'checked' : ''}>
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
                                             	<input type="checkbox" name="keywords" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="가족여행">
                                             	<input type="checkbox" name="keywords" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="힙한감성">
                                             	<input type="checkbox" name="keywords" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="뷰맛집">
                                             	<input type="checkbox" name="keywords" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="감성숙소">
                                             	<input type="checkbox" name="keywords" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="연인끼리">
                                             	<input type="checkbox" name="keywords" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="친구와함께">
		                                       
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn">가족여행</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn">힙한감성</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn">뷰맛집</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn">감성숙소</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn">연인끼리</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn">친구와함께</button>
		                                    </div>
		                                 </div>
                                    </div>
                                    
                                    <hr>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="pb-2" style="font-weight: 600;">시설</h4>
                                             <div id="facility">
                                             	<input type="checkbox" name="facilities" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="사우나">
                                             	<input type="checkbox" name="facilities" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="취사가능">
                                             	<input type="checkbox" name="facilities" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="바비큐">
                                             	<input type="checkbox" name="facilities" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="수영장">
                                             	<input type="checkbox" name="facilities" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="노래방">
                                             	<input type="checkbox" name="facilities" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="스파">
                                             	<input type="checkbox" name="facilities" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" value="피트니스">
                                                                                          
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">사우나</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">취사가능</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">바비큐</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">수영장</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">노래방</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">스파</button>
		                                        <button type="button" class="m-1 mb-2 px-3 py-1 btn border border-gray rounded-pill keyword-btn" onclick="">피트니스</button>
		                                    </div>
		                                 </div>
                                    </div>
                                    <button type="submit" class="btn border border-gray rounded-pill keyword-btn">필터 적용</button>
                                    <button type="button" class="btn border border-gray rounded-pill keyword-btn" onclick="resetFilter();">필터 초기화</button>
                                </div>
                            </form>
                            </div>
                 <!-- 필터 end -->

<!-- 각 숙소 정보 -->                                
<div class="col-lg-8 mt-0">
    <c:forEach var="dto" items="${list}">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="d-flex pt-1 p-3">
                    <div class="ratio ratio-4x3" style="width:530px; height: 200px;">
                        <img src="${pageContext.request.contextPath}/uploads/room/${dto.thumbnail}" class="img-fluid rounded" alt="숙소 이미지">
                    </div>
                    <div class="d-flex flex-column justify-content-between w-100 pl-5">
                        <div class="p-3">
                            <h5 class="mb-2 fw-semibold">${dto.room_type}</h5>
                            <a href="${pageContext.request.contextPath}/room/article?num=${dto.num}&page=${page}&sdate=${sdate}&edate=${edate}&people=${people}">
    						<h4 class="mb-2 fw-semibold">${dto.subject}</h4>
							</a>

                            <h5 class="mb-2 text-muted fw-semibold">${dto.addr1} , ${dto.addr2}</h5>
                            <div class="d-flex align-items-center mb-2">
                                <h5 class="p-2 text-white rounded border-primary mr-2" style="background-color: #18A8F1; font-size: 0.875rem;">★ ${dto.rating}</h5>
                                <h6 class="px-3 text-muted">${dto.ratingCount}명 평가</h6>
                            </div>
                            <h4 class="text-end mb-0">할인가 <strong class="text-primary">${dto.price}원 /박</strong></h4>
                        </div>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </c:forEach>
						<div class="page-navigation">${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
						</div>
</div>
        <!-- 더 많은 숙소 항목 추가 -->
    </div>
</div>

                    </div>
                </div>
            </div>
<script type="text/javascript">
	function resetFilter() {
		location.href="${pageContext.request.contextPath}/room/list?kwd=${kwd}&sdate=${sdate}&edate=${edate}&people=${people}";
	}

	$('#keywords button').click(function(){
		let num=$('#keywords button').index(this);
		if($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('#keywords input').eq(num).prop('checked', false);
		} else {
			$(this).addClass('active');
			$('#keywords input').eq(num).prop('checked', true);
		}
	});
	
	$('#facility button').click(function(){
		let num=$('#facility button').index(this);
		if($(this).hasClass('active')) {
			$(this).removeClass('active');
			$('#facility input').eq(num).prop('checked', false);
		} else {
			$(this).addClass('active');
			$('#facility input').eq(num).prop('checked', true);
		}
	});
	
	$('#sort').change(function(){
		const f=document.filterForm;
		f.sort.value=$(this).val();
		f.submit();
	});
	
	$(function() {
		let arr='${keywords}';
		let arr2='${facilities}';
		
		for(let i=0;i<6;i++) {
			if(arr.indexOf($('#keywords input').eq(i).val())!=-1) {
				$('#keywords input').eq(i).prop('checked', true);
				$('#keywords button').eq(i).addClass('active');
			}
		}
		
		for(let i=0;i<7;i++) {
			if(arr2.indexOf($('#facility input').eq(i).val())!=-1) {
				$('#facility input').eq(i).prop('checked', true);
				$('#facility button').eq(i).addClass('active');
			}
		}
	});
</script>



