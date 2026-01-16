<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="taoQuanNhanURL" value='/tao-quan-nhan'/>
<c:url var="modifyMilitaryURL" value='/modify-military'/>
<c:url var="xemQuanNhanURL" value='/xem-quan-nhan'/>
<c:url var="listMilitaryURL" value='/military-list'/>
<c:url var="homeURL" value="/home"/>
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
<div class="load" style="display: none">
        <img src="<c:url value='/images/loading.gif'/>">
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
                        <div class="text-center float-left alert alert-${alert}">${message}</div>
                    </c:if>
                </div>
                <div class="row">
                    <div class="col-12">
                        <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="quanNhan">

                            <c:set var="isViewMode" value="${hanhDong.equals('I')}"/>

                            <div class="form-content">


                                <div class="row">
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Họ tên khai sinh</label>
                                        <div class="col-9"><form:input path="hoTenKhaiSinh" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errhoTenKhaiSinh ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Họ tên thường dùng</label>
                                        <div class="col-9"><form:input path="hoTenThuongDung" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errhoTenThuongDung ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Số hiệu quân nhân</label>
                                        <div class="col-9"><form:input path="soHieuQuanNhan" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errsoHieuQuanNhan ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Căn cước công dân</label>
                                        <div class="col-9"><form:input path="canCuocCongDan" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errcanCuocCongDan ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Ngày, tháng, năm sinh</label>
                                        <div class="col-9"><form:input path="ngayThangNamSinh" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errhoTenKhaiSinh ml-3"></p>
                                    </div>
                                    <div class="form-group col-2">
                                        <label class="control-label no-padding-right ml-3">Cấp bậc</label>
                                        <div class="col-9">
                                            <form:select path="capBac" cssClass="col-12 pl-1"
                                                         disabled="${isViewMode}">
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
                                        </div>
                                        <p class="error errcapBac ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Ngày nhận cấp bậc</label>
                                        <div class="col-9"><form:input path="ngayNhanCapBac" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errngayNhanCapBac ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Ngày nhận cấp thẻ quân nhân</label>
                                        <div class="col-9"><form:input path="ngayCapTheQuanNhan" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errngayCapTheQuanNhan ml-3"></p>
                                    </div>
                                </div>
                            <div class="row">
                                <div class="form-group col-3">
                                    <label class="control-label no-padding-right ml-3">Chức vụ</label>
                                    <div class="col-9"><form:input path="chucVu" cssClass="col-12 pl-1"
                                                                   disabled="${isViewMode}"/></div>
                                    <p class="error errchucVu ml-3"></p>
                                </div>
                                <div class="form-group col-3">
                                    <label class="control-label no-padding-right ml-3">Ngày nhận chức vụ</label>
                                    <div class="col-9"><form:input path="ngayNhanChucVu" cssClass="col-12 pl-1"
                                                                   disabled="${isViewMode}"/></div>
                                    <p class="error errngayNhanChucVu ml-3"></p>
                                </div>
                                <div class="form-group col-3">
                                    <label class="control-label no-padding-right ml-3">CNQS</label>
                                    <div class="col-9"><form:input path="cNQS" cssClass="col-12 pl-1"
                                                                   disabled="${isViewMode}"/></div>
                                    <p class="error errcNQS ml-3"></p>
                                </div>
                                <div class="form-group col-3">
                                    <label class="control-label no-padding-right ml-3">Bậc kỹ thuật</label>
                                    <div class="col-9"><form:input path="bacKyThuat" cssClass="col-12 pl-1"
                                                                   disabled="${isViewMode}"/></div>
                                    <p class="error errbacKyThuat ml-3"></p>
                                </div>
                            </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Nhập ngũ</label>
                                        <div class="col-9"><form:input path="nhapNgu" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errnhapNgu ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Xuất ngũ</label>
                                        <div class="col-9"><form:input path="xuatNgu" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errxuatNgu ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tái ngũ</label>
                                        <div class="col-9"><form:input path="taiNgu" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errtaiNgu ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày chuyển QNCN</label>
                                        <div class="col-9"><form:input path="ngayChuyenQncn" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errngayChuyenQncn ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày chuyển CNVCQP</label>
                                        <div class="col-9"><form:input path="ngayChuyenCnvcqp" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errngayChuyenCnvcqp ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Lương</label>
                                        <div class="col-9"><form:input path="luong" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errluong ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày vào đoàn</label>
                                        <div class="col-9"><form:input path="ngayVaoDoan" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errngayVaoDoan ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày vào Đảng</label>
                                        <div class="col-9"><form:input path="ngayVaoDang" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errngayVaoDang ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày chính thức</label>
                                        <div class="col-9"><form:input path="ngayChinhThuc" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errngayChinhThuc ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Thành phần GĐ</label>
                                        <div class="col-9"><form:input path="thanhPhanGd" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errthanhPhanGd ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Thành phần bản thân</label>
                                        <div class="col-9"><form:input path="thanhPhanBanThan" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errthanhPhanBanThan ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Dân tộc</label>
                                        <div class="col-9"><form:input path="danToc" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errdanToc ml-3"></p>
                                    </div>
                                    <div class="form-group col-3">
                                        <label class="control-label no-padding-right ml-3">Tôn giáo</label>
                                        <div class="col-9"><form:input path="tonGiao" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errtonGiao ml-3"></p>
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
            $('#btnCreate').click(function (e) {
                e.preventDefault();
                // if (!validation()) return;
                var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                createMilitary(data);
            });

            function createMilitary(data) {
                $('.load').show();
                $.ajax({
                    url: '${taoQuanNhanAPI}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        $('.load').hide();
                        if (result !== null)
                            window.location.href = "${xemQuanNhanURL}/" + result.id + "?message=create_success&alert=success";
                        else
                            window.location.href = "${taoQuanNhanURL}" + "?message=create_fail&alert=danger";
                    },
                    error: function (error) {
                        window.location.href = "${taoQuanNhanURL}?message=system_error&alert=danger";
                    },
                });
            }

            $('#btnModify').click(function (e) {
                e.preventDefault();
                // if (!validation()) return;
                var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                modifyMilitary(data);
            });

            function modifyMilitary(data) {
                $('.load').show();
                $.ajax({
                    url: '${modifyMilitaryAPI}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        $('.load').hide();
                        if (result !== null)
                            window.location.href = "${modifyMilitaryURL}/" + result.id + "?message=update_success&alert=success";
                        else
                            window.location.href = "${modifyMilitaryURL}/" + result.id + "?message=update_fail&alert=danger";
                    },
                    error: function (error) {
                        window.location.href = "${modifyMilitaryURL}?message=system_error&alert=danger";
                    }
                });
            }

            $('#btnContinue, #btnCancel').click(function (e) {
                window.location.href = "${listMilitaryURL}";
            });



            function validation() {
                $('.error').hide().text('');
                var isValid = true;

                var birthFullName = $('input[name="birthFullName"]').val().trim();
                var nationalIdNumber = $('input[name="nationalIdNumber"]').val().trim();
                var dateOfBirth = $('input[name="dateOfBirth"]').val().trim();
                var militaryCardIssuanceDate = $('input[name="militaryCardIssuanceDate"]').val().trim();
                var enlistmentDate = $('input[name="enlistmentDate"]').val().trim();
                var emergencyContactPerson = $('input[name="emergencyContactPerson"]').val().trim();
                var emergencyContactPhone = $('input[name="emergencyContactPhone"]').val().trim();
                var fatherFullName = $('input[name="fatherFullName"]').val().trim();
                var motherFullName = $('input[name="motherFullName"]').val().trim();

                if (birthFullName === '') {
                    $('.errbirthFullName').show().text('Họ đệm tên khai sinh không được để trống');
                    isValid = false;
                }
                if (nationalIdNumber === '') {
                    $('.errnationalIdNumber').show().text('Số thẻ căn cước không được để trống');
                    isValid = false;
                }
                if (dateOfBirth === '') {
                    $('.errdateOfBirth').show().text('Ngày tháng năm sinh không được để trống');
                    isValid = false;
                }
                if (militaryCardIssuanceDate === '') {
                    $('.errmilitaryCardIssuanceDate').show().text('Ngày cấp thẻ quân nhân không được để trống');
                    isValid = false;
                }
                if (enlistmentDate === '') {
                    $('.errenlistmentDate').show().text('Ngày nhập ngũ không được để trống');
                    isValid = false;
                }
                if (emergencyContactPerson === '') {
                    $('.erremergencyContactPerson').show().text('Người nhận báo tin không được để trống');
                    isValid = false;
                }
                if (emergencyContactPhone === '') {
                    $('.erremergencyContactPhone').show().text('Số điện thoại người nhận báo tin không được để trống');
                    isValid = false;
                }
                if (fatherFullName === '') {
                    $('.errfatherFullName').show().text('Họ đệm tên cha không được để trống');
                    isValid = false;
                }
                if (motherFullName === '') {
                    $('.errmotherFullName').show().text('Họ đệm tên mẹ không được để trống');
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