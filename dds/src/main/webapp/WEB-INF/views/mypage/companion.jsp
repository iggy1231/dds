<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

	.col-md-4 {
    padding: 0; /* 부모 요소의 패딩을 제거 */
	}
	
    .content-card {
        border: 1px solid #ddd;
        border-radius: 10px;
        overflow: hidden;
        margin: 10px 0; /* 상하 마진만 설정하여 좌우 여백 제거 */
    	width: calc(100% - 15px); /* 부모 요소의 너비를 모두 차지하도록 설정 */
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
        font-size: 1rem;
        color: #777;
        display: flex;
        align-items: center;
    }
    
    .content-card .card-body .meta img {
            width: 40px; /* 원하는 크기로 조정하세요 */
            height: 40px; /* 원하는 크기로 조정하세요 */
            border-radius: 50%; /* 원형으로 만들기 */
            object-fit: cover; /* 이미지 비율 유지 */
            margin-right: 10px;
        }
    
    .content-card .card-body .meta .nickname {
            font-size: 14px; /* 닉네임 크기 조정 */
            margin-right: 5px;
        }
    
    .content-card .card-body .meta .details {
            font-size: 12px; /* 나이, 성별, 지역 정보 크기 조정 */
            display: flex;
            align-items: center;
        }
        
    .content-card .card-body .meta .location {
        margin-left: auto;
        font-size: 1rem;
    }
    .content-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .content-card:hover {
    	cursor: pointer; 
    }
    .tab-content {
        display: none;
    }
    .tab-content.active {
        display: block;
    }
    
    @media (max-width: 1200px) {
    .content-card {
        width: calc(100% - 15px); /* 반응형에서도 부모 요소에 꽉 차도록 설정 */
    }
}

@media (max-width: 768px) {
    .content-card {
        width: calc(100% - 15px); /* 반응형에서도 부모 요소에 꽉 차도록 설정 */
    }
}

.text-primary {
	color: #18A8F1 !important;
}

.age-gender {
        font-size: 1rem; /* 기본 폰트 크기 */
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
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-ing" type="button" role="tab" aria-controls="tab-ing" aria-selected="false">참여중</button>
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
            <div class="tab-content" id="tab-ing"></div>
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
    		if(tab === "tab-waiting") {
    			listWaitingCompanion(1);
    		} else if(tab === "tab-ing") {
    			listIngCompanion(1);
    		} else if(tab === "tab-past") {
    			listPastCompanion(1);
    		} else if(tab === "tab-my-posts") {
    			listMyCompanion(1);
    		}
        });
    });

    function companionArticle(num) {
    	location.href='${pageContext.request.contextPath}/companion/article?num='+num;
    }
    
    function listWaitingCompanion(page) {
    	let url = '${pageContext.request.contextPath}/mypage/waitingCompanion';
    	
    	const fn = function(data) {
    		$('#tab-waiting').html(data);
    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }

    function listIngCompanion(page) {
    	let url = '${pageContext.request.contextPath}/mypage/ingcompanion';
    	
    	const fn = function(data) {
    		$('#tab-ing').html(data);
    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }
    function listPastCompanion(page) {
    	let url = '${pageContext.request.contextPath}/mypage/pastcompanion';
    	
    	const fn = function(data) {
    		$('#tab-past').html(data);
    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }
    function listMyCompanion(page) {
    	let url = '${pageContext.request.contextPath}/mypage/mycompanion';
    	
    	const fn = function(data) {
    		$('#tab-my-posts').html(data);
    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }
</script>
