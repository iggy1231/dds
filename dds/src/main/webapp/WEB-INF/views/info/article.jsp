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
</style>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-app"></i> ${dto.name} </h3>
			<p> ${dto.region_Main} ${dto.region_Sub} </p>
			<div class="row">
				<c:forEach var="tag" items="${tagList}">
					<button class="col-1">${tag}</button>
				</c:forEach>
			</div>
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
			</div>
			
			<hr>
			<h3>소개</h3>
			<hr>
			<p>${dto.overview}</p>
			<h3>지도</h3>
			<div class="bg-primary" style="height: 500px;">GPS 주소 : ${dto.mapx}, ${dto.mapy}</div>
			<hr>
			<h3>상세정보</h3>
			<hr>
			<p>주소 : ${dto.addr1} ${dto.addr2} (우편번호 : ${dto.zipcode})</p>
			<p>전화번호 : ${dto.tel}</p>
			<p>홈페이지 : ${dto.homepage}</p>
		</div>
		<div>
			<h3>댓글 0</h3>
			<div>댓글창</div>
		</div>
	</div>
</div>

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
		let serviceKey = "api키";
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
		console.log(data);
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