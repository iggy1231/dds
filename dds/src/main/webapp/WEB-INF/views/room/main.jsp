<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<style>
<style type="text/css">
 * {
            font-family: pretendard;
        }
        .hero-header {
            background-image: url('${pageContext.request.contextPath}/resources/images/main_header.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .search-form-container {
            max-width: 1200px;
            margin: auto;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            background-color: white;
        }
        .nav-tabs .nav-link {
            border: none;
            border-bottom: 2px solid transparent;
        }
        .nav-tabs .nav-link.active {
            border-bottom-color: #007bff;
            color: #007bff;
        }
        .form-control {
            border-radius: 0.375rem;
        }
        .btn-custom {
            border-radius: 0.375rem;
        }
        .btn-outline-secondary, .btn-primary {
            white-space: nowrap;
        }
        .text-primary {
            color: #18A8F1 !important;
        }
        .bg-primary {
            background-color: #18A8F1 !important;
        }
        .property-item {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .property-item:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
</style>
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

        <div class="container-fluid py-5 mb-3 hero-header" style="font-family: pretendard;">
            <div class="container pt-1 pb-4">
                <div class="row m-2 g-5 align-items-center">
                    <div class="col-md-12">
                        <h4 class="mb-1 text-light display-7" style="font-weight: 600;">두둥실 떠나는</h4>
                        <h2 class="mb-3 text-light display-5" style="font-weight: 600;">신나는 여행</h2>
                        <div class="container mt-5">
    <div class="search-form-container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="domestic-tab" data-bs-toggle="tab" href="#domestic" role="tab" aria-controls="domestic" aria-selected="true">국내 숙소</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="overseas-tab" data-bs-toggle="tab" href="#overseas" role="tab" aria-controls="overseas" aria-selected="false">여행 정보</a>
            </li>
        </ul>
        <div class="tab-content mt-3" id="myTabContent">
            <div class="tab-pane fade show active" id="domestic" role="tabpanel" aria-labelledby="domestic-tab">
                <form class="d-flex" name="searchForm" action="${pageContext.request.contextPath}/search/main" method="post">
                    <div class="input-group">
                        <span class="input-group-text"><i class="p-2 bi bi-search"></i></span>
                        <input name="search_term" type="text" class="p-3 form-control" placeholder="여행지나 숙소를 검색해보세요">
                    </div>
                    <button type="button" class="p-3 btn btn-outline-secondary mx-2">
                        <i class=" bi bi-calendar"></i> 07.08 월 - 07.09 화 (1박)
                    </button>
                    <button type="button" class="p-3  btn btn-outline-secondary mx-2">
                        <i class="bi bi-people"></i> 인원 2
                    </button>
                    <button type="submit" class="p-3  btn btn-primary">검색</button>
                </form>
            </div>
            <div class="tab-pane fade" id="overseas" role="tabpanel" aria-labelledby="overseas-tab">
                <!-- 해외 숙소 검색 폼 -->
            </div>
        </div>
    </div>
</div>
                    </div>
                </div>
            </div>
        </div>

</body>
</html>	   
