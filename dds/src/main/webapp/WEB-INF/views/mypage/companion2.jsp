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
                <button class="nav-link active" id="tab-1" data-tab="tab-pane-1" type="button" role="tab" aria-controls="pane-1" aria-selected="true">대기중</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tab-2" data-tab="tab-pane-2" type="button" role="tab" aria-controls="pane-2" aria-selected="false">참여중</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tab-3" data-tab="tab-pane-3" type="button" role="tab" aria-controls="pane-3" aria-selected="false">지난동행</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="tab-4" data-tab="tab-pane-4" type="button" role="tab" aria-controls="pane-4" aria-selected="false">내가 쓴 동행</button>
            </li>
        </ul>

        <div class="tab-content-container">
            <div id="tab-pane-1" class="tab-content active">
                <div class="content-container">
                    <div class="content-card">
                        <img src="https://via.placeholder.com/300x200" alt="Content Image">
                        <div class="card-body">
                            <h5>8월 19일부터 25일 6박 7일 홈스골 지역 동행인구해요!!</h5>
                            <div class="meta">
                                <span><i class="bi bi-person-circle"></i>&nbsp;yunsu...</span>
                                <span>20대 · 여자</span>
                                <span class="location">순천</span>
                            </div>
                        </div>
                    </div>
                    <!-- 추가 카드 예시 -->
                    <div class="content-card">
                        <img src="https://via.placeholder.com/300x200" alt="Content Image">
                        <div class="card-body">
                            <h5>8월 19일부터 25일 6박 7일 홈스골 지역 동행인구해요!!</h5>
                            <div class="meta">
                                <span><i class="bi bi-person-circle"></i>yunsu...</span>
                                <span>20대 · 여자</span>
                                <span class="location">순천</span>
                            </div>
                        </div>
                    </div>
                    <div class="content-card">
                        <img src="https://via.placeholder.com/300x200" alt="Content Image">
                        <div class="card-body">
                            <h5>8월 19일부터 25일 6박 7일 홈스골 지역 동행인구해요!!</h5>
                            <div class="meta">
                                <span><i class="bi bi-person-circle"></i>yunsu...</span>
                                <span>20대 · 여자</span>
                                <span class="location">순천</span>
                            </div>
                        </div>
                    </div>
                    <div class="content-card">
                        <img src="https://via.placeholder.com/300x200" alt="Content Image">
                        <div class="card-body">
                            <h5>8월 19일부터 25일 6박 7일 홈스골 지역 동행인구해요!!</h5>
                            <div class="meta">
                                <span><i class="bi bi-person-circle"></i>yunsu...</span>
                                <span>20대 · 여자</span>
                                <span class="location">순천</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tab-pane-2" class="tab-content">
                <!-- 참여중 컨텐츠 -->
            </div>
            <div id="tab-pane-3" class="tab-content">
                <!-- 지난동행 컨텐츠 -->
            </div>
            <div id="tab-pane-4" class="tab-content">
                <!-- 내가 쓴 동행 컨텐츠 -->
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const tabs = document.querySelectorAll(".nav-link");
        const contents = document.querySelectorAll(".tab-content");

        tabs.forEach(tab => {
            tab.addEventListener("click", function() {
                tabs.forEach(t => t.classList.remove("active"));
                this.classList.add("active");

                contents.forEach(content => content.classList.remove("active"));
                document.getElementById(this.getAttribute("data-tab")).classList.add("active");
            });
        });
    });
</script>
