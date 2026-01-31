<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý quân nhân</title>
<link rel="icon"
	href="<c:url value='/template/images/LOGO 950.png'/>">
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
<link href="https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap" rel="stylesheet">
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
<%--			<div class="load">--%>
<%--				<img src="<c:url value='/template/images/loading.gif'/>">--%>
<%--			</div>--%>
			<!-- Page Content -->
			<div class="container-fluid home-page-content">

			<h1>Quản lý quân nhân!</h1>
			<c:if test="${not empty message}">
				<div class="row">
					<div class="text-center float-left text-success ml-4">${message}</div>
				</div>

			</c:if>
				<div class="row">
					<div class="col-md-4">
						<table class="report-table">
							<tr>
								<th colspan="2">THỐNG KÊ ĐẠI ĐỘI</th>
							</tr>
							<tr class="bg-yellow">
								<td>TÊN ĐƠN VỊ</td>
								<td class="text-center">SL</td>
							</tr>
							<c:forEach items="${statsDonVi.daiDoi}" var="row">
								<tr>
									<td>${row[0]}</td>
									<td class="text-center">${row[1]}</td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<div class="col-md-4">
						<table class="report-table">
							<tr>
								<th colspan="2">THỐNG KÊ TRUNG ĐỘI</th>
							</tr>
							<tr class="bg-yellow">
								<td>TÊN ĐƠN VỊ</td>
								<td class="text-center">SL</td>
							</tr>
							<c:forEach items="${statsDonVi.trungDoi}" var="row">
								<tr>
									<td>${row[0]}</td>
									<td class="text-center">${row[1]}</td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<div class="col-md-4">
						<table class="report-table">
							<tr>
								<th colspan="2">THỐNG KÊ TIỂU ĐỘI</th>
							</tr>
							<tr class="bg-yellow">
								<td>TÊN ĐƠN VỊ</td>
								<td class="text-center">SL</td>
							</tr>
							<c:forEach items="${statsDonVi.tieuDoi}" var="row">
								<tr>
									<td>${row[0]}</td>
									<td class="text-center">${row[1]}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<!-- /.container -->
			<script>
				$(document).ready(function () {
					$(window).on('load', function () {
						// 1. Khi trang đã tải xong hoàn toàn
						$(".load").hide(); // Hiệu ứng mờ dần rồi ẩn đi
					});
					$('a, #btnContinue, #btnCancel').on('click', function (e) {
						const url = $(this).attr('href');
						const target = $(this).attr('target');

						// Chỉ xử lý nếu có link, không phải link nội bộ (#) và không mở tab mới
						if (url && url !== "#" && !target && this.hostname === window.location.hostname) {
							e.preventDefault(); // Chặn chuyển trang ngay lập tức

							$(".load").css("display", "flex").hide().fadeIn(200);

							// Đợi 400ms để người dùng thấy hiệu ứng xoay rồi mới đi tiếp
							setTimeout(function () {
								window.location.href = url;
							}, 400);
						}
					});
				});
			</script>
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
