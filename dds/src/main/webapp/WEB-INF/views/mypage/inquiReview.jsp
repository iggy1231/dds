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
    
    .waitingAnswer {
    	color: #FE77AC;
    }
    
    .score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #D5D5D5; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #FFE400; }

    .review-item {
        display: flex;
        flex-direction: column;
        height: 100%;
    }
    .review-content {
        flex: 1;
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
    
    $('#nav-content').on('click', '.deleteQuestion', function() {
    	if (confirm('정말 삭제하시겠습니까?')) {
    		
    	var form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/mypage/deleteQna';
        
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'num';
        input.value = $(this).data('num');
        
        form.appendChild(input);

        document.body.appendChild(form);
        form.submit();
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
    	
    	$(document).on('click', '#listQnArecent', function(){
    		$('#listQnApast').removeClass("active");
    		listMyQnA(1);
    	});
    	
    	$(document).on('click', '#listQnApast', function(){
    		$('#listQnArecent').removeClass("active");
    		listPastMyQnA(1);
    	});
    	
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
    
    function listPastMyQnA(page) {
    	let url = '${pageContext.request.contextPath}/mypage/myPastQnA';
    	
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
    
    function printSummary(summary) {
        let count = summary.count;
        let ave = summary.ave;
        
        let score1 = summary.score1;
        let score2 = summary.score2;
        let score3 = summary.score3;
        let score4 = summary.score4;
        let score5 = summary.score5;
        let scoreRate1 = summary.scoreRate1;
        let scoreRate2 = summary.scoreRate2;
        let scoreRate3 = summary.scoreRate3;
        let scoreRate4 = summary.scoreRate4;
        let scoreRate5 = summary.scoreRate5;
        
        $(".product-reviewCount").text(count);
        $(".product-score").text("("+ave+" / 5)");
        $(".product-star .item").removeClass("on");
        let roundAve = Math.round(ave);
        for(let i=1; i<=roundAve; i++) {
            $(".product-star .item").eq(i-1).addClass("on");
        }
        
        $(".title-reviewCount").text("("+count+")");
        
        $(".review-score-star .item").removeClass("on");
        for(let i=1; i<=roundAve; i++) {
            $(".review-score-star .item").eq(i-1).addClass("on");
        }
        $(".review-score").text(ave+" / 5");
        $(".review-reviewCount").text(count);
        
        // Update the graph based on score rates
        updateGraph(".review-rate .score-5", scoreRate5);  // 수정된 부분
        updateGraph(".review-rate .score-4", scoreRate4);  // 수정된 부분
        updateGraph(".review-rate .score-3", scoreRate3);  // 수정된 부분
        updateGraph(".review-rate .score-2", scoreRate2);  // 수정된 부분
        updateGraph(".review-rate .score-1", scoreRate1);  // 수정된 부분
    }

    function updateGraph(selector, percentage) {
        $(selector + " .one-space").removeClass("on");
        for(let i=1; i<=Math.floor(percentage / 10); i++) {
            $(selector + " .one-space").eq(i-1).addClass("on");
        }
        $(selector + " .graph-rate").text(percentage + "%");
    }

</script>