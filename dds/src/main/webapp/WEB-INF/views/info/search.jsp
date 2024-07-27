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
} *	{
	padding: 0px;
	margin: 0px;
	box-sizing: border-box;
}
.container {
	background-color: white;
}
.body-container {
	max-width: 800px;
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
    	font-weight: bold;
    }
</style>
<div class="container border border-top-0 border-bottom-0">
			<div>
			<h2 class="ms-5 mt-3 color-text"> ${kwd}에 대한 검색 결과 </h2>
			<hr>
			<div class="row justify-content-between">
				<h2 class="ms-5 col color-text">검색 결과 ${dataCount}건</h2>
				<div class="col text-end">
					<button type="button" class="btn listTypebtn1 active" data-bs-toggle="button">가나다순</button>
					<button type="button" class="btn listTypebtn2" data-bs-toggle="button">인기순</button>
				</div>
			</div>
			<br>
		</div>
	<div class="body-container">	

		
		<div class="body-main">
			<div class="list-content" data-pageNo="0" data-totalPage="0"></div>
			<div class="list-footer text-end">
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
	$('.listTypebtn1').addClass("active");
	
	let url='${pageContext.request.contextPath}/info/searchList';
	let formData="schType=${schType}&kwd=${kwd}&dataCount=${dataCount}&pageNo="+page;
	const fn=function(data) {
		addNewContent(data);
	};
	ajaxFun(url, 'get', formData, 'json', fn);
}

function popularListPage(page) {
	$('.listTypebtn2').addClass("active");
	
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
	for(let index=0;index<data.list.length;index++) {
		if(index%4==0&&index>0) {
			htmlText+='</div><br>';
			htmlText+='<div class="row item-list">';
		}
		let num = data.list[index].num;
		let region_Main = data.list[index].region_Main;
		let region_Sub = data.list[index].region_Sub;
		let contentId = data.list[index].contentId;
		let contentType = data.list[index].contentType;
		let name=data.list[index].name;
		let thumbnail=data.list[index].thumbnail;
		let main_Category=data.list[index].main_Category;
		let middle_Category=data.list[index].middle_Category;
		let sub_Category=data.list[index].sub_Category;
		let tags=data.list[index].tags;
		
		htmlText+='<div class="col">';
		htmlText+='	<div class="travel-info-item" onclick="article('+num+','+contentId+');">';
		htmlText+='	<img src="'+thumbnail+'" alt="...">';
		htmlText+='	<div class="travel-info-item-body">';
		htmlText+='		<a class="travel-info-item-title" href="">'+name+'</a>';
		htmlText+='		<p class="travel-info-item-location">';
		htmlText+='		<i class="bi bi-geo-alt-fill">'+region_Main+' '+region_Sub+'</i></p>';
		tags.forEach((tag)=>{
		htmlText+='		<span class="travel-info-item-tags">#'+tag+'</span>';
		});
		htmlText+='</div></div></div>';
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
	
	for(let index=0;index<data.list.length;index++) {
		if(index%4==0&&index>0) {
			htmlText+='</div><br>';
			htmlText+='<div class="row item-list">';
		}
		let num = data.list[index].num;
		let region_Main = data.list[index].region_Main;
		let region_Sub = data.list[index].region_Sub;
		let contentId = data.list[index].contentId;
		let contentType = data.list[index].contentType;
		let name=data.list[index].name;
		let thumbnail=data.list[index].thumbnail;
		let main_Category=data.list[index].main_Category;
		let middle_Category=data.list[index].middle_Category;
		let sub_Category=data.list[index].sub_Category;
		let tags=data.list[index].tags;
		
		htmlText+='<div class="col">';
		htmlText+='	<div class="travel-info-item" onclick="article('+num+','+contentId+');">';
		htmlText+='	<img src="'+thumbnail+'" alt="...">';
		htmlText+='	<div class="travel-info-item-body">';
		htmlText+='		<a class="travel-info-item-title" href="">'+name+'</a>';
		htmlText+='		<p class="travel-info-item-location">';
		htmlText+='		<i class="bi bi-geo-alt-fill">'+region_Main+' '+region_Sub+'</i></p>';
		tags.forEach((tag)=>{
		htmlText+='		<span class="travel-info-item-tags">#'+tag+'</span>';
		});
		htmlText+='</div></div></div>';
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
		
		if($(".listTypebtn1").hasClass("active") === true) {
			if(pageNo>=total_page) {
				$('.list-footer .more-btn').hide();
				listPage(pageNo);
			} else {
				listPage(pageNo);
			}
		} else if($(".listTypebtn2").hasClass("active") === true) {	
			if(pageNo>=total_page) {
				$('.list-footer .more-btn').hide();
				popularListPage(pageNo);
			} else {
				popularListPage(pageNo);
			}
		}
	});
});

function article(num, contentId) {
	location.href="${pageContext.request.contextPath}/info/load?num="+num+"&contentId="+contentId;
}
</script>