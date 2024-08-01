<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
    max-width: 1030px;
    margin: 0 auto;
    padding: 15px;
}

.body-title {
    text-align: center;
    margin-bottom: 20px;
}

.nav-tabss .nav-link {
    min-width: 170px;
    background: #f3f5f7;
    border-radius: 20px;
    color: #333;
    font-weight: 600;
    text-align: center;
}

.nav-tabss .nav-link.active {
    background: #18A8F1;
    color: #fff;
}

.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
}

.table th,
.table td {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}

.table-hover tbody tr:hover {
    color: #212529;
    background-color: rgba(0, 0, 0, 0.075);
}

.page-navigation,
.board-list-footer,
.board-list-header {
    margin: 20px 0;
    text-align: center;
}

.board-list-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$(function(){
    let menu = "${category}";
    $("#tab-" + menu).addClass("active");

    $("button[role='tab']").on("click", function(e){
        const tab = $(this).attr("data-tab");
        let url = "${pageContext.request.contextPath}/event/" + tab + "/list";
        location.href = url;
    });
});

function searchList() {
    const f = document.searchForm;
    f.submit();
}
</script>

<div class="container">
    <div class="body-container mt-3">
        <div>
            <h3 style="font-weight: bold; color: #18A8F1"> EVENT </h3>
        </div>
        
        <div class="body-main">
            <ul class="nav nav-tabss justify-content-center" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tab-progress" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="progress" aria-selected="true" data-tab="progress">진행중인 이벤트</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tab-winner" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="winner" aria-selected="false" data-tab="winner">당첨자 발표</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tab-ended" data-bs-toggle="tab" data-bs-target="#nav-content" type="button" role="tab" aria-controls="ended" aria-selected="false" data-tab="ended">종료된 이벤트</button>
                </li>
            </ul>
            
            <div class="tab-content pt-2" id="nav-tabContent">
                <div class="row board-list-header">
                    <div class="col-auto me-auto">
                        ${dataCount}개(${page}/${total_page} 페이지)
                    </div>
                    <div class="col-auto">&nbsp;</div>
                </div>                
                
                
                <table class="table table-hover board-list">
                    <thead class="">
                        <tr>
                            <th width="60">번호</th>
                            <th>제목</th>
                            <th width="170">시작일</th>
                            <th width="170">종료일</th>
                            <th width="70">${category == "winner" ? "발표" : "조회수"}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${list}" varStatus="status">
                            <tr>
                                <td>${dataCount - (page - 1) * size - status.index}</td>
                                <td class="left">
                                    <a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.title}</a>
                                </td>
                                <td>${dto.startDate}</td>
                                <td>${dto.endDate}</td>
                                <td>${category == "winner" ? (dto.winnerCount == 0 ? "예정" : "완료") : dto.hitCount}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <div class="page-navigation">
                    ${dataCount == 0 ? "등록된 이벤트가 없습니다." : paging}
                </div>
    
                <div class="row board-list-footer d-flex justify-content-center align-items-center">
    <div class="text-center d-flex justify-content-center" style="width: 600px;">
        <form class="row" name="searchForm" action="${pageContext.request.contextPath}/event/${category}/list" method="post">
            <div class="col-auto p-1">
                <select name="schType" class="form-select">
                    <option value="all" ${schType == "all" ? "selected" : ""}>제목+내용</option>
                    <option value="startDate" ${schType == "startDate" ? "selected" : ""}>시작일</option>
                    <option value="endDate" ${schType == "endDate" ? "selected" : ""}>종료일</option>
                    <option value="winningDate" ${schType == "winningDate" ? "selected" : ""}>발표일</option>
                </select>
            </div>
            <div class="col-auto p-1">
                <input type="text" name="kwd" value="${kwd}" class="form-control">
            </div>
            <div class="col-auto p-1">
                <button type="button" class="btn btn-light" onclick="searchList()">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </form>
    </div>
    <div class="col-auto">
        <button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/event/${category}/list';" title="새로고침">
            <i class="bi bi-arrow-counterclockwise"></i>
        </button>
    </div>
</div>

            </div>
        </div>
    </div>
</div>
