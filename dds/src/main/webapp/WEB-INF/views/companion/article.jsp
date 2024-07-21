<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
*	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
body {
	background-color: #18A8F1;
}
.container {
	background-color: white;
}
.body-container {
	max-width: 800px;
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
</style>

<div class="container">
	<div class="body-container">
		<div id="imgFiles" class="carousel slide">
		  <div class="carousel-inner">
		  <c:forEach var="imgFile" items="${imgFiles}">
		  	<div class="carousel-item">
		      <img src="${pageContext.request.contextPath}/uploads/companion/${imgFile.saveFilename}" class="d-block w-100" alt="...">
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
		<div class="body-title">
			<h3>${dto.subject}</h3>
			<p>조회수 :${dto.hitcount} 작성일 :${dto.reg_date}
		</div>
			
		<div class="body-main">
			<h3>여행 일정</h3>
			<div>
				<p>${dto.sdate} ~ ${dto.edate}
				<c:forEach var="area" items="${dto.region_main}" varStatus="stat">
					<span>${dto.region_main[stat.index]}/${dto.region_sub[stat.index]}</span>
				</c:forEach>
			</div>
			<hr>
			<h3>여행 소개</h3>
			<div>
				<p>${dto.content}
			</div>
			<hr>
			<h3>상세 정보</h3>
			<div>
				<p>#${dto.theme}</p>
				<p>#${dto.gender}</p>
				<c:forEach var="ages" items="${dto.age}">
					<span>${ages}대</span>
				</c:forEach>
				<p>현재 인원 : ${dto.current_people}/${dto.total_people} 명
				<p>예상 비용 : ${dto.estimate_cost} 원
			</div>
			<hr>
			<h3>동행자 정보</h3>
			<div>
				<p>${dto.nickname}
				<p>현재 동행에 참여중인 사람 정보
			</div>
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
			<table class="table table-borderless">
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
					<td width="10%">
						<span></span>
					</td>
				</tr>
				</thead>
				<tbody class="reply-list"></tbody>

			</table>	
			</div>		
			<hr>
			<h3>비슷한 동행 보기</h3>
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
		</div>
	</div>
</div>

<script type="text/javascript">
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
	$("#areaList-carousel .carousel-item:first").addClass('areaNewList');
	$("#areaList-carousel .carousel-item").html("");
	
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
			htmlText+='<div class="col card" onclick="article('+data.list[i].num+')">';
			htmlText+='<img src="${pageContext.request.contextPath}/resources/images/숙소_예시.jpg" class="card-img-top" alt="...">';
			htmlText+='<div class="card-body"><p>'+data.list[i].subject+'</p>';
			data.list[i].age.forEach((ages)=>{
				htmlText+='<a href="#">'+ages+'대 </a>';
				})
				htmlText+='<a href="">'+data.list[i].gender+'</a>';
			htmlText+='		<h3>'+data.list[i].subject+'</h2>';
			htmlText+='		<p>'+data.list[i].content+'</p>';
			for(let j=0;j<data.list[i].region_main.length;j++) {
				htmlText+='<span class="card-text">'+data.list[i].region_main[j]+' '+data.list[i].region_sub[j]+'</span>';
			}
			htmlText+='</div></div>';
		} else {
			htmlText+='<div class="col"></div>';
		}
	}
	htmlText+='</div>';
	$(".areaNewList").append(htmlText);
	$(".areaNewList:first").removeClass('areaNewList');
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
					out+='<td><button class="btn btn-outline-secondary"';
					out+=' onclick="replyReport('+item.user_num+','+item.reply_num+');">';
					out+='<i class="bi bi-exclamation-octagon"></i></button>';
				}
				out+='</td>';
				out+='<td><button class="btn btn-outline-secondary btnReplyAnswer" data-bs-toggle="modal" data-bs-target="#alertModal">';
				out+='<i class="bi bi-chat-dots"></i></button></td></tr>';
				out+='<tr class="replyAnswer"><td colspan="5"><textarea id='+item.reply_num+' placeholder="답글을 작성하세요"></textarea></td>';
				out+='<td><button class="btn btn-outline-secondary" onclick="insertReplyAnswer('+item.reply_num+')">답글 작성</button></td></tr>';
			} else {
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
					out+='<td><button class="btn btn-outline-secondary"';
					out+=' onclick="replyReport('+item.user_num+','+item.reply_num+');">';
					out+='<i class="bi bi-exclamation-octagon"></i></button>';
				}
				out+='</td><td>답글</td></tr>';
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
