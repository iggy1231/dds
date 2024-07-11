<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
form {
	display: none;
}

</style>

<div class="container">
	<form name="loadapi" action="${pageContext.request.contextPath}/info/article" method="post">
		<input type="text" name="title">
		<input type="text" name="homepage">
		<input type="text" name="tel">
		<input type="text" name="addr1">
		<input type="text" name="addr2">
		<input type="text" name="zipcode">
		<input type="text" name="areacode">
		<input type="text" name="sigungucode">
		<input type="text" name="cat1">
		<input type="text" name="cat2">
		<input type="text" name="cat3">
		<input type="text" name="mapx">
		<input type="text" name="mapy">
		<textarea name="overview"></textarea>
		<input type="text" name="contentId">
	</form>
	<div class="resultLayout"></div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

$(function(){
	let spec = "http://apis.data.go.kr/B551011/KorService1/detailCommon1";
	let serviceKey = "%2BBYblTiFRhHS3gVGdmlooqI6F8hrHOcIDfvSJ07UndyvIEjGi%2BbZjcS59aQstEj7xogo%2Fu%2BPUpmgdcfZ1DD%2B%2BQ%3D%3D";
	let numOfRows = 10; // 한페이지 결과수
	let pageNo = 1;
	let _type = "JSON";
	let MobileOS="ETC"; // OS
	let MobileApp="test";
	let contentId=${contentId}
	let areacodeYN = "Y";
	let catcodeYN = "Y";
	let defaultYN = "Y";
	let addrinfoYN = "Y";
	let mapinfoYN = "Y";
	let overviewYN = "Y";

	// 쿼리 작성
	
	let query = "serviceKey="+serviceKey;
	query += "&numOfRows="+numOfRows;
	query += "&pageNo="+pageNo;
	query += "&_type="+_type;
	query += "&MobileOS="+MobileOS;
	query += "&MobileApp="+MobileApp;
	query += "&contentId="+contentId;
	query += "&defaultYN="+defaultYN;
	query += "&areacodeYN="+areacodeYN;
	query += "&catcodeYN="+catcodeYN;
	query += "&addrinfoYN="+addrinfoYN;
	query += "&mapinfoYN="+mapinfoYN;
	query += "&overviewYN="+overviewYN;
	
	const fn = function(data) {
		printJSON(data);
	};
	
	ajaxFun(spec, "get", query, "json", fn);
	
	function printJSON(data) {
		console.log(data);
		if( ! $(data).find("body") ) { // 데이터가 없으면
			alert("데이터가 존재하지 않습니다.");
			return;
		}
		
		if( data.response.body.totalCount==0 ) { // 데이터가 없으면
			alert("데이터가 존재하지 않습니다.");
			return;
		}
				
		let list = data.response.body.items.item;
		for(let item of list) {
			const f=document.loadapi;
			f.title.value=item.title;
			f.homepage.value=item.homepage;
			f.tel.value=item.tel
			f.addr1.value=item.addr1;
			f.addr2.value=item.addr2;
			f.zipcode.value=item.zipcode;
			f.areacode.value=item.areacode;
			f.sigungucode.value=item.sigungucode;
			f.cat1.value=item.cat1;
			f.cat2.value=item.cat2;
			f.cat3.value=item.cat3;
			f.mapx.value=item.mapx;
			f.mapy.value=item.mapy;
			f.overview.value=item.overview;
			f.contentId.value=${contentId};
			f.submit();
		}		
	}
});

</script>