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
        
        .post-content img {
        	width: 100%;
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
            align-items: center; /* 세로 중앙 정렬을 위해 추가 */
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
        
        .like-button{
        	display: inline-block;
            padding: 12px 20px;
            margin-left: 10px;
            border: none;
            border-radius: 25px;
            background-color: #F0586A;
            color: white;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        
        .like-button:hover{
        	background-color: #F0586A;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .action-buttons a:hover {
            background-color: #0d6efd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .comment-section {
            margin: 0 auto;
            margin-top: 30px;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            max-width: 800px; /* 댓글 작성 폼의 최대 너비를 지정 */
            width: 90%;
        }

        .comment-section h2 {
            font-size: 20px;
            margin-bottom: 10px;
            border-bottom: 2px solid #18A8F1;
            padding-bottom: 5px;
        }

        .comment-form {
            margin-top: 10px;
            padding: 10px;
            background-color: #ffffff;
            border-radius: 5px;
        }

        .comment-form table {
            width: 100%;
        }

        .comment-form table td {
            padding: 5px;
        }

        .comment-form textarea {
            width: 100%;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            resize: vertical;
            font-size: 12px;
            line-height: 1.4;
        }

        .comment-form input[type="submit"] {
            background-color: #18A8F1;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .comment-form input[type="submit"]:hover {
            background-color: #0d6efd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .comment-list {
            margin-top: 20px;
            padding: 10px;
            background-color: #ffffff;
            border-radius: 5px;
        }

        .comment {
            margin-bottom: 10px;
            padding: 10px;
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

        .comment-buttons {
            margin-top: 10px;
        }

        .comment-buttons button {
            background-color: #18A8F1;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 12px;
            margin-right: 5px;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .comment-buttons .delete-button {
            background-color: #f44336; /* 삭제 버튼의 배경색 (빨간색) */
        }

        .comment-buttons .delete-button:hover {
            background-color: #d32f2f; /* 삭제 버튼의 호버 시 배경색 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .comment-buttons .report-button {
            background-color: #ff9800; /* 신고 버튼의 배경색 (주황색) */
        }

        .comment-buttons .report-button:hover {
            background-color: #fb8c00; /* 신고 버튼의 호버 시 배경색 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        .rereply-form {
		    margin-top: 10px;
		    padding: 10px;
		    background-color: #e6f7ff;
		    border: 1px solid #91d5ff;
		    border-radius: 5px;
		    font-size: 14px;
		    display: none;
		}
		
		.rereply-form table td {
		    padding: 5px;
		}
		
		.rereply-form textarea {
		    width: 100%;
		    height: 60px;
		    padding: 6px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    box-sizing: border-box;
		    resize: vertical;
		    font-size: 12px;
		    line-height: 1.4;
		}
		
		.rereply-form input[type="submit"] {
		    background-color: #18A8F1;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    padding: 8px 16px;
		    cursor: pointer;
		    font-size: 14px;
		    transition: background-color 0.3s, box-shadow 0.3s;
		}
		
		.rereply-form input[type="submit"]:hover {
		    background-color: #0d6efd;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}
		.reply {
			padding-left: 60px;
		}
		
        
    </style>
    <script type="text/javascript">
        function deleteReply(replyNum,num,page) {
            if(! confirm("댓글을 삭제하시겠습니까?")) {
                return;
            }
            window.location.href = "${pageContext.request.contextPath}/travelreview/deleteReply?replyNum="+replyNum+"&num="+num+"&page="+page;
        }

        function confirmDelete() {
            if (confirm("게시글 을 삭제하시겠습니까?")) {
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
        
        function TravelReview_Like() {
        	if(! confirm("플러팅 하시겠습니까?")){
        		return;
        	}
        	
    		let url = "${pageContext.request.contextPath}/travelreview/TravelReview_Like";
    		let query = "num=${dto.num}";
    		
    		const fn = function(data) {
    			console.log(data);
    			let state = data.state;
    			if(state === "true") {
    				let count = data.likeCount;
    				$("#boardLikeCount").text(count);
    			} else if(state === "liked") {
    				alert("플러팅은 한번만 가능합니다.");
    			}
    		};
    		
    		ajaxFun(url, "post", query, "json", fn);
    	}
        
        function ajaxFun(url, method, formData, dataType, fn, file = false) {
        	const settings = {
        			type: method, 
        			data: formData,
        			dataType:dataType,
        			success:function(data) {
        				fn(data);
        			},
        			beforeSend: function(jqXHR) {
        				jqXHR.setRequestHeader('AJAX', true);
        			},
        			complete: function () {
        			},
        			error: function(jqXHR) {
        				if(jqXHR.status === 403) {
        					login();
        					return false;
        				} else if(jqXHR.status === 400) {
        					alert('요청 처리가 실패 했습니다.');
        					return false;
        		    	}
        		    	
        				console.log(jqXHR.responseText);
        			}
        	};
        	
        	if(file) {
        		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
        		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
        	}
        	
        	$.ajax(url, settings);
        }
        
        function Declaration() {
        	if(! confirm("고소 하시겠습니까?")){
        		return;
        	}
        }
        
        function insertReReply() {
        	const form=document.querySelector('.rereply-form');
        	form.style.display="block";
        }
        
    </script>
</head>
<body>
    <div class="container">
        <div class="post"> 
            <div class="post-title">${dto.subject}</div>
            <div class="post-content">
                ${dto.content}
                <c:forEach var="imageFile" items="${fileList}">
                	<img src="${pageContext.request.contextPath}/uploads/travelreview/${imageFile.imageFilename}">
                </c:forEach>
            </div>
            <div class="post-info">
                <div>작성자: ${dto.nickName}</div>
                <div>작성일: ${dto.reg_date}</div>
                <div>조회수: ${dto.hitCount}</div>
            </div>
        </div>

        <div class="action-buttons-container">
            <a href="${pageContext.request.contextPath}/travelreview/list" class="back-button">목록으로 돌아가기</a>
            <button class="like-button" onclick="TravelReview_Like()">
            <i class="bi bi-heart-fill">&nbsp;<span id="boardLikeCount">${likeCount}
            </span>&nbsp;</i></button>
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/travelreview/update?num=${dto.num}&page=${page}" class="edit-button">수정</a>
                <a href="#" onclick="confirmDelete()" class="delete-button">삭제</a>
            </div>
        </div>
    </div>

    <div class="comment-section">
        <h2>댓글을 사용할 때는 타인을 존중하고 커뮤니티 가이드를 준수해야 합니다(욕설 바로 고소 합니다.)</h2>

        <div class="comment-form" style="background: #ffffff">
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
                            <textarea name="content" rows="3" placeholder="댓글을 입력해주세요." required></textarea>
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
            <c:forEach var="comment" items="${replies}">
           		<c:if test="${comment.answerNum==0}">
	            	<div class="comment">
	                    <div class="comment-header">작성자: ${comment.nickName}</div>
	                    <div class="comment-content">${comment.content}</div>
	                    <div class="comment-buttons">
	                        <button class="delete-button" onclick="deleteReply('${comment.replyNum}','${dto.num}','${page}');">삭제</button>
	                        <button class="report-button" onclick="Declaration();">신고</button>
	                        <button class="hidden-button" onclick="insertReReply();">답글달기</button>
	                    </div>
	                </div>
	            </c:if>
	            <c:if test="${comment.answerNum>0}">
	            	<div class="comment reply">
	                    <div class="comment-header">
	                    작성자: ${comment.nickName}</div>
	                    <div class="comment-content">${comment.content}</div>
	                    <div class="comment-buttons">
	                        <button class="delete-button" onclick="deleteReply('${comment.replyNum}','${dto.num}','${page}');">삭제</button>
	                        <button class="report-button" onclick="Declaration();">신고</button>
	                        <button class="hidden-button" onclick="insertReReply();">답글달기</button>
	                    </div>
	                </div>
	            </c:if>
                <div class="comment-form rereply-form">
		            <form method="post" action="${pageContext.request.contextPath}/travelreview/insertReReply" onsubmit="return validateReplyForm(this)">
		                <input type="hidden" name="num" value="${dto.num}">
		                <input type="hidden" name="page" value="${page}">
		                <input type="hidden" name="schType" value="${schType}">
		                <input type="hidden" name="kwd" value="${kwd}">
		                <input type="hidden" name="answerNum" value="${comment.replyNum}">
		                <table>
		                    <tr>
		                        <td>닉네임</td>
		                        <td><input type="text" name="nickname" value="${sessionScope.member.nickName}" readonly></td>
		                    </tr>
		                    <tr>
		                        <td colspan="2">
		                            <textarea name="content" rows="3" placeholder="댓글을 입력해주세요." required></textarea>
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
            </c:forEach>
        </div>
    </div>
</body>
</html>
