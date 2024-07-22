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
					aria-controls="pane-1" aria-selected="false">문의</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab"
					data-bs-target="#tab-pane-2" type="button" role="tab"
					aria-controls="pane-2" aria-selected="false">리뷰</button>
			</li>
		</ul>

		<div class="tab-content mt-3">
			<div id="tab-pane-1" class="tab-pane fade show active">
				<div class="mt-1 border-bottom">
					<h5 class="p-1 fw-semibold fs-4">반려동물 동반 가능한가요?</h5>
					<h6 class="p-1 pb-1 fs-5">고*이</h6>
					<h6 class="p-1 fs-4">문의 내용입니다.</h6>
					<div class="row p-2 fs-5">
						<div class="col-auto pt-2 pe-0">
							<span class="text-secondary">답변대기</span>
						</div>
						<div class="col-auto pt-2 px-0">
							&nbsp;|&nbsp;<span>2024-07-12</span> |<span
								class="deleteQuestion" data-num="1">삭제</span>
						</div>
						<div class="col pt-2 text-end">
							<button class="btn btnAnswerView">
								<i class="bi bi-chevron-down"></i>
							</button>
						</div>
					</div>
					<div class="p-4 pt-0 answer-content">
						<div class="bg-light">
							<div class="p-3 pb-0">
								<label class="bg-primary text-white px-3 fs-5"> 관리자 </label> <label
									class="ps-2 fs-4">2024-07-12</label>
							</div>
							<div class="p-3 pt-2 fs-4">문의사항에 대한 답변입니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tab-content mt-3">
			<div id="tab-pane-2" class="tab-pane fade show">
				<div class="mt-1 border-bottom">
					<div class="row p-2">
						<h6 class="p-2 pb-1 fw-semibold fs-4">고*이</h6>
						<div class="col-auto pt-0 ps-2 pe-1 score-star">
							<span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
							<span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
							<span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
							<span class="item fs-6 on"><i class="bi bi-star-fill"></i></span>
							<span class="item fs-6"><i class="bi bi-star-fill"></i></span>
						</div>
						<div class="col text-end fs-5">
							<span>2024-07-12</span> |<span class="deleteReview" data-num="1">삭제</span>
						</div>
					</div>
					<h5 class="p-1 fs-4">리뷰 내용입니다. 리뷰 내용입니다.</h5>
					<div class="row gx-1 mt-2 mb-3 p-1">
						<div class="col-md-auto md-img">
							<img class="border rounded" src="https://via.placeholder.com/150">
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const answerViewButtons = document.querySelectorAll(".btnAnswerView");
        
        answerViewButtons.forEach(button => {
            button.addEventListener("click", function() {
                const answerContent = this.closest(".border-bottom").querySelector(".answer-content");
                answerContent.classList.toggle("active");
                this.classList.toggle("active");
                
                if (answerContent.classList.contains("active")) {
                    answerContent.style.display = "block";
                } else {
                    answerContent.style.display = "none";
                }
            });
        });
    });
</script>