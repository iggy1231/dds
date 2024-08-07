<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
 * @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}      
        .hero-header {
            background-image: url('${pageContext.request.contextPath}/resources/images/main_header.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .search-form-container {
            max-width: 1200px;
            margin: auto;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            background-color: white;
        }
        .nav-tabs .nav-link {
            border: none;
            border-bottom: 2px solid transparent;
        }
        .nav-tabs .nav-link.active {
            border-bottom-color: #007bff;
            color: #007bff;
        }
        .form-control {
            border-radius: 0.375rem;
        }
        .btn-custom {
            border-radius: 0.375rem;
        }
        .btn-outline-secondary, .btn-primary {
            white-space: nowrap;
        }
        .text-primary {
            color: #18A8F1 !important;
        }
        .bg-primary {
            background-color: #18A8F1 !important;
        }
        .property-item {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .property-item:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        
       .carousel-caption {
            top: 50%;
            transform: translateY(-22%);
        }
        
.testimonial-item {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 50px; /* 이미지가 카드 아래로 나오도록 하기 위한 여백 */
    background-color: white; /* 기본 배경색 */
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.testimonial-img {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 10;
    background-color: white;
    border: 5px solid white;
    border-radius: 50%;
}

.testimonial-comment {
    width: 100%;
    text-align: center;
    background-color: #18A8F1;
    color: white;
    padding: 50px 20px 20px 20px; /* 이미지 크기 만큼의 패딩 추가 */
    border-radius: 10px;
    margin-bottom: 50px; /* 이미지와 텍스트 사이의 간격 */
}

.testimonial-comment::after {
    content: "";
    display: block;
    height: 30px; /* 이미지 크기와 동일한 높이 */
}

.testimonial-item h5,
.testimonial-item p {
    margin: 5px 0 0 0;
    padding-top: 15px; /* 이미지와의 간격을 위해 여백 추가 */
}

.ratio-4x3 {
    aspect-ratio: 4 / 3;
    width: 100%;
    object-fit: cover;
}

/*** Testimonial Start ***/
.testimonial .testimonial-carousel {
    position: relative;
}

.testimonial .testimonial-carousel .testimonial-item .testimonial-img {
    position: relative;
    width: 100px; 
    height: 100px; 
    top: 0; left: 50%; 
    transform: translate(-50%, -50%);
    border: 3px solid var(--bs-primary); 
    border-style: dotted;
    border-radius: 50%;
}

.testimonial .testimonial-carousel .owl-dots {
    margin-top: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.testimonial .testimonial-carousel .owl-dot {
    position: relative;
    display: inline-block;
    margin: 0 5px;
    width: 15px;
    height: 15px;
    background: var(--bs-light);
    border: 1px solid var(--bs-primary);
    border-radius: 10px;
    transition: 0.5s;
}

.testimonial .testimonial-carousel .owl-dot.active {
    width: 40px;
    background: var(--bs-primary);
}

.testimonial .testimonial-carousel .owl-nav .owl-prev {
    position: absolute;
    top: -55px;
    left: 0;
    padding: 5px 30px;
    border: 1px solid var(--bs-primary);
    border-radius: 30px;
    transition: 0.5s;
}

.testimonial .testimonial-carousel .owl-nav .owl-next {
    position: absolute;
    top: -55px;
    right: 0;
    padding: 5px 30px;
    border: 1px solid var(--bs-primary);
    border-radius: 30px;
    transition: 0.5s;
}

.testimonial .testimonial-carousel .owl-nav .owl-prev i,
.testimonial .testimonial-carousel .owl-nav .owl-next i {
    color: var(--bs-primary);
    font-size: 17px;
    transition: 0.5s;
}

.testimonial .testimonial-carousel .owl-nav .owl-prev:hover,
.testimonial .testimonial-carousel .owl-nav .owl-next:hover {
    background: var(--bs-primary);
}

.testimonial .testimonial-carousel .owl-nav .owl-prev:hover i,
.testimonial .testimonial-carousel .owl-nav .owl-next:hover i {
    color: var(--bs-white);
}

.testimonial .testimonial-carousel .owl-item.center .testimonial-item .testimonial-comment {
    background: var(--bs-primary) !important;
    color: var(--bs-white);
    transition: 0.5s;
}

.testimonial .testimonial-carousel .owl-item.center .testimonial-item .testimonial-img {
    border: 3px solid var(--bs-white); 
    border-style: dotted;
    transition: 0.5s;
}


/*** Testimonial End ***/


        
</style>

<div class="my-info">
	<div class="page-title">
		<div class="spacing-top"></div>
		 <div class="content"> 
		 	<div class="title-row">
		 		<div class="title title--show">
		 			<h1 class="text">프로필</h1>
			 	</div> 
			 	<div class="action-btn-area"></div>
			 </div>
		</div>
		<div class="spacing-bottom"></div>
			
		<div class="profile-container">
			<div class="profile-info">
				<div class="profile-info">
					<c:choose>
					
    <c:when test="${not empty sessionScope.member.photo}">
        <c:set var="profileImage" value="${pageContext.request.contextPath}/uploads/mypage/${sessionScope.member.photo}" />
    </c:when>
    <c:otherwise>
        <c:set var="profileImage" value="${pageContext.request.contextPath}/resources/images/profile_image_default.png" />
    </c:otherwise>
</c:choose>

<img src="${profileImage}" alt="Profile Image" class="profile-image">
					<div class="profile-content">
						<div class="nickname">${dto.nickName}</div>
						<div class="details">${dto.ageDecade}대 • ${dto.gender}</div>
					</div>
				</div>
				<button class="mbti-button" style="align: right;">${dto.mbti != "빈값입니다" ? dto.mbti : "mbti를 설정해주세요"} </button>
			</div>
			<div class="profile-intro">
				<div>${dto.content != "빈값입니다" ? dto.content : "자기소개를 입력해주세요"} </div>
			</div> 
			<div class="profile-quatro">
				<button class="profile-update">수정하기</button>
			</div>
		</div>
		<hr>
		<div class="spacing-top1"></div>
		 <div class="content"> 
		 	<div class="title-row">
		 		<div class="title title--show">
		 			<h1 class="text">나의 두둥실</h1>
			 	</div> 
			 	<div class="action-btn-area"></div>
			 </div>
		</div>
		<div class="spacing-bottom"></div>
		
		<ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 여행기 </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 댓글 </button>
            </li>
        </ul>
        
        <div class="tab-content mt-3">
	        <div id="tab-pane-1" class="tab-pane fade show p-0 active">
	                <div class="row g-4">
	                
	                <c:forEach var="list" items="${list}">
   		 <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
        <div class="property-item rounded overflow-hidden">
            <div class="position-relative overflow-hidden">
                <a href="${pageContext.request.contextPath}/travelreview/article?num=${list.num}&page=1">
               
                                					<c:choose>
					
    <c:when test="${not empty list.imageFilename}">
        <c:set var="profileImage2" value="${pageContext.request.contextPath}/uploads/travelreview/${list.imageFilename}" />
    </c:when>
    <c:otherwise>
        <c:set var="profileImage2" value="${pageContext.request.contextPath}/resources/images/product_default.png" />
    </c:otherwise>
</c:choose>

<img src="${profileImage2}" alt="Profile Image2" class="profile-image2 ratio ratio-4x3 img-fluid">
                </a>
                <div class="d-inline-flex position-absolute start-0 top-0 m-4">
                    <div class="bg-primary rounded text-white py-1 px-3 me-2"><i class="bi bi-heart-fill"></i>&nbsp;${list.likeCount}개</div> 
                    <div class="bg-primary rounded text-white py-1 px-3"><i class="bi bi-eye"></i>&nbsp;${list.hitCount}개</div>
                </div>
                <div class="display-9 bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3">
                    <h5 style="font-weight: 600;">순천</h5>
                </div>
            </div>
            <div class="px-4 py-2 pb-3">
                <a class="d-block h4 mb-2 mt-2" href="" style="font-size:18px; font-weight: 600;">${list.subject}</a>
                <h6 class="display-10" style="color: #666565;"><i class="text-primary bi bi-chat-fill"></i>&nbsp;&nbsp;${list.replyCount}개</h6> 
                <h6 class="display-10 py-1" style="color: #666565;"><i class="bi bi-calendar-check"></i>&nbsp;${list.reg_date}</h6>
            </div>
        </div>
    </div>
</c:forEach>
	                    
					</div>
			</div>
        </div>
        
        	<div id="tab-pane-2" class="tab-pane fade p-0">
                        <div class="mt-1 p-2 list-question">
                       <c:forEach var="list2" items="${list2}">
                            <div class="mt-1 border-bottom">
                                <a class="p-1 fw-semibold fs-4" href="">${list2.content}</a>
                                <h6 class="p-1 fs-5 text-secondary"><i class="bi bi-airplane"></i>&nbsp;
                                 <c:choose>
							        <c:when test="${list2.boardName == 'travelreview'}">
							            여행후기
							        </c:when>
							        <c:when test="${list2.boardName == 'info'}">
							            여행정보
							        </c:when>
							        <c:when test="${list2.boardName == 'companion'}">
							            동행구인
							        </c:when>
							        <c:otherwise>
							            기타
							        </c:otherwise>
							    </c:choose>
							   </h6>
                                <div class="row p-2 fs-5">
					                <div class="col text-end pt-2 px-0">
					                    <span class="text-secondary">${list2.reg_date}</span>&nbsp;|&nbsp;<span class="deleteQuestion" data-num="1">삭제</span>
					                </div>
            					</div>
                            </div> 
                            
                       </c:forEach>
                            
                        </div>
        	</div>
        	
        	
	</div>
	
	
</div>


<!-- MBTI 선택 모달 -->
<div class="modal fade" id="mbtiModal" tabindex="-1" aria-labelledby="mbtiModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mbtiModalLabel">MBTI 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>MBTI를 선택해주세요!</p>
                <div class="row g-2">
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="INTJ">INTJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="INTP">INTP</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ENTJ">ENTJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ENTP">ENTP</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="INFJ">INFJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="INFP">INFP</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ENFJ">ENFJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ENFP">ENFP</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ISTJ">ISTJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ISFJ">ISFJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ESTJ">ESTJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ESFJ">ESFJ</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ISTP">ISTP</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ISFP">ISFP</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ESTP">ESTP</button></div>
                    <div class="col-6 col-md-4"><button class="btn btn-outline-primary w-100 mbti-option" data-mbti="ESFP">ESFP</button></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">초기화</button>
                <button type="button" class="btn btn-primary" id="mbtiSelectBtn">선택 완료</button>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
    // 수정하기 버튼 클릭 시 profileUpdate.jsp로 이동
    $('.profile-update').on('click', function () {
        window.location.href = '${pageContext.request.contextPath}/mypage/profileUpdate';
    });

    // MBTI 버튼 클릭 시 모달 창 열기
    $('.mbti-button').on('click', function () {
        $('#mbtiModal').modal('show');
    });

    // MBTI 선택 시 버튼에 클래스 추가/제거
    $('.mbti-option').on('click', function () {
        $('.mbti-option').removeClass('btn-primary').addClass('btn-outline-primary');
        $(this).removeClass('btn-outline-primary').addClass('btn-primary');
    });

    // 선택 완료 버튼 클릭 시 모달 닫기
    $('#mbtiSelectBtn').on('click', function () {
        $('#mbtiModal').modal('hide');
        
        // 선택된 MBTI 값을 가져옵니다.
        var selectedMbti = $('.mbti-option.btn-primary').text();

        // 사용자 번호를 가져옵니다.
        var userNum = $('#userNum').val();  // 예: input 태그에 있는 user_num 값

        // POST 요청을 보냅니다.
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/mypage/mbtiUpdate',
            data: {
                mbti: selectedMbti,
                user_num: userNum
            },
            success: function(response) {
                // 성공적으로 업데이트된 후의 동작을 정의합니다.
                alert('MBTI가 성공적으로 업데이트되었습니다.');
            },
            error: function(error) {
                // 오류 발생 시의 동작을 정의합니다.
                alert('MBTI 업데이트에 실패했습니다.');
            }
        });
    });
});

</script>

