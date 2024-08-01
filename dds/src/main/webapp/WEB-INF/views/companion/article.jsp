<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
*	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
 * @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
} 
.container {
	background-color: white;
}
.body-container {
	max-width: 1000px;
}
.headerImage {
	width: 100%;
	height: 400px;
}
#likeIcon, .btnReplyLike>i {
	color: red;
}
p {
	margin: 0;
}
table tr>td:nth-child(2) {
	text-align: left;
}
.replyAnswer {
	display: none;
}
.replyAnswer textarea {
	width: 100%;
}
.carousel-control-prev-icon {
	background-color: gray;
}
.carousel-control-next-icon {
	background-color: gray;
}
.travel-info-item {
        border: 1px solid #e0e0e0;
        border-radius: 8px;
        overflow: hidden;
        transition: box-shadow 0.3s;
        background-color: white;
        margin-bottom: 20px;
        position: relative;
    }
    .travel-info-item:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .travel-info-item img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
    .travel-info-item-body {
        padding: 16px;
    }
    .travel-info-item-title {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }
    .travel-info-item-location {
        font-size: 14px;
        color: #777;
        margin: 8px 0;
    }
    .travel-info-item-location i {
        color: #00AEEF;
        margin-right: 5px;
    }
    .travel-info-item-tags {
        font-size: 12px;
        color: #999;
    }
    
    .color-text {
    	color: #18A8F1;
    }
    
    .table-light {
    	background-color: #A6A6A6 !important;
    }
    
</style>

<div class="container border mt-5 rounded">
		<div>
			<h3 class="mt-4 fs-2 fw-semibold text-center pt-3">${dto.subject}</h3>
			<div class="d-flex justify-content-between px-3 fs-5 fw-medium">
				<p class="m-0 ps-2">조회수 : ${dto.hitcount}</p>
				<p class="m-0 pe-2">작성일 : ${dto.reg_date}</p>
			</div>
			<hr>
		</div>
	<div class="body-container">
		<div id="imgFiles" class="carousel slide">
		  <div class="carousel-inner">
		  <c:forEach var="imgFile" items="${imgFiles}">
		  	<div class="carousel-item">
		      <img src="${pageContext.request.contextPath}/uploads/companion/${imgFile.saveFilename}" class="d-block w-100" onerror=this.src="${pageContext.request.contextPath}/resources/images/noimage.png">
		    </div>
		  </c:forEach>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#imgFiles" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#imgFiles" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>				
		<div class="body-main mt-4">
			<h3>📅 여행 일정</h3>
			<div>
				<p class="fs-5 p-2">${dto.sdate} ~ ${dto.edate}
				<c:forEach var="area" items="${dto.region_main}" varStatus="stat">
					<span>${dto.region_main[stat.index]}/${dto.region_sub[stat.index]}</span>
				</c:forEach>
			</div>
			<hr>
			<h3>🗺️ 여행 소개</h3>
			<div>
				<p class="fs-5 p-2">${dto.content}
			</div>
			<hr>
			<h3>📢 상세 정보</h3>
			<div class="fs-5 p-2">
				<p># ${dto.theme}</p>
				<p># ${dto.gender}</p>
				<c:choose>
			        <c:when test="${dto.age == 'all'}">
			            <span>모두</span>
			        </c:when>
			        <c:otherwise>
			            <span>${dto.age}대</span>
			        </c:otherwise>
			    </c:choose>
				<p><i class="bi bi-people-fill color-text pe-2"></i>현재 인원 : ${dto.current_people}/${dto.total_people} 명
				<p>예상 비용 : ${dto.estimate_cost} 원
			</div>
			<hr>
			<c:if test="${dto.status==0}">
				<h4 class="my-2"><i class="bi bi-exclamation-circle-fill"></i> 이미 종료된 동행입니다</h4>
			</c:if>
			<c:if test="${dto.user_num==sessionScope.member.user_num&&dto.status!=0}">
				<h3 class="m-2 mb-3"><i class="fa-solid fa-people-group pe-2"></i>동행 신청 확인하기</h3>
				<c:forEach var="item" items="${partyList}">
				    <div class="d-flex align-items-center ms-3">
				        <span class="fs-5 p-2 rounded mb-2" style="background-color: #E4E4E4;">
				            <i class="bi bi-person-circle"></i> ${item.nickname} 참여중
				        </span>
				        <form name="vanishForm" action="${pageContext.request.contextPath}/companion/vanish" method="post" class="ms-2">
				            <input type="hidden" name="num" value="${dto.num}">
				            <input type="hidden" name="user_num" value="${item.user_num}">
				            <button class="btn btn-outline-secondary" type="submit">추방</button>
				        </form>
				    </div>
				</c:forEach>

				<div>
					<c:forEach var="item" items="${waitingList}">
						<span>${item.nickname}</span>
						<form action="${pageContext.request.contextPath}/companion/accept" method="post">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="user_num" value="${item.user_num}">
							<button class="btn btn-outline-secondary" type="submit">수락</button>
						</form>
						<form action="${pageContext.request.contextPath}/companion/reject" method="post">
							<input type="hidden" name="num" value="${dto.num}">
							<input type="hidden" name="user_num" value="${item.user_num}">
							<button class="btn btn-outline-secondary" type="submit">거절</button>
						</form>
						<br>
					</c:forEach>
				</div>
				<hr>
				<div>
				<div class="row">
					<form class="col ms-3" action="${pageContext.request.contextPath}/companion/updateCompanion">
					<input type="hidden" name="num" value="${dto.num}">
					<button class="btn btn-outline-secondary" type="submit">수정</button>
				</form>
				<form class="col-2" name="articleForm" action="#" method="post">
					<input type="hidden" name="num" value="${dto.num}">
					<button class="btn btn-outline-secondary" onclick="deleteCompanion();">삭제</button>
					<button class="btn btn-outline-secondary" onclick="endCompanion();">마감</button>
				</form>
				</div>
				</div>
			</c:if>
			<c:if test="${dto.user_num!=sessionScope.member.user_num&&dto.status!=0}">
				<h3><i class="fa-solid fa-people-group pe-2"></i>동행자 정보</h3>
				<div>
					<c:forEach var="item" items="${partyList}">
						<p class="fs-5"><i class="bi bi-person-circle pe-2"></i>${item.nickname} 참여중
					</c:forEach>
				</div>
				<button class="btn btn-outline-secondary mt-3" onclick="apply();" data-bs-toggle="modal" data-bs-target="#alertModal">동행 참여하기</button>
			</c:if>
			<hr>
			<div>
			<form name="replyForm" method="post">
			<table class="table table-borderless">
				<tr>
					<td colspan="2" class="text-center p-3" style="border-bottom: none;">
						<button type="button" class="btn btn-outline-secondary btnSendBoardLike"
							data-bs-toggle="modal" data-bs-target="#alertModal" onclick="insertCompanionLike();" title="좋아요">
							<c:if test="${liked eq 'true'}">
								<i id="likeIcon" class="bi bi-heart-fill"></i>&nbsp;&nbsp;<span id="infoLikeCount">${likeCount}</span>
							</c:if>
							<c:if test="${liked eq 'false'}">
								<i id="likeIcon" class="bi bi-heart"></i>&nbsp;&nbsp;<span id="infoLikeCount">${likeCount}</span>
							</c:if>
						</button>
						<c:if test="${dto.user_num!=sessionScope.member.user_num}">
							<button type="button" class="btn btn-outline-secondary"
							data-bs-toggle="modal" data-bs-target="#inputModal" onclick="reportCompanion(${dto.user_num});" title="신고">
							<i class="bi bi-exclamation-octagon"></i>&nbsp;&nbsp;<span>신고하기</span>
						</button>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						<h3 id="replyCount"></h3>
					</td>
				</tr>
				<tr>
					<td>
						<textarea class="form-control" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
				   		<button type="button" class="btn btn-light btnSendReply" data-bs-toggle="modal" data-bs-target="#alertModal">댓글 등록</button>
					</td>
				</tr>
			</table>
			</form>
			<table class="table table-borderless align-middle">
				<thead class="text-center">
					<tr class="table-primary bold text-center">
					<td width="10%">
						<span>작성자</span>
					</td>
					<td>
						<span>내용</span>
					</td>
					<td width="15%">
						<span>작성일</span>
					</td>
					<td width="10%">
						<span>좋아요</span>
					</td>
					<td width="10%">
						<span>신고/삭제</span>
					</td>
					<td width="10%">
						<span>답글작성</span>
					</td>
				</tr>
				</thead>
				<tbody class="reply-list text-center align-middle"></tbody>

			</table>	
			</div>		
			<hr>
			<h3 class="my-3">비슷한 동행 보기</h3>
    		<div id="areaList-carousel" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
				      
				    </div>
				    <div class="carousel-item">
				      
				    </div>
				    <div class="carousel-item">
				      
				    </div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#areaList-carousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#areaList-carousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				</button>
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
		<div class="modal fade" id="inputModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="staticBackdropLabel">신고</h1>
		      </div>
		      <div class="modal-body">
				<form name="reportForm" action="#" method="post">
		        <select name="reason">
		        	<option value="모욕 및 괴롭힘">모욕 및 괴롭힘</option>
		        	<option value="허위 정보 유포">허위 정보 유포</option>
		        	<option value="스팸 및 무단도배">스팸 및 무단도배</option>
		        	<option value="부적절한 콘텐츠">부적절한 콘텐츠</option>
		        	<option value="개인정보 침해">개인정보 침해</option>
		        	<option value="부적절한 콘텐츠">부적절한 콘텐츠</option>
		        	<option value="저작권 침해">저작권 침해</option>
		        	<option value="기타">기타</option>
		        </select>
		        <input type="text" name="reason2">
		        <input type="hidden" name="unum">
		        </form>
			  </div>  
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="submitReport1();">확인</button>
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="submitReport2();">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function reportCompanion(user_num) {
	if(${empty sessionScope.member}) {
		$('#inputModal .modal-body').html('');
		$('#inputModal .modal-footer button:nth-child(2)').hide();
		$('#inputModal .modal-footer button:last').hide();
		$('#inputModal .modal-title').text("신고는 로그인 후에만 가능합니다.");
		return;
	}
	
	$('#inputModal .modal-footer button:first').hide();
	$('#inputModal .modal-footer button:last').hide();
	const f=document.reportForm;
	f.unum.value=user_num;
}

function replyReport(user_num) {
	if(${empty sessionScope.member}) {
		$('#inputModal .modal-body').html('');
		$('#inputModal .modal-footer button:nth-child(2)').hide();
		$('#inputModal .modal-footer button:last').hide();
		$('#inputModal .modal-title').text("댓글 신고는 로그인 후에만 가능합니다.");
		return;
	}
	
	$('#inputModal .modal-footer button:first').hide();
	$('#inputModal .modal-footer button:nth-child(2)').hide();
	const f=document.reportForm;
	f.unum.value=user_num;
}

function submitReport2() {
	const f=document.reportForm;
	if(f.reason.value==null||f.reason2.value==null) {
		alert('신고 사유를 입력해주세요');
		return;
	}
	let user_num=f.unum.value;
	let reason=f.reason.value+" : "+f.reason2.value;
	let url="${pageContext.request.contextPath}/companion/reportReply";
	let query="article_num=${dto.num}&user_num="+user_num+"&reason="+reason;	
	
	const fn = function(data) {
		$('#inputModal .modal-footer button').show();
		let state=data.state;
		if(state === "true") {
			alert("댓글 신고가 완료되었습니다.")
		} else if(state === "reported") {
			alert("동일한 글에 신고는 1회만 가능합니다");
			return;
		} else {
			alert("댓글 신고에 실패했습니다.");
		}
	}
	
	ajaxFun(url, "post", query, "json", fn);
}

function submitReport1() {
	const f=document.reportForm;
	if(f.reason.value==null||f.reason2.value==null) {
		alert('신고 사유를 입력해주세요');
		return;
	}
	let user_num=f.unum.value;
	let reason=f.reason.value+" : "+f.reason2.value;
	let url="${pageContext.request.contextPath}/companion/reportCompanion";
	let query="article_num=${dto.num}&user_num="+user_num+"&reason="+reason;	
	console.log("article_num=${dto.num}&user_num="+user_num+"&reason="+reason);
	const fn = function(data) {
		$('#inputModal .modal-footer button').show();
		let state=data.state;
		if(state === "true") {
			alert("신고가 완료되었습니다.")
		} else if(state === "reported") {
			alert("동일한 글에 신고는 1회만 가능합니다");
			return;
		} else {
			alert("신고에 실패했습니다.");
		}
	}
	
	ajaxFun(url, "post", query, "json", fn);
}

function deleteCompanion() {
	const f=document.articleForm;
	f.action="${pageContext.request.contextPath}/companion/deleteCompanion";
	f.submit;
}

function endCompanion() {
	const f=document.articleForm;
	f.action="${pageContext.request.contextPath}/companion/endCompanion";
	f.submit;
}

function apply() {
	if(${empty sessionScope.member}) {
		$('#alertModal .modal-title').text('동행 참여는 로그인 후에만 가능합니다.');
		return;
	}
	
	let url="${pageContext.request.contextPath}/companion/apply";
	let query="num=${dto.num}&user_num=${sessionScope.member.user_num}";
	
	const fn=function(data) {
		let state=data.state;
		if(state === "true") {
			$('#alertModal .modal-title').text('동행 요청에 성공했습니다');
		} else if(state === "applied") {
			$('#alertModal .modal-title').text('동행 요청은 1회만 가능합니다.');
			return;
		} else {
			$('#alertModal .modal-title').text('동행 요청에 실패했습니다.');
		}
	}
	
	ajaxFun(url, "post", query, "json", fn);
}
function insertCompanionLike() {
	if(${empty sessionScope.member}) {
		$('#alertModal .modal-title').text('좋아요는 로그인 후에만 가능합니다.');
		return;
	}
	
	let url="${pageContext.request.contextPath}/companion/like";
	let query="num=${dto.num}";
	
	const fn = function(data) {
		let state=data.state;
		if(state === "true") {
			let count = data.likeCount;
			$("#infoLikeCount").text(count);
			
			let heart=document.querySelector("#likeIcon");
			heart.classList.replace('bi-heart', 'bi-heart-fill');
			
			$('#alertModal .modal-title').text('좋아요 처리에 성공했습니다');
		} else if(state === "liked") {
			$('#alertModal .modal-title').text('좋아요는 1회만 가능합니다.');
				return;
		} else {
			$('#alertModal .modal-title').text('좋아요 처리에 실패했습니다.');
		}
	}
	
	ajaxFun(url, "post", query, "json", fn);
};
function similiarList(mainRegion) {
	let url="${pageContext.request.contextPath}/companion/similiarList";
	let query="num=${dto.num}&mainRegion="+mainRegion;
	
	const fn=function(data) {
		addNextPage(data);
	};
	
	ajaxFun(url, 'get', query, 'json', fn);
} 

function addNextPage(data) {
	$("#areaList-carousel .carousel-inner>div").removeClass('active');
	$("#areaList-carousel .carousel-inner>div").addClass('carousel-item');
	$("#areaList-carousel .carousel-inner .carousel-item:first").addClass('areaNewList active');
	$("#areaList-carousel .carousel-inner .carousel-item").html("");
	
	let htmlText='<div class="row">';
	for(let i=0;i<12;i++) {
		if(i%4==0&&i>=data.list.length) {
			break;
		}
		if(i%4==0&&i!=0) {
			htmlText+='</div>';
			$(".areaNewList").append(htmlText);
			htmlText="";
			$(".areaNewList").next().addClass('areaNewList');
			$(".areaNewList:first").removeClass('areaNewList');
			htmlText+='<div class="row">';
		}
		if(i<data.list.length) {
			
			htmlText+='<div class="col notEmpty">';
			htmlText+='	<div class="travel-info-item" onclick="article('+data.list[i].num+');">';
			htmlText+='	<img src="${pageContext.request.contextPath}/uploads/companion/'+data.list[i].saveFilename+'" onerror=this.src="${pageContext.request.contextPath}/resources/images/noimage.png">';
			htmlText+='	<div class="travel-info-item-body">';
			htmlText+='		<a class="travel-info-item-title" href="">'+data.list[i].subject+'</a>';
			htmlText+='		<p class="travel-info-item-location">';
			for(let j=0;j<data.list[i].region_main.length;j++) {
				htmlText+='		<i class="bi bi-geo-alt-fill">'+data.list[i].region_main[j]+' '+data.list[i].region_sub[j]+'</i></p>';
			}
			
			if (data.list[i].age === "all") { 
                htmlText += '<span class="travel-info-item-tags">#모두 #';
            } else {
                htmlText += '<span class="travel-info-item-tags">#' + data.list[i].age + '대 #';
            }

			switch (data.list[i].gender) {
				case "male" : htmlText+='남자만</span>'; break;
				case "female" : htmlText+='여자만</span>'; break;
				default : htmlText+='남/여</span>'; break;
			}
			htmlText+='</div></div></div>';
		} else {
			htmlText+='<div class="col"></div>';
		}
	}
	
	htmlText+='</div>';
	$(".areaNewList").append(htmlText);
	$(".areaNewList:first").removeClass('areaNewList');
	
	for(let i=1;i<=3;i++) {
		let arr=$("#areaList-carousel .carousel-inner>div:nth-child("+i+")").find(".notEmpty");
		if(arr.length==0) {
			$("#areaList-carousel .carousel-inner>div:nth-child("+i+")").removeClass('carousel-item');
		}
	}
}
function replyDelete(reply_num) {
	let url="${pageContext.request.contextPath}/companion/deleteReply";
	let query="reply_num="+reply_num;
	
	const fn = function(data) {
		let state=data.state;
		if(state === "true") {
			$('#alertModal .modal-title').text('댓글 삭제에 성공했습니다');
			listPage(1);
		} else {
			$('#alertModal .modal-title').text('댓글 삭제에 실패했습니다');
		}
	}
	
	ajaxFun(url, "post", query, "json", fn);
}
function insertReplyAnswer(reply_num) {
	let url="${pageContext.request.contextPath}/companion/insertReplyAnswer";
	let content=document.getElementById(reply_num).value;
	let query="num=${dto.num}&reply_num="+reply_num+"&content="+content;
	
	const fn = function(data) {
		$('.replyAnswer textarea').text("");
		
		let state = data.state;
		if(state === "true"){
			listPage(1);
		} else {
		}
	}
	
	ajaxFun(url, "post", query, "json", fn);
}

function listPage(page) {
	let url = "${pageContext.request.contextPath}/companion/listReply";
	let query = "num=${dto.num}&pageNo="+page;

	const fn = function(data) {
		let login_user_num=${empty sessionScope.member?0:sessionScope.member.user_num};
		document.getElementById('replyCount').innerText="댓글 "+data.dataCount;
		
		let out="";
		for(let item of data.list) {
			if(item.answer_num==0) {
				out+='<tr><td><span>'+item.nickname+'</span></td>';
				out+='<td><span>'+item.content+'</span></td>';
				out+='<td><span>'+item.reg_date+'</span></td>';
				out+='<td><button class="btn btn-outline-secondary btnReplyLike" data-reply_num='+item.reply_num+'>';
				if(item.liked=="true") {
					out+='<i id="replylikeIcon'+item.reply_num+'" class="bi bi-heart-fill" ';
					out+='data-bs-toggle="modal" data-bs-target="#alertModal">'+item.likeCount+'</i>';
				} else {
					out+='<i id="replylikeIcon'+item.reply_num+'" class="bi bi-heart" ';
					out+='data-bs-toggle="modal" data-bs-target="#alertModal">'+item.likeCount+'</i>';
				}
				out+='</button></td>';
				if(login_user_num==item.user_num) {
					out+='<td><button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#alertModal"';
					out+=' onclick="replyDelete('+item.reply_num+');">';
					out+='<i class="bi bi-trash"></i></button>';
				} else {
					out+='<td><button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#inputModal"';
					out+=' onclick="replyReport('+item.user_num+');">';
					out+='<i class="bi bi-exclamation-octagon"></i></button>';
				}
				out+='</td>';
				out+='<td><button class="btn btn-outline-secondary btnReplyAnswer" data-bs-toggle="modal" data-bs-target="#alertModal">';
				out+='<i class="bi bi-chat-dots"></i></button></td></tr>';
				out+='<tr class="replyAnswer" style="background-color: #EAEAEA;"><td colspan="5"><textarea id='+item.reply_num+' placeholder="답글을 작성하세요"></textarea></td>';
				out+='<td><button class="btn btn-outline-secondary" onclick="insertReplyAnswer('+item.reply_num+')">답글 작성</button></td></tr>';
			} else {
				out+='<tr class = "table-light"><td><span>'+item.nickname+'</span></td>';
				out+='<td><span>'+item.content+'</span></td>';
				out+='<td><span>'+item.reg_date+'</span></td>';
				out+='<td><button class="btn btn-outline-secondary btnReplyLike" data-reply_num='+item.reply_num+'>';
				if(item.liked=="true") {
					out+='<i id="replylikeIcon'+item.reply_num+'" class="bi bi-heart-fill" ';
					out+='data-bs-toggle="modal" data-bs-target="#alertModal">'+item.likeCount+'</i>';
				} else {
					out+='<i id="replylikeIcon'+item.reply_num+'" class="bi bi-heart" ';
					out+='data-bs-toggle="modal" data-bs-target="#alertModal">'+item.likeCount+'</i>';
				}
				out+='</button></td>';
				if(login_user_num==item.user_num) {
					out+='<td><button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#alertModal"';
					out+=' onclick="replyDelete('+item.reply_num+');">';
					out+='<i class="bi bi-trash"></i></button>';
				} else {
					out+='<td><button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#inputModal"';
					out+=' onclick="replyReport('+item.user_num+');">';
					out+='<i class="bi bi-exclamation-octagon"></i></button>';
				}
				out+='</td><td></td></tr>';
			}
		}
		out+='<tr><td colspan="6" class="page-navigation">'+data.paging+'</td></tr>';
		document.querySelector('.reply-list').innerHTML=out;
	}
	ajaxFun(url, "get", query, "text", fn);
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;
		settings.contentType = false;
	}
	$.ajax(url, settings);
}

function article(num) {
	location.href='${pageContext.request.contextPath}/companion/article?num='+num;
}

$(function(){
	listPage(1);
	similiarList('${dto.region_main[0]}');
	$('#imgFiles .carousel-item:first').addClass('active');
	
	$(".btnSendReply").click(function() {
		if(${empty sessionScope.member}) {
			$('#alertModal .modal-title').text('댓글 작성은 로그인 후에만 가능합니다.');
			return;
		}
		
		const $tb = $(this).closest("table");
		let content = $tb.find("textarea").val().trim();
		
		if(! content){
			$('#alertModal .modal-title').text('댓글 내용을 작성해주세요.');
			$tb.find("textarea").focus();
			return;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/companion/insertReply";
		let query = "num=${dto.num}&content="+content;
		
		const fn = function(data) {
			$tb.find("textarea").val("");
			let state = data.state;
			if(state === "true"){
				$('#alertModal .modal-title').text('댓글 등록에 성공했습니다');
				listPage(1);
			} else {
				$('#alertModal .modal-title').text('댓글 등록에 실패했습니다');
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
	
	$(".reply-list").on("click", ".btnReplyLike", function() {
		if(${empty sessionScope.member}) {
			$('#alertModal .modal-title').text('댓글 좋아요는 로그인 후에만 가능합니다.');
			return;
		}
		
		let reply_num = $(this).attr("data-reply_num");
		const btn = $(this);
		
		let url = "${pageContext.request.contextPath}/companion/insertReplyLike";
		let query = "reply_num="+reply_num;
		
		const fn = function(data) {
			let state = data.state;
			if(state === "true"){
				let count = data.likeCount;
				
				let heart=document.querySelector("#replylikeIcon"+reply_num);
				$("#replylikeIcon"+reply_num).text(count);

				heart.classList.replace('bi-heart', 'bi-heart-fill');
				$('#alertModal .modal-title').text('댓글 좋아요 처리에 성공했습니다');
			} else if(state = "liked") {
				$('#alertModal .modal-title').text('댓글 좋아요는 한번만 가능합니다');
			} else {
				$('#alertModal .modal-title').text('댓글 좋아요 처리가 실패했습니다');
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
	
	$(".reply-list").on("click", ".btnReplyAnswer", function(){
		$('.replyAnswer').hide();
		if(${empty sessionScope.member}) {
			$('#alertModal .modal-title').text('답글 작성은 로그인 후에만 가능합니다.');
			return;
		}

		if($(this).hasClass('active')) {
			$('.btnReplyAnswer').removeClass('active');
			$(this).closest("tr").next().hide();
		} else {
			$('.btnReplyAnswer').removeClass('active');
			$(this).addClass('active');
			$(this).closest("tr").next().show();
		}
	});
});
</script>
