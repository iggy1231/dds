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

        .action-buttons-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .back-button {
            display: inline-block;
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

        .action-buttons {
            display: flex;
        }

        .action-buttons a {
            display: inline-block;
            padding: 12px 20px;
            margin-left: 10px;
            border: none;
            border-radius: 25px;
            background-color: #18A8F1;
            color: white;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .action-buttons a:hover {
            background-color: #0d6efd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .comment-section {
            margin-top: 30px;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .comment-section h2 {
            font-size: 24px;
            margin-bottom: 15px;
            border-bottom: 2px solid #18A8F1;
            padding-bottom: 5px;
        }

        .comment-form {
            margin-top: 10px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .comment-form table {
            width: 100%;
        }

        .comment-form table td {
            padding: 5px;
        }

        .comment-form textarea {
            width: calc(100% - 20px);
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            resize: vertical;
            font-size: 14px;
            line-height: 1.6;
        }

        .comment-form input[type="submit"] {
            background-color: #18A8F1;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .comment-form input[type="submit"]:hover {
            background-color: #0d6efd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .comment-list {
            margin-top: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .comment {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #ffffff;
        }

        .comment-header {
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
            color: #333;
        }

        .comment-content {
            font-size: 14px;
            line-height: 1.6;
            color: #555;
        }

        .back-link {
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #18A8F1;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
    <script type="text/javascript">
        function confirmDelete() {
            if (confirm("정말로 삭제하시겠습니까?")) {
                window.location.href = "${pageContext.request.contextPath}/travelreview/delete?num=${dto.num}&page=${page}";
            }
        }

        function validateReplyForm(form) {
            var content = form.content.value.trim();
            if (content === '') {
                alert('댓글 내용을 입력해주세요.');
                return false;
            }
            return true;
        }
    </script>
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
                <a href="${pageContext.request.contextPath}/travelreview/update?num=${dto.num}&page=${page}" class="edit-button">수정</a>
                <a href="#" onclick="confirmDelete()" class="delete-button">삭제</a>
            </div>
        </div>
    </div>

    <div class="comment-section">
        <h2>댓글을 사용할 때는 타인을 존중하고 커뮤니티 가이드를 준수해야 합니다(욕설 바로 고소 합니다.)</h2>

        <div class="comment-form">
            <form method="post" action="${pageContext.request.contextPath}/travelreview/insertReply" onsubmit="return validateReplyForm(this)">
                <input type="hidden" name="num" value="${dto.num}">
                <input type="hidden" name="page" value="${page}">
                <input type="hidden" name="schType" value="${schType}">
                <input type="hidden" name="kwd" value="${kwd}">
                
                <table>
                    <tr>
                        <td>닉네임</td>
                        <td><input type="text" name="nickname" value="${sessionScope.member.nickName}" readonly></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea name="content" rows="5" placeholder="댓글을 입력해주세요." required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="등록">
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="comment-list">
            <c:forEach var="comment" items="${comments}">
                <div class="comment">
                    <div class="comment-header">작성자: ${comment.nickname}</div>
                    <div class="comment-content">${comment.content}</div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
