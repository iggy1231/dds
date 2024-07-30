<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 후기 게시판</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Playwrite+BE+VLG:wght@100..400&display=swap');
    
        body {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
            line-height: 1.15;
            text-size-adjust: 100%;
            font-weight: 400;
            color: var(--color-black);
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            font-size: 14px;
            -webkit-font-smoothing: subpixel-antialiased;
            user-select: none;
            overscroll-behavior: contain;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f4f4f9;
        }

        :root {
            --swiper-navigation-size: 44px;
            --swiper-theme-color: #007aff;
            --app-padding-top: 0px;
            --app-padding-bottom: 0px;
            --app-screen-height: 0px;
            --app-screen-width: 0px;
            --color-green: #00ce7c;
            --color-black: #000;
            --color-lightBlack: #252525;
            --color-darkGray: #6a6a6a;
            --color-gray: #919191;
            --color-lightGray: #9a9a9a;
            --color-whiteGray: #e9e9e9;
            --color-red: #ff3c26;
            --vh: 9.450000000000001px;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .post {
            display: flex;
            flex-direction: column;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
            gap: 16px;
            width: 800px;
            justify-content: center;
            align: center;
            scale: 0.85;
        }

        .post-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .post-header .profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .post-header .profile img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
        }

        .post-header .profile .info {
            display: flex;
            flex-direction: column;
        }

        .post-header .profile .info .name {
            font-size: 16px;
            font-weight: bold;
        }

        .post-header .profile .info .time {
            font-size: 12px;
            color: var(--color-gray);
        }

        .post-header .actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .post-header .actions button {
            background: none;
            border: none;
            cursor: pointer;
            color: var(--swiper-theme-color);
            font-size: 14px;
        }

        .post-content {
            font-size: 14px;
            line-height: 1.6;
        }

        .post-content img {
            width: 100%;
            max-width: 200px;
            margin-top: 10px;
        }
		
        .post-footer {
            display: flex;
            align-items: center;
            gap: 20px;
            font-size: 14px;
            color: var(--color-gray);
        }

        .post-footer .action {
            display: flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
        }

        .post-footer .action svg {
            width: 14px;
            height: 14px;
            fill: var(--color-gray);
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
        #content-items {
        	margin: 0 auto;
        }
        
       
        
    </style>
</head>
<body>
    <div class="container">
    	<div id="selectAreabtn" class="carousel slide">
		      <button class="btn btn-outline-secondary active" value="전체">전체</button>
		      <button class="btn btn-outline-secondary" value="서울">서울</button>
		      <button class="btn btn-outline-secondary" value="인천">인천</button>
		      <button class="btn btn-outline-secondary" value="대전">대전</button>
		      <button class="btn btn-outline-secondary" value="대구">대구</button>
		      <button class="btn btn-outline-secondary" value="광주">광주</button>
		      <button class="btn btn-outline-secondary" value="부산">부산</button>
		      <button class="btn btn-outline-secondary" value="울산">울산</button>
		      <button class="btn btn-outline-secondary" value="세종">세종</button>
		      <button class="btn btn-outline-secondary" value="경기">경기</button>
		      <button class="btn btn-outline-secondary" value="강원">강원</button>
		      <button class="btn btn-outline-secondary" value="충북">충북</button>
		      <button class="btn btn-outline-secondary" value="충남">충남</button>
		      <button class="btn btn-outline-secondary" value="경북">경북</button>
		      <button class="btn btn-outline-secondary" value="경남">경남</button>
		      <button class="btn btn-outline-secondary" value="전북">전북</button>
		      <button class="btn btn-outline-secondary" value="전남">전남</button>
		      <button class="btn btn-outline-secondary" value="제주">제주</button>
		</div>
		<hr>
		<div id="content-items">
		<div style="margin-left: 60px; font-size: 30px; font-family: Playwrite BE VLG, cursive; color: #18A8F1" >전 세계 여행 후기</div>
        <c:forEach var="dto" items="${list}">
            <div class="post" onclick="article(${dto.num});">
                <div class="post-header">
                    <div class="profile">
                        <img src="https://imagecache.tripsoda.com?url=https://tripsoda.s3.ap-northeast-2.amazonaws.com/prod/1648436737226&width=40&height=40" alt="profile picture">
                        <div class="info">
                        	<div>
                        		<div class="name">${dto.nickName}</div>
                            	<div class="time">${dto.reg_date}</div>
                        	</div>
                        </div>
                    </div>
                    <div class="actions">
                         <span>${dto.region_main}, ${dto.region_sub}</span>
                    </div>
                </div>
                <div class="post-content row justify-content-between">
					<div class="col"><h3 style="font-weight: bold;">${dto.subject}</h3>
					<br><br>
					<span style="font-size: 16px;">${dto.content}</span>
					</div>
                	<img class="col" src="${pageContext.request.contextPath}/uploads/travelreview/${dto.thumbnail}"
                	onerror=this.src="${pageContext.request.contextPath}/resources/images/noimage.png"/>   
                </div>
                <hr>
                <div class="post-footer justify-content-around">
                	<span>조회수 ${dto.hitCount}</span>
                    <div class="action">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"><path fill-rule="evenodd" clip-rule="evenodd" d="M9.11586 4C5.73818 4 3.00004 6.5132 3.00004 9.61339V13.8235L3 21.1429L8.59096 17.5657H15.7413C19.119 17.5657 21.8571 15.0525 21.8571 11.9523V9.61339C21.8571 6.5132 19.119 4 15.7413 4H9.11586Z" fill="#9a9a9a"></path></svg>
                        <span>${dto.replyCount}</span>
                    </div>
                    <div class="action">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.19169 5.62781C1.9361 7.86203 1.9361 11.4844 4.19169 13.7186L12.1816 21.6329C12.197 21.6481 12.213 21.6625 12.2294 21.676C12.4961 21.9398 12.9282 21.9397 13.1948 21.6757L21.1817 13.7644C23.4373 11.5302 23.4373 7.90777 21.1817 5.67356C18.9262 3.43934 15.2691 3.43934 13.0135 5.67355L12.7098 5.97443L12.3599 5.62781C10.1043 3.39359 6.44727 3.39359 4.19169 5.62781Z" fill="#9A9A9A"></path></svg>
                        <span>${dto.likeCount}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
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
    <script type="text/javascript">
    	function article(num) {
    		let query="?num="+num+"&page=${page}&schType=${schType}&kwd=${kwd}";
    		location.href="${pageContext.request.contextPath}/travelreview/article"+query;
    	}
    	
    	function searchList() {
    		const f = document.searchForm;
    		f.submit();
    	}
    </script>
    
</body>
</html>
