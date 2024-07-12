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
.map {
	width: 100%; height:450px; border: 1px solid #777;
}
p {
	margin: 0px;
}
</style>

<div class="container">
	<div class="body-container">	
		<div>
			<h3>${dto.name}</h3>
			<p>${dto.region_Main} ${dto.region_Sub}</p>
			<div>
				<c:forEach var="tag" items="${tagList}">
					<span><a href="#">#${tag}</a></span>
				</c:forEach>
			</div><hr>
		</div>
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
			<h3>소개</h3>
			<p>${dto.overview}</p><hr>
			<h3>지도</h3>
			<div id="map" class="map"></div><hr>
			<h3>연락처</h3>
			<p>주소 : ${dto.addr1} ${dto.addr2} (우편번호 : ${dto.zipcode})</p>
			<p>전화번호 : ${dto.tel}</p>
			<p>홈페이지 : ${dto.homepage}</p><hr>
		</div>
		<div class="reply">
				<form name="replyForm" method="post">
					<table class="table table-borderless reply-form">
						<tr>
							<td colspan="2" class="text-center p-3" style="border-bottom: none;">
								<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요">
									<i class="bi bi-hand-thumbs-up-fill"></i>&nbsp;&nbsp;<span id="boardLikeCount">좋아요 수</span>
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<h3>댓글 (댓글 갯수)</h3>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-light btnSendReply'>댓글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				<div id="listReply"></div>
			</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63f9640ae647d0bba0630ea1ce2eb859"></script>
<script type="text/javascript">
	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var mapContainer = document.getElementById('map');
	var mapOption = {
			center: new kakao.maps.LatLng(${dto.mapy}, ${dto.mapx}), // 지도의 중심좌표
		level: 3  // 지도의 레벨(확대, 축소 정도)
	};
	
	// 지도를 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 마커가 표시될 위치
	var markerPosition  = new kakao.maps.LatLng(${dto.mapy}, ${dto.mapx});
	
	// 마커를 생성
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">${dto.name}<br><a href="https://map.kakao.com/link/map/${dto.mapy},${dto.mapx}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${dto.addr1} ${dto.addr2},${dto.mapy},${dto.mapx}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(${dto.mapy}, ${dto.mapx}); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
</script>
<script type="text/javascript">
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

$(function(){
		let spec = "http://apis.data.go.kr/B551011/KorService1/detailImage1";
		let serviceKey = "OXILAyifZ60FGrDoEDdcW8SLgmOUo3D%2FD%2FcndXOLSg%2B3Ig6CJbBNtpu%2BeL9LxLlFgIdpxOUhAkV3GWuZJ9rvdg%3D%3D";
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