<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
    .answer-content {
        display: none;
    }
    .btnAnswerView i {
        transition: transform 0.3s;
    }
    .btnAnswerView.active i {
        transform: rotate(180deg);
    }
</style>

<div class="my-info">
	<div class="page-title">
		<div class="spacing-top"></div>
		<div class="content">
			<div class="title-row">
				<div class="title title--show">
					<h1 class="text">문의·리뷰</h1>
				</div>
				<div class="action-btn-area"></div>
			</div>
		</div>
		<div class="spacing-bottom"></div>

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab"
					data-bs-target="#tab-pane-1" type="button" role="tab"
					aria-controls="1" aria-selected="false">문의</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab"
					data-bs-target="#tab-pane-2" type="button" role="tab"
					aria-controls="2" aria-selected="false">리뷰</button>
			</li>
		</ul>

		 <div class="tab-content mt-3" id="nav-content">
        </div>

	</div>
</div>

<script>
$(function() {
    $(document).on('click', '.btnAnswerView', function() {
		var answerContent = $(this).closest('.border-bottom').find('.answer-content');
        answerContent.toggleClass('active');
        $(this).toggleClass('active');

        if (answerContent.hasClass('active')) {
            answerContent.css('display', 'block');
        } else {
            answerContent.css('display', 'none');
        }
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
    	listMyQnA(1);
    	
        $("button[role='tab']").on("click", function(e){
    		const tab = $(this).attr("aria-controls");
    		if(tab === "1") {
    			listMyQnA(1);
    		} else if(tab === "2") {
    			listMyReview(1);
    		}
        });
    });

    function listMyQnA(page) {
    	let url = '${pageContext.request.contextPath}/mypage/myQnA';
    	
    	const fn = function(data) {
    		$('.tab-content').html(data);

    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }

    function listMyReview(page) {
    	let url = '${pageContext.request.contextPath}/mypage/myReview';
    	
    	const fn = function(data) {
    		$('.tab-content').html(data);
    		
    	};
    	ajaxFun(url, "get", {pageNo : page}, "text", fn);
    }
</script>