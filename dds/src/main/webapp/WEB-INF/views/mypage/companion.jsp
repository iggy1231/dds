<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .content-card {
        border: 1px solid #ddd;
        border-radius: 10px;
        overflow: hidden;
        margin: 10px;
        width: calc(33% - 20px);
        float: left;
    }
    .content-card img {
        width: 100%;
        height: auto;
    }
    .content-card .card-body {
        padding: 10px;
    }
    .content-card .card-body h5 {
        font-size: 1.2rem;
        margin: 10px 0;
    }
    .content-card .card-body .meta {
        font-size: 0.9rem;
        color: #777;
        display: flex;
        justify-content: space-between;
    }
    .content-card .card-body .meta span {
        margin-right: 5px;
    }
    .content-card .card-body .meta .location {
        margin-left: auto;
    }
    .content-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .tab-content {
        display: none;
    }
    .tab-content.active {
        display: block;
    }
</style>

<div class="my-info">
    <div class="page-title">
        <div class="spacing-top"></div>
        <div class="content">
            <div class="title-row">
                <div class="title title--show">
                    <h1 class="text">두둥실 동행</h1>
                </div>
                <div class="action-btn-area"></div>
            </div>
        </div>
        <div class="spacing-bottom"></div>

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab-waiting" type="button" role="tab" aria-controls="tab-waiting" aria-selected="true">대기중</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-party" type="button" role="tab" aria-controls="tab-party" aria-selected="false">참여중</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-past" type="button" role="tab" aria-controls="tab-past" aria-selected="false">지난동행</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-my-posts" type="button" role="tab" aria-controls="tab-my-posts" aria-selected="false">내가 쓴 동행</button>
            </li>
        </ul>

        <div class="tab-content-container" id="nav-content">
            <div class="tab-content active" id="tab-waiting"></div>
            <div class="tab-content" id="tab-party"></div>
            <div class="tab-content" id="tab-past"></div>
            <div class="tab-content" id="tab-my-posts"></div>
        </div>
    </div>
</div>

<script>
    
    function ajaxFun(url, method, formData, dataType, fn, file = false) {
    	const settings = {
    			type: method, 
    			data: formData,
    			dataType:dataType,
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
    					login();
    					return false;
    				} else if(jqXHR.status === 400) {
    					alert('요청 처리가 실패 했습니다.');
    					return false;
    		    	}
    		    	
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
    	listWaitingCompanion(1);
    	
        $("button[role='tab']").on("click", function(e){
    		const tab = $(this).attr("aria-controls");
    		if(tab === "1") {
    			listWaitingCompanion(1);
    		} else if(tab === "2") {
    			listReply(1);
    		} else if(tab === "3") {
    			listReply(1);
    		} else if(tab === "4") {
    			listReply(1);
    		}
        });
    });

    function listWaitingCompanion(page) {
    	let url = '${pageContext.request.contextPath}/mypage/waitingCompanion';
    	
    	const fn = function(data) {
    		$('#tab-waiting').html(data);
    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }

    function listReply(page) {
    	let url = '${pageContext.request.contextPath}/mypage/reply';
    	
    	const fn = function(data) {
    		$('#tab-party').html(data);
    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }
</script>
