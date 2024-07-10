<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 후기 작성하기</title>
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
        .form-container form textarea,
        .form-container form button,
        .form-container form input[type="file"] {
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
    </style>
</head>
<body>
    <div class="container">
        <div class="body-container">
            <div class="post-title">
                여행 후기 작성하기
            </div>

            <div class="form-container">
                <form action="${pageContext.request.contextPath}/post/submit" method="post" enctype="multipart/form-data">
                    <input type="text" name="title" placeholder="제목을 입력하세요" required>
                    <textarea name="content" placeholder="내용을 입력하세요" required></textarea>
                    <input type="file" name="files" multiple>
                    <button type="submit">작성하기</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
