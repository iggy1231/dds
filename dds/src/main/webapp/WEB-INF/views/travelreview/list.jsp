<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 후기 게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f4f4f9;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            display: flex; /* Flex 컨테이너로 변경 */
            justify-content: space-between; /* 사이드 이미지와 콘텐츠 사이의 공간을 최대화 */
        }

        .body-container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            flex: 1; /* 중앙 콘텐츠가 넓게 차지하도록 설정 */
        }

        #bbs {
            font-size: 30px;
            color: #18A8F1;
            text-align: center;
            margin-bottom: 20px;
        }

        .board-list {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .board-list th, .board-list td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .board-list th {
            background-color: #f9f9f9;
        }

        .board-list td a {
            color: #333;
            text-decoration: none;
        }

        .board-list td a:hover {
            text-decoration: underline;
        }

        .page-navigation {
            text-align: center;
            margin-top: 20px;
        }

        .area_tagList {
            display: flex;
            flex-wrap: wrap; /* 태그 리스트를 한 줄로 나열하되, 필요 시 줄 바꿈 */
            gap: 10px;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .tag_list li {
            display: inline-block;
        }

        .tag_list .btn {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f5f5f5;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
        }

        .tag_list .btn:hover {
            background-color: #e0e0e0;
        }

        .tag_list .btn span {
            color: #333;
        }

        .tag_list .btn#39 {
            flex: 0 1 auto; /* 제주 버튼의 크기를 조정 */
        }

        .search-form {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-form .form-select,
        .search-form .form-control {
            margin: 0 10px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-select {
            width: 150px;
        }

        .form-control {
            width: 600px;
        }

        .btn-light {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f5f5f5;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-light:hover {
            background-color: #e0e0e0;
        }

        .btn-light i {
            font-size: 20px;
        }

        .create-post-button {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .create-post-button button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #18A8F1;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .create-post-button button:hover {
            background-color: #0d6efd;
        }

        /* 좌측 사이드 이미지 스타일 */
        .left-side-image {
            width: 150px;
            margin-right: 20px;
        }

        /* 우측 사이드 이미지 스타일 */
        .rightImage {
            width: 150px;
            margin-left: 20px;
        }
    </style>
</head>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

<body>
    <div class="container">
        <!-- 좌측 사이드 이미지 -->
        <img src="${pageContext.request.contextPath}/image/80478_149497_1813.jpg" alt="Left Side Image" class="left-side-image">

        <div class="body-container">
            <div id="bbs" class="inner-page">
                여행 후기 게시판
            </div>

            <div class="area_tagList">
                <ul class="tag_list">
                    <li id="1"><button type="button" class="btn"><span>#서울</span></button></li>
                    <li id="6"><button type="button" class="btn"><span>#부산</span></button></li>
                    <li id="4"><button type="button" class="btn"><span>#대구</span></button></li>
                    <li id="2"><button type="button" class="btn"><span>#인천</span></button></li>
                    <li id="5"><button type="button" class="btn"><span>#대전</span></button></li>
                    <li id="3"><button type="button" class="btn"><span>#광주</span></button></li>
                    <li id="7"><button type="button" class="btn"><span>#울산</span></button></li>
                    <li id="8"><button type="button" class="btn"><span>#세종</span></button></li>
                    <li id="31"><button type="button" class="btn"><span>#경기</span></button></li>
                    <li id="32"><button type="button" class="btn"><span>#강원</span></button></li>
                    <li id="33"><button type="button" class="btn"><span>#충북</span></button></li>
                    <li id="34"><button type="button" class="btn"><span>#충남</span></button></li>
                    <li id="35"><button type="button" class="btn"><span>#경북</span></button></li>
                    <li id="36"><button type="button" class="btn"><span>#경남</span></button></li>
                    <li id="37"><button type="button" class="btn"><span>#전북</span></button></li>
                    <li id="38"><button type="button" class="btn"><span>#전남</span></button></li>
                    <li id="39"><button type="button" class="btn" id="jeju"><span>#제주</span></button></li>
                </ul>
            </div>

            <table class="board-list">
                <thead>
                    <tr>
                        <th width="60">번호</th>
                        <th>제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                        <th width="70">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${list}" varStatus="status">
                        <tr>
                            <td>${dataCount - (page-1) * size - status.index}</td>
                            <td class="left">
                                <a href="${pageContext.request.contextPath}/travelreview/article?num=${dto.num}&page=${page}">${dto.subject}</a>
                            </td>
                            <td>${dto.nickName}</td>
                            <td>${dto.reg_date}</td>
                            <td>${dto.hitCount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="page-navigation">
                <!-- 페이지 네비게이션 내용 -->
            </div>

            <form class="search-form" name="searchForm" action="${pageContext.request.contextPath}/travelreview/list" method="post">
                <select name="schType" class="form-select">
                    <option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
                    <option value="title" ${schType=="title"?"selected":""}>제목</option>
                    <option value="content" ${schType=="content"?"selected":""}>내용</option>
                </select>
                <input type="text" name="kwd" value="${kwd}" class="form-control" placeholder="원하는 키워드를 입력하실래요?">
                <button type="button" class="btn btn-light" onclick="searchList()" title="검색">
                    <i class="bi bi-search"></i>
                </button>
            </form>

            <div class="create-post-button">
                <form action="${pageContext.request.contextPath}/travelreview/create" method="get">
                    <button type="submit">여행 후기 작성하기</button>
                </form>
            </div>
        </div>

        <img src="${pageContext.request.contextPath}/image/jv12595050.jpg" alt="jv12595050 Image" class="rightImage">
    </div>
</body>
</html>