<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.text-primary {
	color: #696cff !important;
}

/* 버튼 기본 스타일 */
.btn {
    background-color: white; /* 기본 배경색: 하얀색 */
    color: #696cff; /* 기본 텍스트 색상: 검정색 */
    border-radius: 8px; /* 테두리 둥글게 */
    padding: 10px 20px; /* 버튼 여백 */
    cursor: pointer; /* 커서 포인터 */
    transition: background-color 0.3s, color 0.3s; /* 색상 전환 애니메이션 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3); /* 박스 그림자 */
    scale: 0.9;
}


.btn2 {
	background-color: white; /* 기본 배경색: 하얀색 */
    color: #bdbdbd; /* 기본 텍스트 색상: 검정색 */
    border: 1px solid #BDBDBD;
    border-radius: 8px; /* 테두리 둥글게 */
    padding: 10px 20px; /* 버튼 여백 */
    cursor: pointer; /* 커서 포인터 */ 
    scale: 0.9;
}

/* 버튼 클릭 시 스타일 */
.btn:active {
    background-color: white; /* 클릭 시 배경색: primary 색상 */
    color: black; /* 클릭 시 텍스트 색상: 하얀색 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 클릭 시 박스 그림자 변경 */
}

/* 버튼 hover 시 스타일 */
.btn:hover {
    background-color: #696cff;
    color: white;
}
</style>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card">
			<div class="card-header">
			<div class="mt-2">
				<div class=" pt-0" id="myTabContent">
					<div class="ps-3 fw-semibold fs-3 text-center mb-3 text-primary">차단 리스트</div>
						<div class="table-responsice text-nowrap">
							<table class="table">
								<thead>
									<tr class="text-center"> 
										<th>차단 번호</th>
										<th>유저번호</th>
										<th>닉네임</th>
										<th>차단사유</th>
										<th>시작시간</th>
										<th>종료시간</th>
										<th>차단여부</th>
										<th>차단해제</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:forEach var="list" items="${list}" varStatus="status">
										<tr class="text-center">
											<td>${list.num}</td>
											<td>${list.user_num}</td>
											<td>${list.nickName} </td>
											<td>${list.reason} </td>
											<td>${list.ban_sdate}</td>
											<td>${list.ban_edate}</td>
											<td>${list.ban_state == 1 ? "차단 중" : "차단 해제"}</td>
											
											<c:choose>
												<c:when test="${list.ban_state == 1}">
													<td><button class="btn" type="button" onclick="unblock(${list.user_num})"> 차단 해제 </button></td>
												</c:when>
												<c:otherwise>
													<td><button class="btn2" disabled>차단 해제</button>
												</c:otherwise>
											</c:choose>
											

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

							<div class="col-auto pt-4 ps-4 text-start">${dataCount}개(${page}/${total_page} 페이지)</div>
						<div class="page-navigation">${dataCount == 0 ? "차단 목록 없음" : paging}
						</div>

					
					</div>
				</div>
				<!-- tab-content _ end -->
			</div>
			</div>
			<!-- body-main -->
		</div>
	</div>

<script>
    function unblock(userNum) {
        const contextPath = '${pageContext.request.contextPath}';
        const url = contextPath + '/admin/memberManage/unblock';

        // 동적으로 form 생성
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = url;

        // 유저 번호를 전송하기 위한 hidden input 생성
        const hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = 'user_num';
        hiddenField.value = userNum;

        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
    }
</script>