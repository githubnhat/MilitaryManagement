<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Left Panel -->

<div class="sidebar">
	<!-- <div class="logo-details">
        <i class="bx bxl-c-plus-plus"></i>
        <span class="logo-name">CodingLab</span>
      </div> -->
	<div class="home-content">
		<i class='bx bx-menu'></i>
	</div>
	<ul class="nav-links">

		<li>
			<div class="icon-links">
				<a href="#"> <i class="bx bx-user arrow"></i> <scan
						class="link_name arrow dropdown">Quản lý quân nhân</scan> <i
					class="bx bxs-chevron-down arrow icon-show"></i>
				</a>
			</div>
			<ul class="sub-menu">
				<li><a class="link_name" href="#">Quản lý quân nhân</a></li>
				<li><a href="<c:url value='/danh-sach-quan-nhan'/>">Danh sách quân nhân</a></li>
				<li><a href="<c:url value='/tao-quan-nhan'/>">Thêm quân nhân</a></li>

			</ul>
		</li>
		<%--<li>
			<div class="icon-links">
				<a href="#"> <i class="bx bx-file arrow"></i> <scan
						class="link_name arrow dropdown">Xuất file</scan> <i
					class="bx bxs-chevron-down arrow icon-show"></i>
				</a>
			</div>
			<ul class="sub-menu">
				<li><a class="link_name" href="#">Xuất file</a></li>
				<li><a href="<c:url value='/excel-export'/>">Xuất excel</a></li>
				<li><a href="<c:url value='/modify-account'/>">Xuất word</a></li>
			</ul>
		</li>--%>
		<%--<li>
			<div class="icon-links">
				<a href="#"> <i class="bx bx-shield-quarter"></i> <scan
						class="link_name arrow dropdown">Policy</scan> <i
					class="bx bxs-chevron-down arrow icon-show"></i>
				</a>
			</div>
			<ul class="sub-menu">
				<li><a class="link_name" href="#">Agent</a></li>
				<li><a href="<c:url value='/create-policy'/>">Create policy</a></li>
				<li><a href="<c:url value='/modify-policy'/>">Modify policy</a></li>
				<li><a href="<c:url value='/issue-policy'/>">Issue policy</a></li>
			</ul>
		<li>
			<div class="icon-links">
				<a href="#"> <i class="bx bx-file arrow"></i> <scan
						class="link_name arrow dropdown">File</scan> <i
					class="bx bxs-chevron-down arrow icon-show"></i>
				</a>
			</div>
			<ul class="sub-menu">
				<li><a class="link_name" href="#">File</a></li>
				<li><a href="<c:url value='/upload-file'/>">Upload file</a></li>
				<li><a href="<c:url value='/list-folder'/>">View file uploaded</a></li>
			</ul>
		</li>--%>
		<li>
          <div class="profile-details">
            <div class="profile-contect">
              <img src="/template/images/phuhieu.jpg" alt="profile" />
            </div>
            <div class="name-job">
              <div class="profile-name">Hữu Lợi</div>
              <div class="job">Thượng úy</div>
            </div>
            <i class="bx bx-log-out"></i>
          </div>
        </li>
	</ul>
</div>

