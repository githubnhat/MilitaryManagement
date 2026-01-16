<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="taoQuanNhanURL" value='/tao-quan-nhan'/>
<c:url var="modifyMilitaryURL" value='/modify-military'/>
<c:url var="xemQuanNhanURL" value='/xem-quan-nhan'/>
<c:url var="danhSachQuanNhanURL" value='/danh-sach-quan-nhan'/>
<c:url var="trangChuURL" value="/trang-chu"/>
<c:url var="taoQuanNhanAPI" value='/api/v1/quan-nhan/tao-quan-nhan'/>
<c:url var="modifyMilitaryAPI" value='/api/v1/military/modify'/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Military Management</title>
    <link rel="icon" href="<c:url value='/template/images/LOGO 950.png'/>">
    <link href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/style.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/menu/menu.css'/>" type="text/css">
    <script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
</head>
<body>
<div class="load">
        <img src="<c:url value='/template/images/loading.gif'/>">
    </div>
<%@ include file="/common/header.jsp" %>
<div>
    <%@ include file="/common/menu.jsp" %>
    <div class="home-section">
        <body>
        <div class="container-fluid home-page-content">
            <c:if test="${hanhDong.equals('C')}">
                <h2 class="title">Thêm quân nhân</h2>
            </c:if>
            <c:if test="${hanhDong.equals('M')}">
                <h2 class="title">Sửa thông tin quân nhân</h2>
            </c:if>
            <c:if test="${hanhDong.equals('I')}">
                <h2 class="title">Thông tin quân nhân</h2>
            </c:if>

            <div class="page-content">
                <div class="row">
                    <c:if test="${not empty message}">
                        <div class="ml-2 text-center float-left alert alert-${alert}">${message}</div>
                    </c:if>
                </div>
                <div class="row">
                    <div class="col-12">
                        <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="quanNhan">

                            <c:set var="isViewMode" value="${hanhDong.equals('I')}"/>

                                        <div class="form-content container-fluid">
                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Họ tên khai sinh</label>
                                                    <div class="input-group">
                                                        <form:input path="hoTenKhaiSinh" cssClass="form-control" disabled="${isViewMode}"/>
                                                    </div>
                                                    <p class="error errhoTenKhaiSinh text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Họ tên thường dùng</label>
                                                    <div class="input-group">
                                                        <form:input path="hoTenThuongDung" cssClass="form-control" disabled="${isViewMode}"/>
                                                    </div>
                                                    <p class="error errhoTenThuongDung text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Số hiệu quân nhân</label>
                                                    <div class="input-group">
                                                        <form:input path="soHieuQuanNhan" cssClass="form-control" disabled="${isViewMode}"/>
                                                    </div>
                                                    <p class="error errsoHieuQuanNhan text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Căn cước công dân</label>
                                                    <div class="input-group">
                                                        <form:input path="canCuocCongDan" cssClass="form-control" disabled="${isViewMode}"/>
                                                    </div>
                                                    <p class="error errcanCuocCongDan text-danger small"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Ngày, tháng, năm sinh</label>
                                                    <form:input path="ngayThangNamSinh" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayThangNamSinh text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Cấp bậc</label>
                                                    <form:select path="capBac" cssClass="form-control" disabled="${isViewMode}">
                                                        <form:option value="" label="-- Chọn --"/>
                                                        <form:option value="1/" label="1/"/>
                                                        <form:option value="2/" label="2/"/>
                                                        <form:option value="3/" label="3/"/>
                                                        <form:option value="4/" label="4/"/>
                                                        <form:option value="1//" label="1//"/>
                                                        <form:option value="2//" label="2//"/>
                                                        <form:option value="1/CN" label="1/CN"/>
                                                        <form:option value="2/CN" label="2/CN"/>
                                                        <form:option value="3/CN" label="3/CN"/>
                                                        <form:option value="4/CN" label="4/CN"/>
                                                        <form:option value="1//CN" label="1//CN"/>
                                                        <form:option value="2//CN" label="2//CN"/>
                                                    </form:select>
                                                    <p class="error errcapBac text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Ngày nhận cấp bậc</label>
                                                    <form:input path="ngayNhanCapBac" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayNhanCapBac text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Ngày nhận thẻ quân nhân</label>
                                                    <form:input path="ngayCapTheQuanNhan" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayCapTheQuanNhan text-danger small"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Chức vụ</label>
                                                    <form:input path="chucVu" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errchucVu text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Ngày nhận chức vụ</label>
                                                    <form:input path="ngayNhanChucVu" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayNhanChucVu text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">CNQS</label>
                                                    <form:input path="cnqs" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errcnqs text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Bậc kỹ thuật</label>
                                                    <form:input path="bacKyThuat" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errbacKyThuat text-danger small"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Nhập ngũ</label>
                                                    <form:input path="nhapNgu" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errnhapNgu text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Xuất ngũ</label>
                                                    <form:input path="xuatNgu" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errxuatNgu text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Tái ngũ</label>
                                                    <form:input path="taiNgu" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errtaiNgu text-danger small"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Ngày chuyển QNCN</label>
                                                    <form:input path="ngayChuyenQncn" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayChuyenQncn text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Ngày chuyển CNVCQP</label>
                                                    <form:input path="ngayChuyenCnvcqp" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayChuyenCnvcqp text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Lương</label>
                                                    <form:input path="luong" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errluong text-danger small"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Ngày vào đoàn</label>
                                                    <form:input path="ngayVaoDoan" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayVaoDoan text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Ngày vào Đảng</label>
                                                    <form:input path="ngayVaoDang" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayVaoDang text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label class="control-label font-weight-bold">Ngày chính thức</label>
                                                    <form:input path="ngayChinhThuc" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errngayChinhThuc text-danger small"></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Thành phần GĐ</label>
                                                    <form:input path="thanhPhanGd" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errthanhPhanGd text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Thành phần bản thân</label>
                                                    <form:input path="thanhPhanBanThan" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errthanhPhanBanThan text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Dân tộc</label>
                                                    <form:input path="danToc" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errdanToc text-danger small"></p>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label class="control-label font-weight-bold">Tôn giáo</label>
                                                    <form:input path="tonGiao" cssClass="form-control" disabled="${isViewMode}"/>
                                                    <p class="error errtonGiao text-danger small"></p>
                                                </div>
                                            </div>
                                        </div>
                            <div class="clearfix form-actions form-btn">
                                <div>
                                    <c:if test="${hanhDong.equals('C')}">
                                        <button class="btn btn-info" type="button" id="btnCreate">
                                            <i class="ace-icon fa fa-check bigger-110">Lưu</i>
                                        </button>
                                    </c:if>
                                    <c:if test="${hanhDong.equals('M')}">
                                        <button class="btn btn-info" type="button" id="btnModify">
                                            <i class="ace-icon fa fa-check bigger-110">Cập nhật</i>
                                        </button>
                                    </c:if>
                                    <c:if test="${hanhDong.equals('I')}">
                                        <button class="btn btn-secondary" type="button" id="btnContinue">
                                            <i class="ace-icon fa fa-arrow-left bigger-110"></i> Trở lại
                                        </button>
                                    </c:if>
                                    <c:if test="${!hanhDong.equals('I')}">
                                        <button class="btn" type="button" id="btnCancel">
                                            <i class="ace-icon fa fa-undo bigger-110"></i> Hủy
                                        </button>
                                    </c:if>
                                </div>
                                <c:if test="${hanhDong.equals('M')}">
                                    <input type="hidden" value="${military.id}" id="id" name="id"/>
                                </c:if>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
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

            $('#btnCreate').click(function (e) {
                e.preventDefault();
                if (!validation()) return;
                $(".load").show();
                setTimeout(function () {
                    var data = {};
                    var formData = $('#formSubmit').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name + ""] = v.value;
                    });
                    createMilitary(data);
                }, 50);
            });

            function createMilitary(data) {
                $.ajax({
                    url: '${taoQuanNhanAPI}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        if (result !== null)
                            window.location.href = "${xemQuanNhanURL}/" + result.id + "?message=create_success&alert=success";
                        else
                            window.location.href = "${taoQuanNhanURL}" + "?message=create_fail&alert=danger";
                    },
                    error: function (error) {
                        $(".load").hide();
                        window.location.href = "${taoQuanNhanURL}?message=system_error&alert=danger";
                    },
                });
            }

            $('#btnModify').click(function (e) {
                e.preventDefault();
                if (!validation()) return;
                $(".load").show();
                var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                modifyMilitary(data);
            });

            function modifyMilitary(data) {

                $.ajax({
                    url: '${modifyMilitaryAPI}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {

                        if (result !== null)
                            window.location.href = "${modifyMilitaryURL}/" + result.id + "?message=update_success&alert=success";
                        else
                            window.location.href = "${modifyMilitaryURL}/" + result.id + "?message=update_fail&alert=danger";
                    },
                    error: function (error) {
                        $(".load").hide();
                        window.location.href = "${modifyMilitaryURL}?message=system_error&alert=danger";
                    }
                });
            }

            $('#btnContinue, #btnCancel').click(function (e) {
                window.location.href = "${danhSachQuanNhanURL}";
            });



            function validation() {
                $('.error').hide().text('');
                var isValid = true;

                var hoTenKhaiSinh = $('input[name="hoTenKhaiSinh"]').val().trim();
                var canCuocCongDan = $('input[name="canCuocCongDan"]').val().trim();
                var soHieuQuanNhan = $('input[name="soHieuQuanNhan"]').val().trim();

                if (hoTenKhaiSinh === '') {
                    $('.errhoTenKhaiSinh').show().text('Họ tên khai sinh không được để trống');
                    isValid = false;
                }
                if (canCuocCongDan === '') {
                    $('.errcanCuocCongDan').show().text('Số căn cước công dân không được để trống');
                    isValid = false;
                }
                if (soHieuQuanNhan === '') {
                    $('.errsoHieuQuanNhan').show().text('Số hiệu quân nhân không được để trống');
                    isValid = false;
                }
                return isValid;
            }
        </script>
        </body>
        <%@ include file="/common/footer.jsp" %>
    </div>
</div>
<script src="<c:url value='/template/vendor/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/template/menu/dropDownSidebarMenu.js'/>"></script>
</html>