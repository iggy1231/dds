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
		<input type="text" name="homepage">
		<input type="text" name="tel">
		<input type="text" name="addr1">
		<input type="text" name="addr2">
		<input type="text" name="mapx">
		<input type="text" name="mapy">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="contentId" value="${contentId}">
		<textarea name="overview"></textarea>
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
		settings.processData = false;
		settings.contentType = false;
	}
	
	$.ajax(url, settings);
}

$(function(){
	let spec = "http://apis.data.go.kr/B551011/KorService1/detailCommon1";
	let serviceKey = "%2F%2BWArlI5VzXD26Rlk2WGAneNuAmtuGGUU7jr8LtuNkwaNMLgnXgzfqN3NldAW2RR8las22gGXW3viB%2B9c6FfMA%3D%3D";
	let numOfRows = 10;
	let pageNo = 1;
	let _type = "JSON";
	let MobileOS="ETC"; // OS
	let MobileApp="test";
	let contentId=${contentId}
	let defaultYN = "Y";
	let addrinfoYN = "Y";
	let mapinfoYN = "Y";
	let overviewYN = "Y";
	
	let query = "serviceKey="+serviceKey;
	query += "&numOfRows="+numOfRows;
	query += "&pageNo="+pageNo;
	query += "&_type="+_type;
	query += "&MobileOS="+MobileOS;
	query += "&MobileApp="+MobileApp;
	query += "&contentId="+contentId;
	query += "&defaultYN="+defaultYN;
	query += "&addrinfoYN="+addrinfoYN;
	query += "&mapinfoYN="+mapinfoYN;
	query += "&overviewYN="+overviewYN;
	
	const fn = function(data) {
		printJSON(data);
	};
	
	ajaxFun(spec, "get", query, "json", fn);
	
	function printJSON(data) {
		console.log(data);
		if( ! $(data).find("body") ) {
			alert("데이터가 존재하지 않습니다.");
			return;
		}
		
		if( data.response.body.totalCount==0 ) {
			alert("데이터가 존재하지 않습니다.");
			return;
		}
				
		let list = data.response.body.items.item;
		const f=document.loadapi;
		for(let item of list) {
			f.homepage.value=item.homepage;
			f.tel.value=item.tel
			f.addr1.value=item.addr1;
			f.addr2.value=item.addr2;
			f.mapx.value=item.mapx;
			f.mapy.value=item.mapy;
			f.overview.value=item.overview;
			
			f.submit();
		}
	}
});

</script>