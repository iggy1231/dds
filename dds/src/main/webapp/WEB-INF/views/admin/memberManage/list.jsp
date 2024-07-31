<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* 테이블 헤더 스타일 */
th { /* 추가된 부분 */
    font-size: 1em !important; /* 글씨 크기 */
    font-weight: bold !important; /* 글씨 굵게 */
} 

/* 회원수와 검색 폼을 space-between으로 배치 */
.header-container { /* 추가된 부분 */
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 1rem;
}

.btn1 {
    background-color: white; /* 기본 배경색: 하얀색 */
    color: #696cff; /* 기본 텍스트 색상: 검정색 */
    border: 1px solid #696cff;
    border-radius: 8px; /* 테두리 둥글게 */
    padding: 10px 20px; /* 버튼 여백 */
    cursor: pointer; /* 커서 포인터 */
    transition: background-color 0.3s, color 0.3s; /* 색상 전환 애니메이션 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); /* 박스 그림자 */
    scale: 0.9;
}

/* 버튼 클릭 시 스타일 */
.btn1:active {
    background-color: white; /* 클릭 시 배경색: primary 색상 */
    color: black; /* 클릭 시 텍스트 색상: 하얀색 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 클릭 시 박스 그림자 변경 */
}

/* 버튼 hover 시 스타일 */
.btn1:hover {
    background-color: #696cff;
    color: white;
}
</style>

 <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
            	<!-- Hoverable Table rows -->
              <div class="card">
                <h5 class="card-header ps-3 fw-semibold fs-3 text-center mb-3 text-primary">회원관리</h5>
                <div class="header-container"> <!-- 추가된 부분 -->
                <p> 회원수 : ${dataCount} </p>
                <form class="row" name="searchForm" method="get" id="searchForm"> <!-- 수정된 부분 -->
                    <div class="col-auto p-1">
                        <select name="schType" id="searchType" class="form-select">
                            <option value="all" ${schType=="all"?"selected":""}>전체</option>
                            <option value="userId" ${schType=="userId"?"selected":""}>아이디</option>
                            <option value="nickname" ${schType=="nickname"?"selected":""}>닉네임</option>
                            <option value="email" ${schType=="email"?"selected":""}>이메일</option>
                        </select>
                    </div>
                    <div class="col-auto p-1">
                        <input type="text" name="kwd" id="searchKeyword" value="${kwd}" class="form-control">
                    </div>
                    <div class="col-auto p-1">
                        <button type="submit" class="btn btn-light btn-search">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </form>
            </div>
                <div class="table-responsive text-nowrap">
                  <table class="table table-hover">
                    <thead>
                      <tr class="text-center table-primary">
                      	<th><input type="checkbox" id="checkAll"></th>                	
                        <th>user_num</th>
                        <th>userId</th>
                        <th>nickname</th>
                        <th>reg_date</th>
                        <th>email</th>
                        <th>gender</th>
                        <th>tel</th>
                        <th>계정 상태</th>
                        <th>차단 기간</th> <!-- 차단 기간 열 추가 -->
                        <th>차단 사유</th> <!-- 차단 사유 열 추가 -->
                        <th>차단</th> 
                      </tr>
                    </thead>
                    
                    <c:forEach var="list" items="${list}">
                    <tbody class="table-border-bottom-0">
                      <tr>
                    <form name="banForm" action="${pageContext.request.contextPath}/admin/memberManage/ban" method="post">
                        <td><input type="checkbox" name="selectedUsers" value="${list.user_num}"></td>
                        <td><strong>${list.user_num}</strong></td>
                        <td>${list.userId}</td>
                        <td>${list.nickName}</td>
                        <td>${list.reg_date}</td>
                        <td>${list.email }</td>
                        <td>${list.gender }</td>
                        <td>${list.tel }</td>
                        <td> 
                         <c:choose>
                    <c:when test="${list.enabled == 0}">
                        <span class="badge bg-label-dark"><strong>탈 &nbsp;&nbsp;&nbsp;&nbsp; 퇴</strong></span>
                    </c:when>
                    <c:when test="${list.ban_state == 1}">
                        <span class="badge bg-label-danger"><strong>차 &nbsp;&nbsp;&nbsp;&nbsp; 단</strong></span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge bg-label-primary"><strong>정 &nbsp;&nbsp;&nbsp;&nbsp; 상</strong></span>
                    </c:otherwise>
                </c:choose>
                </td>
                        <td>
               				    <select name="ban_date" style="border-radius: 8px; border-color: #696cff;">
                                	<option value="1"> 1일 </option>
                                	<option value="7"> 7일 </option>
                                	<option value="9999"> 영구 </option>
                                </select>
                        </td>
                        <td>
                        	<input type="text" name="reason" style="border-radius: 8px; border: 1px solid #696cff;"> <input type="hidden" name="user_num" value="${list.user_num}">
                        </td> 
                        <td> <button type="submit" class="btn1"> 차단</button> </td>
                    </form>
                      </tr>
                    </tbody>
                    </c:forEach>
                    
                    
                  </table>
                </div>
                
              <div class="page-navigation mt-3">${dataCount == 0 ? "회원 목록이 없습니다." : paging}
						</div>
              </div>
              <!--/ Hoverable Table rows -->
            </div>
          </div>

<script>
    document.getElementById('checkAll').addEventListener('change', function() {
        var checkboxes = document.querySelectorAll('input[name="selectedUsers"]');
        for (var checkbox of checkboxes) {
            checkbox.checked = this.checked;
        }
    });
</script>          
          