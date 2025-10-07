<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Military Management</title>
<link rel="icon"
	href="<c:url value='/template/images/logo.svg'/>">
<link
	href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>"
	rel="stylesheet" />

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<c:url value='/template/vendor/css/bootstrap.min.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/vendor/css/style.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/template/menu/menu.css'/>"
	type="text/css">

<script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
<%-- <script src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js'/>" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 --%>

<!-- Custom styles for this template -->
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div>
		<%@ include file="/common/menu.jsp"%>
		<div class="home-section">
			<body>

			<!-- Page Content -->
			<div class="container-fluid home-page-content">

			<h1>Welcome to Military Management!</h1>
			<c:if test="${not empty message}">
			<div class="text-center float-left text-success">${message}</div>
			</c:if>
			</div>
			<!-- /.container -->

			</body>
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>



	<!-- Bootstrap core JavaScript -->
<%-- 	<script src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js'/>" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 --%>
<script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
	<script src="<c:url value='/template/vendor/js/bootstrap.bundle.js'/>"></script>
	<script src="<c:url value='/template/menu/dropDownSidebarMenu.js'/>"></script>
</body>
</html>
