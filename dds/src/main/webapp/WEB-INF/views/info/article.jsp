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
	max-width: 800px;
}
.map {
	width: 100%; height:450px;
}
#likeIcon, .btnReplyLike>i {
	color: red;
}
p {
	margin: 0px;
}
.reply-table tr>td {
	text-align: center;
}
.reply-table tr>td:nth-child(2) {
	text-align: left;
}

.subject-style {
    font-size: 40px; /* 폰트 사이즈를 키움 */
    font-weight: bold; /* 폰트를 굵게 설정 */
}

.region-style {
	font-size: 30px;
	color: #18A8F1;
}

.tag-style{
	font-size: 23px;
	color: #A4A6AA;
}

h3{
	font-size: 30px;
	font-weight: bold;
	color: #4E4F55;
}

p{
	font-size: 20px;
}

</style>

<div class="container-xxl py-5">
		<div>
			<h3 class="mt-3 subject-style">${dto.name}</h3>
			<p class="region-style"><i class="bi bi-geo-alt"></i>&nbsp;${dto.region_Main} ${dto.region_Sub}</p>
			<div>
				<c:forEach var="tag" items="${tagList}">
					<span><a class="tag-style" href="#">#${tag}</a></span>
				</c:forEach>
			</div><hr>
		</div>
	<div class="container">	
		<div class="body-main">
			<div class="resultLayout"></div>
			<div id="carouselExample" class="carousel slide">
			  <div class="carousel-inner"></div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div><hr>
			<h3><i class="bi bi-book-half"></i>&nbsp;소개</h3>
			<p>${dto.overview}</p><hr>
			<h3><i class="bi bi-geo-alt-fill"></i>&nbsp;지도</h3>
			<div id="map" class="map"></div><hr>
			<h3><i class="bi bi-telephone-fill"></i>&nbsp;연락처</h3>
			<p style="font-weight: bold; font-size: 20px;">📍&nbsp;주소 </p>
			<p>${dto.addr1} ${dto.addr2} (우편번호 : ${dto.zipcode})</p>
			<p style="font-weight: bold; font-size: 20px;">☎️&nbsp;전화번호</p>
			<p> ${dto.tel}</p>
			<p style="font-weight: bold; font-size: 20px;">🏡&nbsp;홈페이지</p>
			<p>${dto.homepage}</p><hr>
		</div>
		<div class="reply">
			<form name="replyForm" method="post">
				<table class="table table-borderless reply-form">
					<tr>
						<td colspan="2" class="text-center p-3" style="border-bottom: none;">
							<button type="button" class="btn btn-outline-secondary btnSendBoardLike"
								data-bs-toggle="modal" data-bs-target="#alertModal" onclick="insertInfoLike();" title="좋아요">
								<c:if test="${liked eq 'true'}">
									<i id="likeIcon" class="bi bi-heart-fill"></i>&nbsp;&nbsp;<span id="infoLikeCount">${likeCount}</span>
								</c:if>
								<c:if test="${liked eq 'false'}">
									<i id="likeIcon" class="bi bi-heart"></i>&nbsp;&nbsp;<span id="infoLikeCount">${likeCount}</span>
								</c:if>
							</button>
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
			<table class="table table-borderless reply-table">
				<thead>
					<tr class="table-primary bold">
					<td width="10%">
						<span>작성자</span>
					</td>
					<td>
						<span>내용</span>
					</td>
					<td width="10%">
						<span>작성일</span>
					</td>
					<td width="10%">
						<span>좋아요</span>
					</td>
					<td width="10%">
						<span>신고/삭제</span>
					</td>
				</tr>
				</thead>
				<tbody class="reply-list"></tbody>
				
			</table>			
		</div>
		<!-- Modal -->
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
				<form name="reportForm" action="#">
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
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="submitReport();">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f331abde958ffa17c211ccebb6b7958"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map');
	var mapOption = {
			center: new kakao.maps.LatLng(${dto.mapy}, ${dto.mapx}), level: 3
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var markerPosition  = new kakao.maps.LatLng(${dto.mapy}, ${dto.mapx});
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">${dto.name}<br><a href="https://map.kakao.com/link/map/${dto.mapy},${dto.mapx}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${dto.addr1} ${dto.addr2},${dto.mapy},${dto.mapx}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(${dto.mapy}, ${dto.mapx}); //인포윈도우 표시 위치입니다

	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	infowindow.open(map, marker);
</script>
<script type="text/javascript">
function insertInfoLike() {
	if(${empty sessionScope.member}) {
		$('#alertModal .modal-title').text('좋아요는 로그인 후에만 가능합니다.');
		return;
	}
	
	let url="${pageContext.request.contextPath}/info/like";
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

function replyDelete(reply_num) {
	let url="${pageContext.request.contextPath}/info/deleteReply";
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
function replyReport(user_num) {
	if(${empty sessionScope.member}) {
		$('#inputModal .modal-body').html('');
		$('#inputModal .modal-footer button:last').hide();
		$('#inputModal .modal-title').text("댓글 신고는 로그인 후에만 가능합니다.");
		return;
	}
	
	$('#inputModal .modal-footer button:first').hide();
	const f=document.reportForm;
	f.unum.value=user_num;
}

function submitReport() {
	const f=document.reportForm;
	if(f.reason.value==null||f.reason2.value==null) {
		alert('신고 사유를 입력해주세요');
		return;
	}
	let user_num=f.unum.value;
	let reason=f.reason.value+" : "+f.reason2.value;
	let url="${pageContext.request.contextPath}/info/reportReply";
	let query="article_num=${dto.num}&user_num="+user_num+"&reason="+reason;	
	
	const fn = function(data) {
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

$(function() {
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
		
		let url = "${pageContext.request.contextPath}/info/insertReply";
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
});

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
function listPage(page) {
	let url = "${pageContext.request.contextPath}/info/listReply";
	let query = "num=${dto.num}&pageNo="+page;
	
	const fn = function(data) {
		let obj=JSON.parse(data);
		let login_user_num=${empty sessionScope.member?0:sessionScope.member.user_num};

		document.getElementById('replyCount').innerText="댓글 "+obj.dataCount;
		
		let out="";
		for(let item of obj.list) {
			out+='<tr><td><span>'+item.nickName+'</td>';
			out+='<td><span>'+item.content+'</td>';
			out+='<td><span>'+item.reg_date+'</td>';
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
			
			out+='</td></tr>';
			
		}
		out+='<tr><td colspan="5" class="page-navigation">'+obj.paging+'</td></tr>';
		document.querySelector('.reply-list').innerHTML=out;
	}
	
	ajaxFun(url, "get", query, "text", fn);
}
$(function(){
		listPage(1);
		
		let spec = "http://apis.data.go.kr/B551011/KorService1/detailImage1";
		let serviceKey = "%2F%2BWArlI5VzXD26Rlk2WGAneNuAmtuGGUU7jr8LtuNkwaNMLgnXgzfqN3NldAW2RR8las22gGXW3viB%2B9c6FfMA%3D%3D";
		let numOfRows = 5;
		let pageNo = 1;
		let _type = "JSON";
		let MobileOS="ETC" // OS
		let MobileApp="test"
		let imageYN="Y";
		let subImageYN="Y";
		
		let query = "serviceKey="+serviceKey;
		query += "&numOfRows="+numOfRows;
		query += "&pageNo="+pageNo;
		query += "&MobileOS="+MobileOS;
		query += "&MobileApp="+MobileApp;
		query += "&contentId=${contentId}";
		query += "&_type="+_type;
		query += "&imageYN="+imageYN;
		query += "&subImageYN="+subImageYN;
		
		const fn = function(data) {
			printJSON(data);
		};
		
		ajaxFun(spec, "get", query, "json", fn);
		
		$(".reply-list").on("click", ".btnReplyLike", function() {
			if(${empty sessionScope.member}) {
				$('#alertModal .modal-title').text('댓글 좋아요는 로그인 후에만 가능합니다.');
				return;
			}
			
			let reply_num = $(this).attr("data-reply_num");
			const btn = $(this);
			
			let url = "${pageContext.request.contextPath}/info/insertReplyLike";
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
	
	function printJSON(data) {
		if( ! $(data).find("body") ) {
			return;
		}
		let list = data.response.body.items.item;
		let out='<div id="carousel-thumbnail" class="carousel-item active">';
		out +=  '	<img src="${dto.thumbnail}" class="d-block w-100" alt="...">';
		out +=  '</div>';
		$(".carousel-inner").html(out);
		
		if( data.response.body.totalCount==0 ) {
			return;
		}
		
		for(let item of list) {
			const e=document.createElement('div');
			e.className += ' carousel-item';
			const img=document.createElement('img');
			img.className += 'd-block w-100';
			img.src=item.originimgurl
			e.append(img);
			$(".carousel-inner").append(e);
		}
	}
});
</script>