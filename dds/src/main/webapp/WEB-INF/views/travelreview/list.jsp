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
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .body-container {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        #bbs {
            font-size: 30px;
            color: #18A8F1;
            text-align: center;
            margin-bottom: 20px;
        }

        .box_rightType1 {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
        }

        .area_tagList {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .tag_list {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 5px; /* 줄어든 간격 설정 */
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .tag_list li {
            display: flex;
            justify-content: center;
        }

        .tag_list .btn {
            display: inline-block;
            padding: 5px 10px; /* 줄어든 패딩 설정 */
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f5f5f5;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 12px; /* 줄어든 폰트 크기 설정 */
        }

        .tag_list .btn:hover {
            background-color: #e0e0e0;
        }

        .tag_list .btn span {
            font-size: 12px;
            color: #333;
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
        }

        .form-select, .form-control, .btn-light {
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
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
            border: 1px solid #ccc;
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

        .post-title {
            text-align: center;
            color: #18A8F1;
            font-size: 30px;
            font-weight: 600;
            margin-top: 20px;
        }

        .form-container {
            margin: 20px 0;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .form-container form input, 
        .form-container form textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }

        .form-container form textarea {
            resize: vertical;
            height: 150px;
        }

        .form-container form button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #18A8F1;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-container form button:hover {
            background-color: #0d6efd;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="body-container">
            <div id="bbs" class="inner-page">
                여행 후기 게시판
            </div>

            <div class="box_rightType1">
                <div class="area_tagList">
                    <ul class="tag_list area_list js_one" id="arealist">
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
                        <li id="39"><button type="button" class="btn"><span>#제주</span></button></li>
                    </ul>
                </div>
            </div>

            <form class="search-form" name="searchForm" action="${pageContext.request.contextPath}/clinic/list" method="post">
                <div class="col-auto p-1">
                    <select name="schType" class="form-select">
                        <option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
                        <option value="title" ${schType=="title"?"selected":""}>제목</option>
                        <option value="content" ${schType=="content"?"selected":""}>내용</option>
                    </select>
                </div>
                <div class="col-auto p-1">
                    <input type="text" name="kwd" value="${kwd}" class="form-control" placeholder="원하는 키워드를 입력하실래요?">
                </div>
                <div class="col-auto p-1">
                    <button type="button" class="btn btn-light" onclick="searchList()" title="검색">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
            </form>

            <div class="create-post-button">
                <form action="${pageContext.request.contextPath}/travelreview/create" method="get">
                    <button type="submit">여행 후기 작성하기</button>
                </form>
            </div>
            <div>
            	${dataCount}
            </div>
        </div>
    </div>
</body>
</html>
