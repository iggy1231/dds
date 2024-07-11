<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 후기 상세 페이지</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .post-title {
            color: #333;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 15px;
            border-bottom: 2px solid #18A8F1;
            padding-bottom: 10px;
        }

        .post-content {
            margin-top: 20px;
            font-size: 16px;
            line-height: 1.6;
            color: #555;
        }

        .post-info {
            margin-top: 20px;
            font-size: 14px;
            color: #777;
            display: flex;
            justify-content: space-between;
            border-top: 1px solid #eee;
            padding-top: 10px;
        }

        .post-info div {
            margin: 5px 0;
        }

        .back-button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            background-color: #18A8F1;
            color: white;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .back-button:hover {
            background-color: #0d6efd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .action-buttons-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 20px;
        }

        .action-buttons {
            display: flex;
            align-items: center;
        }

        .action-buttons a {
            margin-left: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .action-buttons a.edit-button {
            background-color: #28a745;
            color: white;
        }

        .action-buttons a.delete-button {
            background-color: #dc3545;
            color: white;
        }

        .action-buttons a:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="post">
            <div class="post-title">${dto.subject}</div>
            <div class="post-content">
                ${dto.content}
            </div>
            <div class="post-info">
                <div>작성자: ${dto.nickName}</div>
                <div>작성일: ${dto.reg_date}</div>
                <div>조회수: ${dto.hitCount}</div>
            </div>
        </div>

        <div class="action-buttons-container">
            <a href="${pageContext.request.contextPath}/travelreview/list" class="back-button">목록으로 돌아가기</a>
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/travelreview/update?num=${dto.num}" class="edit-button">수정</a>
                <a href="#" onclick="confirmDelete(${dto.num})" class="delete-button">삭제</a>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function confirmDelete(num) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                window.location.href = "${pageContext.request.contextPath}/travelreview/delete?num=" + num;
            }
        }
    </script>
</body>
</html>
