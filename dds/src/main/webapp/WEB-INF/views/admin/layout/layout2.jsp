<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-admin-path="${pageContext.request.contextPath}/resources/admin/"
  data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title><tiles:insertAttribute name="title"/></title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/admin/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/js/helpers.js"></script>

    <!-- Template customizer & Theme config files -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/config.js"></script>
</head>

<body>

	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
				<tiles:insertAttribute name="left"/>
			<div class="layout-page">
				<tiles:insertAttribute name="top"/>
				<tiles:insertAttribute name="body"/>
			</div>
		</div>
		
	
	</div> 

<div id="loadingLayout" style="display:none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
    <div class="loader"></div>
</div>

<!-- Core JS -->
<script src="${pageContext.request.contextPath}/resources/admin/vendor/libs/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/libs/popper/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="${pageContext.request.contextPath}/resources/admin/vendor/js/menu.js"></script>

<!-- Vendors JS -->
<script src="${pageContext.request.contextPath}/resources/admin/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/resources/admin/js/main.js"></script>

<!-- Page JS -->
<script src="${pageContext.request.contextPath}/resources/admin/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

</body>
</html>
