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
.card {
	margin: 0 5px;
	padding: 0px;
}
.card p {
	margin: 0px;
}
.carousel-item img {
	height: 700px;
}
</style>
<div class="container">
	<div class="body-container">	
		<div>
			<h3> ${kwd}에 대한 검색 결과 </h3>
			<hr>
			<div class="row justify-content-between">
				<span class="col">검색 결과 ${dataCount}건</span>
				<div class="col text-end">
					<button type="button" class="btn listTypebtn1 active" data-bs-toggle="button">가나다순</button>
					<button type="button" class="btn listTypebtn2" data-bs-toggle="button">인기순</button>
				</div>
			</div>
			<br>
		</div>
		
		<div class="body-main">
			<p>전체글</p>
			<div class="list-content" data-pageNo="0" data-totalPage="0"></div>
			<div class="list-footer mt-2 text-end">
				<span class="more-btn btn btn-light">&nbsp;더보기&nbsp;<i class="bi bi-chevron-down"></i>&nbsp;</span>
			</div>
		</div>
	</div>
</div>
<script>
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
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


$(function(){
	listPage(1);
});

function listPage(page) {
	let url='${pageContext.request.contextPath}/info/searchList';
	let formData="schType=${schType}&kwd=${kwd}&dataCount=${dataCount}&pageNo="+page;
	const fn=function(data) {
		addNewContent(data);
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}

function popularListPage(page) {
	let url='${pageContext.request.contextPath}/info/searchPopularList';
	let formData="schType=${schType}&kwd=${kwd}&dataCount=${dataCount}&pageNo="+page;
	
	const fn=function(data) {
		nextPopularList(data);
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}

function addNewContent(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	if(pageNo>=total_page) {
		$('.list-footer .more-btn').hide();
	}
	
	$('.list-content').attr('data-pageNo', pageNo);
	$('.list-content').attr('data-totalPage', total_page);

	let htmlText='<div class="row item-list">';
	for(let item of data.list) {
		let num = item.num;
		let region_Main = item.region_Main;
		let region_Sub = item.region_Sub;
		let contentId = item.contentId;
		let contentType = item.contentType;
		let name=item.name;
		let thumbnail=item.thumbnail;
		let main_Category=item.main_Category;
		let middle_Category=item.middle_Category;
		let sub_Category=item.sub_Category;
		let tags=item.tags;
		
		htmlText+='	<div class="col card" onclick="article('+num+','+contentId+');">';
		htmlText+='		<img src="'+thumbnail+'" class="card-img-top" alt="...">';
		htmlText+='		<div class="card-body">';
		htmlText+='			<p>'+name+'</p>';
		htmlText+='			<p class="card-text">'+region_Main+' '+region_Sub+'</p><footer>';
		tags.forEach((tag)=>{
			htmlText+='			<span>#'+tag+'</span>';		
		})
		htmlText+='		</footer></div>';
		htmlText+='	</div>';
	}
	htmlText+='</div><br>';
	$(".list-content").append(htmlText);
}

function nextPopularList(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	
	$('.list-content').attr('data-pageNo', pageNo);
	$('.list-content').attr('data-totalPage', total_page);

	let htmlText='<div class="row item-list">';
	
	for(let item of data.list) {
		let num = item.num;
		let region_Main = item.region_Main;
		let region_Sub = item.region_Sub;
		let contentId = item.contentId;
		let contentType = item.contentType;
		let name=item.name;
		let thumbnail=item.thumbnail;
		let main_Category=item.main_Category;
		let middle_Category=item.middle_Category;
		let sub_Category=item.sub_Category;
		let tags=item.tags;
		
		htmlText+='	<div class="col card" onclick="article('+num+','+contentId+');">';
		htmlText+='		<img src="'+thumbnail+'" class="card-img-top" alt="...">';
		htmlText+='		<div class="card-body">';
		htmlText+='			<p>'+name+'</p>';
		htmlText+='			<p class="card-text">'+region_Main+' '+region_Sub+'</p><footer>';
		tags.forEach((tag)=>{
			htmlText+='			<span>#'+tag+'</span>';		
		})
		htmlText+='		</footer></div>';
		htmlText+='	</div>';
	}
	htmlText+='</div><br>';
	$(".list-content").append(htmlText);	
}

$(function(){
	$('.listTypebtn1').click(function() {
		$('.listTypebtn2').removeClass("active");
		$('.list-content').html("");
		listPage(1);
	});
	
	$('.listTypebtn2').click(function() {
		$('.listTypebtn1').removeClass("active");
		$('.list-content').html("");
		popularListPage(1);
	});
	
	$('.list-footer .more-btn').click(function(){
		let pageNo = $('.list-content').attr('data-pageNo');
		let total_page = $('.list-content').attr('data-totalPage');
		pageNo++;
		if(pageNo>=total_page) {
			$('.list-footer .more-btn').hide();
			listPage(pageNo);
		} else {
			listPage(pageNo);
		}
	});
	
	$('.popular-list-footer .more-btn').click(function(){
		let pageNo = $('.list-content').attr('data-pageNo');
		let total_page = $('.list-content').attr('data-totalPage');
		
		pageNo++;
		if(pageNo>=total_page) {
			$('.list-footer .more-btn').hide();
			popularListPage(pageNo);
		} else {
			popularListPage(pageNo);
		}
	});
});

function article(contentId, contentType, thumbnail) {
	location.href="${pageContext.request.contextPath}/info/load?contentId="+contentId+"&contentType="+contentType+"&thumbnail="+thumbnail;
}
</script>