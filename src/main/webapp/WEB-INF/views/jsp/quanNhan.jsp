<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="taoQuanNhanURL" value='/tao-quan-nhan'/>
<c:url var="capNhatQuanNhaURL" value='/cap-nhat-quan-nhan'/>
<c:url var="xemQuanNhanURL" value='/xem-quan-nhan'/>
<c:url var="danhSachQuanNhanURL" value='/danh-sach-quan-nhan'/>
<c:url var="trangChuURL" value="/trang-chu"/>
<c:url var="taoQuanNhanAPI" value='/api/v1/quan-nhan/tao-quan-nhan'/>
<c:url var="capNhatQuanNhanAPI" value='/api/v1/quan-nhan/cap-nhat-quan-nhan'/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý quân nhân</title>
    <link rel="icon" href="<c:url value='/template/images/LOGO 950.png'/>">
    <link href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/style.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/menu/menu.css'/>" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap" rel="stylesheet">
    <script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
</head>
<body>
<%--<div class="load">--%>
<%--        <img src="<c:url value='/template/images/loading.gif'/>">--%>
<%--    </div>--%>
<%@ include file="/common/header.jsp" %>
<div>
    <%@ include file="/common/menu.jsp" %>
    <div class="home-section">
        <div>
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
                                <div class="card mb-4 border-info">
                                    <div class="card-header bg-info text-white font-weight-bold">
                                        I. BẢN THÂN
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Họ và tên khai sinh</label>
                                                <form:input path="hoTenKhaiSinh" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Họ và tên thường dùng</label>
                                                <form:input path="hoTenThuongDung" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Ngày, tháng, năm sinh</label>
                                                <form:input path="ngayThangNamSinh" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Căn cước công dân</label>
                                                <form:input path="canCuocCongDan" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Số hiệu quân nhân</label>
                                                <form:input path="soHieuQuanNhan" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Cấp bậc</label>
                                                <form:select path="capBac" cssClass="form-control" disabled="${isViewMode}">
                                                    <form:option value="" label="-- Chọn cấp bậc --"/>
                                                    <form:option value="Binh nhì" label="Binh nhì"/>
                                                    <form:option value="Binh nhất" label="Binh nhất"/>
                                                    <form:option value="Hạ sĩ" label="Hạ sĩ"/>
                                                    <form:option value="Trung sĩ" label="Trung sĩ"/>
                                                    <form:option value="Thượng sĩ" label="Thượng sĩ"/>
                                                </form:select>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Chức vụ</label>
                                                <form:input path="chucVu" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Dân tộc</label>
                                                <form:input path="danToc" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Tôn giáo</label>
                                                <form:input path="tonGiao" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Thành phần gia đình</label>
                                                <form:input path="thanhPhanGd" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Thành phần bản thân</label>
                                                <form:input path="thanhPhanBanThan" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Nguyên quán (ấp, xã, huyện, tỉnh)</label>
                                                <form:input path="nguyenQuan" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Hộ khẩu thường trú</label>
                                                <form:input path="hoKhau" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <hr> <div class="row">
                                        <div class="form-group col-md-3">
                                            <label class="font-weight-bold">Nhập ngũ</label>
                                            <form:input path="nhapNgu" cssClass="form-control" disabled="${isViewMode}"/>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="font-weight-bold">Ngày vào Đoàn</label>
                                            <form:input path="ngayVaoDoan" cssClass="form-control" disabled="${isViewMode}"/>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="font-weight-bold">Ngày vào Đảng</label>
                                            <form:input path="ngayVaoDang" cssClass="form-control" disabled="${isViewMode}"/>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label class="font-weight-bold">Ngày Chính thức</label>
                                            <form:input path="ngayChinhThuc" cssClass="form-control" disabled="${isViewMode}"/>
                                        </div>
                                    </div>

                                        <div class="row">
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Trình độ học vấn (Văn hóa)</label>
                                                <form:input path="trinhDoHocVan" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Ngoại ngữ</label>
                                                <form:input path="ngoaiNgu" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Biết tiếng dân tộc</label>
                                                <form:input path="tiengDanToc" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Chuyên môn đào tạo qua trường (CMKT)</label>
                                                <form:input path="chuyenMonDaoTao" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Chuyên môn tự học, biết làm</label>
                                                <form:input path="chuyenMonTuHoc" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row bg-light py-2 rounded">
                                            <div class="form-group col-md-2">
                                                <label class="font-weight-bold">Sức khỏe (Loại)</label>
                                                <form:select path="sucKhoe" cssClass="form-control" disabled="${isViewMode}">
                                                    <form:option value="" label="-- Chọn --"/>
                                                    <form:option value="1" label="Loại 1"/><form:option value="2" label="Loại 2"/>
                                                    <form:option value="3" label="Loại 3"/><form:option value="4" label="Loại 4"/>
                                                </form:select>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label class="font-weight-bold">Chiều cao (cm)</label>
                                                <form:input path="chieuCao" type="number" step="0.1" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label class="font-weight-bold">Cân nặng (kg)</label>
                                                <form:input path="canNang" type="number" step="0.1" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Khí chất</label>
                                                <form:select path="khiChat" cssClass="form-control" disabled="${isViewMode}">
                                                    <form:option value="" label="-- Chọn --"/>
                                                    <form:option value="Trầm lặng" label="Trầm lặng"/>
                                                    <form:option value="Nóng nảy" label="Nóng nảy"/>
                                                    <form:option value="Hoạt bát" label="Hoạt bát"/>
                                                </form:select>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Bệnh lý</label>
                                                <form:input path="benhLy" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Trước nhập ngũ (Làm gì, ở đâu, thời gian)</label>
                                                <form:input path="truocNhapNgu" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Sở thích cá nhân</label>
                                                <form:input path="soThichCaNhan" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row">
                                            <div class="form-group col-md-5">
                                                <label class="font-weight-bold">Lý do đi bộ đội</label>
                                                <form:select path="lyDoNhapNgu" cssClass="form-control" disabled="${isViewMode}">
                                                    <form:option value="" label="-- Chọn --"/>
                                                    <form:option value="Do lệnh gọi" label="Do lệnh gọi"/>
                                                    <form:option value="Do tình nguyện" label="Do tình nguyện"/>
                                                </form:select>
                                            </div>
                                            <div class="form-group col-md-7">
                                                <label class="font-weight-bold">Suy nghĩ về môi trường quân đội</label>
                                                <form:select path="suyNghiMoiTruong" cssClass="form-control" disabled="${isViewMode}">
                                                    <form:option value="" label="-- Chọn --"/>
                                                    <form:option value="Đây là môi trường tốt rèn luyện con người" label="Đây là môi trường tốt rèn luyện con người"/>
                                                    <form:option value="Đây là môi trường gian nan, vất vả" label="Đây là môi trường gian nan, vất vả"/>
                                                </form:select>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Nguyện vọng bản thân</label>
                                                <form:select path="nguyenVongBanThan" id="nguyenVongSelect" cssClass="form-control" disabled="${isViewMode}">
                                                    <form:option value="" label="-- Chọn --"/>
                                                    <form:option value="Tiểu đội trưởng, khẩu đội trưởng" label="Đi học tiểu đội trưởng, khẩu đội trưởng"/>
                                                    <form:option value="Đi học CMKT" label="Đi học CMKT"/>
                                                    <form:option value="Đi học SQDB" label="Đi học SQDB"/>
                                                    <form:option value="Đi học sĩ quan" label="Đi học sĩ quan"/>
                                                    <form:option value="Kết nạp vào đảng" label="Kết nạp vào đảng"/>
                                                    <form:option value="Ra quân" label="Ra quân khi hết nghĩa vụ"/>
                                                </form:select>
                                            </div>
                                            <div class="form-group col-md-6" id="fieldCMKT" style="display: none;">
                                                <label class="font-weight-bold text-danger">Ngành CMKT muốn học cụ thể</label>
                                                <form:input path="chiTietCMKT" cssClass="form-control border-danger" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label class="font-weight-bold">Địa chỉ khi đi phép, đi tranh thủ</label>
                                                <form:input path="diaChiDiPhep" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <div class="p-3 border rounded bg-white h-100">
                                                    <label class="font-weight-bold text-primary">5. Thông tin Vợ</label>
                                                    <div class="form-group">
                                                        <label class="small">Tình trạng hôn nhân:</label>
                                                        <select id="hasWife" class="form-control form-control-sm">
                                                            <option value="false">Chưa có vợ</option>
                                                            <option value="true">Đã có vợ</option>
                                                        </select>
                                                    </div>

                                                    <div id="wifeInfoFields" style="display: none;" class="mt-2 pt-2 border-top">
                                                        <div class="mb-2">
                                                            <label class="small">Họ và tên vợ:</label>
                                                            <form:input path="hoTenVo" cssClass="form-control form-control-sm"/>
                                                        </div>
                                                        <div class="mb-2">
                                                            <label class="small">Ngày sinh:</label>
                                                            <form:input path="ngaySinhVo" cssClass="form-control form-control-sm" placeholder="dd/mm/yyyy"/>
                                                        </div>
                                                        <div class="mb-2">
                                                            <label class="small">Địa chỉ:</label>
                                                            <form:input path="diaChiVo" cssClass="form-control form-control-sm"/>
                                                        </div>
                                                        <div class="mb-2">
                                                            <label class="small">SĐT vợ:</label>
                                                            <form:input path="sdtVo" cssClass="form-control form-control-sm"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                        <div class="row bg-light p-2 rounded border mx-0">
                                            <div class="col-md-12"><small class="text-primary font-weight-bold">KHI CẦN BÁO TIN CHO AI</small></div>
                                            <div class="form-group col-md-3">
                                                <label>Họ tên người thân</label>
                                                <form:input path="nguoiBaoTin" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Địa chỉ</label>
                                                <form:input path="diaChiNguoiBaoTin" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Số điện thoại</label>
                                                <form:input path="soDienThoaiBaoTin" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="font-weight-bold text-success">Đơn vị huấn luyện CSM</label>
                                        <form:input path="donViCSM" cssClass="form-control" disabled="${isViewMode}"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="font-weight-bold text-success">Biên chế tại Tiểu đội</label>
                                        <select name="idTieuDoi" class="form-control" ${isViewMode ? 'disabled' : ''}>
                                            <c:forEach var="item" items="${tieuDoiList}">
                                                <option value="${item.id}" ${item.id == quanNhan.tieuDoi.id ? 'selected' : ''}>
                                                        ${item.tenTieuDoi}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-content container-fluid">
                                <div class="card mb-4 border-info">
                                    <div class="card-header bg-info text-white font-weight-bold">
                                        II. GIA ĐÌNH
                                    </div>
                                    <div class="card-body">

                                        <h6 class="text-info font-weight-bold border-bottom">1. Họ và tên cha</h6>
                                        <div class="row">
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Họ tên cha</label>
                                                <form:input path="hoTenCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Sinh ngày</label>
                                                <form:input path="ngaySinhCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Số điện thoại (SĐT)</label>
                                                <form:input path="sdtCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Tình trạng</label>
                                                <div class="d-flex align-items-center mt-2">
                                                    <form:radiobutton path="tinhTrangCha" value="Còn sống" disabled="${isViewMode}"/> <span class="ml-1 mr-3">Còn sống</span>
                                                    <form:radiobutton path="tinhTrangCha" value="Từ trần" disabled="${isViewMode}"/> <span class="ml-1">Từ trần</span>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Ngày từ trần (nếu có)</label>
                                                <form:input path="ngayTuTranCha" cssClass="form-control" placeholder="DL hay AL" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Nghề nghiệp</label>
                                                <form:input path="ngheNghiepCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Chức vụ</label>
                                                <form:input path="chucVuCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Cơ quan công tác</label>
                                                <form:input path="coQuanCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>

                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Chính trị</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text bg-white">
                                                            <form:checkbox path="laDangVienCha"
                                                                           value="true"
                                                                           disabled="${isViewMode}"
                                                                           id="laDangVienCha"
                                                                           cssStyle="cursor: pointer;" />
                                                        </div>
                                                    </div>
                                                    <label class="form-control" for="laDangVienCha" style="cursor: pointer; background-color: #fdfdfd;">
                                                        Là Đảng viên
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                        <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Sức khỏe</label>
                                                <form:input path="sucKhoeCha" cssClass="form-control" placeholder="Tình trạng sức khỏe" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Bệnh lý</label>
                                                <form:input path="benhLyCha" cssClass="form-control" placeholder="Bệnh lý cha" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label class="font-weight-bold">Nơi ở hiện nay (ấp, xã, huyện, tỉnh)</label>
                                                <form:input path="noiOHienNayCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <h6 class="text-info font-weight-bold border-bottom mt-4">2. Họ và tên mẹ</h6>
                                        <div class="row">
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Họ tên mẹ</label>
                                                <form:input path="hoTenMe" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Sinh ngày</label>
                                                <form:input path="ngaySinhMe" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label class="font-weight-bold">Số điện thoại (SĐT)</label>
                                                <form:input path="sdtMe" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Tình trạng</label>
                                                <div class="d-flex align-items-center mt-2">
                                                    <form:radiobutton path="tinhTrangMe" value="Còn sống" disabled="${isViewMode}"/> <span class="ml-1 mr-3">Còn sống</span>
                                                    <form:radiobutton path="tinhTrangMe" value="Từ trần" disabled="${isViewMode}"/> <span class="ml-1">Từ trần</span>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Ngày từ trần (nếu có)</label>
                                                <form:input path="ngayTuTranMe" cssClass="form-control" placeholder="DL hay AL" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Nghề nghiệp</label>
                                                <form:input path="ngheNghiepMe" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Chức vụ</label>
                                                <form:input path="chucVuMe" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label class="font-weight-bold">Cơ quan công tác</label>
                                                <form:input path="coQuanCha" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>

                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Chính trị</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text bg-white">
                                                            <form:checkbox path="laDangVienCha"
                                                                           value="true"
                                                                           disabled="${isViewMode}"
                                                                           id="laDangVienCha"
                                                                           cssStyle="cursor: pointer;" />
                                                        </div>
                                                    </div>
                                                    <label class="form-control" for="laDangVienCha" style="cursor: pointer; background-color: #fdfdfd;">
                                                        Là Đảng viên
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Sức khỏe</label>
                                                <form:input path="sucKhoeMe" cssClass="form-control"
                                                            placeholder="Tình trạng sức khỏe" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Bệnh lý</label>
                                                <form:input path="benhLyMe" cssClass="form-control"
                                                            placeholder="Bệnh lý mẹ" disabled="${isViewMode}"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label class="font-weight-bold">Nơi ở hiện nay (ấp, xã, huyện, tỉnh)</label>
                                                <form:input path="noiOHienNayMe" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <h6 class="text-info font-weight-bold border-bottom mt-4">3. Tình trạng hôn nhân & Kinh tế</h6>
                                        <div class="row bg-light py-2 rounded border mx-0 mb-3">
                                            <div class="form-group col-md-12">
                                                <label class="font-weight-bold">Tình trạng hôn nhân của cha mẹ:</label>
                                                <div class="d-flex flex-wrap mt-1">
                                                    <form:radiobutton path="honNhanChaMe" value="Hạnh phúc" class="ml-2"/> Hạnh phúc
                                                    <form:radiobutton path="honNhanChaMe" value="Ly thân" class="ml-3"/> Ly thân
                                                    <form:radiobutton path="honNhanChaMe" value="Ly hôn" class="ml-3"/> Ly hôn
                                                    <form:radiobutton path="honNhanChaMe" value="Bạo lực gia đình" class="ml-3"/> Bạo lực gia đình
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label class="font-weight-bold">Hoàn cảnh kinh tế:</label>
                                                <div class="d-flex mt-1">
                                                    <form:radiobutton path="kinhTeGiaDinh" value="Khá giả" class="ml-2"/> Khá giả
                                                    <form:radiobutton path="kinhTeGiaDinh" value="Đủ sống" class="ml-3"/> Đủ sống
                                                    <form:radiobutton path="kinhTeGiaDinh" value="Khó khăn" class="ml-3"/> Khó khăn
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label class="font-weight-bold">Gia đình có mấy anh em?</label>
                                                <div class="input-group">
                                                    <form:input path="soAnhEm" type="number" cssClass="form-control" placeholder="Tổng số"/>

                                                    <form:input path="soAnhEmTrai" type="number" cssClass="form-control" placeholder="Số lượng"/>
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">Trai</span>
                                                    </div>

                                                    <form:input path="soAnhEmGai" type="number" cssClass="form-control" placeholder="Số lượng"/>
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">Gái</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Bản thân là con thứ mấy?</label>
                                                <form:input path="conThuMay" type="number" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="font-weight-bold">Số người là cán bộ, Đảng viên</label>
                                                <form:input path="soAnhEmLaCanBo" type="number" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label class="font-weight-bold">Số điện thoại liên lạc gia đình</label>
                                                <form:input path="sdtLienLacGiaDinh" cssClass="form-control" disabled="${isViewMode}"/>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <div class="p-2 border rounded bg-white">
                                                    <label class="font-weight-bold text-dark">4. Ông, bà nội</label>
                                                    <hr class="my-1">

                                                    <div class="mb-3">
                                                        <p class="mb-1 font-weight-bold small">Ông nội:</p>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusOngNoi" value="con_song" cssClass="status-check" label="Còn sống" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusOngNoi" value="da_mat" cssClass="status-check" label="Đã mất" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="mt-2 date-input" style="display: none;">
                                                            <label class="small">Ngày từ trần:</label>
                                                            <form:input type="date" path="ngayMatOngNoi" cssClass="form-control form-control-sm" disabled="${isViewMode}"/>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <p class="mb-1 font-weight-bold small">Bà nội:</p>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusBaNoi" value="con_song" cssClass="status-check" label="Còn sống" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusBaNoi" value="da_mat" cssClass="status-check" label="Đã mất" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="mt-2 date-input" style="display: none;">
                                                            <label class="small">Ngày từ trần:</label>
                                                            <form:input type="date" path="ngayMatBaNoi" cssClass="form-control form-control-sm" disabled="${isViewMode}"/>
                                                        </div>
                                                    </div>

                                                    <label class="mt-2 small italic">Ghi chú (Nội):</label>
                                                    <form:input path="ghiChuNoi" cssClass="form-control form-control-sm" disabled="${isViewMode}"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="p-2 border rounded bg-white">
                                                    <label class="font-weight-bold text-dark">5. Ông, bà ngoại</label>
                                                    <hr class="my-1">

                                                    <div class="mb-3">
                                                        <p class="mb-1 font-weight-bold small">Ông ngoại:</p>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusOngNgoai" value="con_song" cssClass="status-check" label="Còn sống" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusOngNgoai" value="da_mat" cssClass="status-check" label="Đã mất" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="mt-2 date-input" style="display: none;">
                                                            <label class="small">Ngày từ trần:</label>
                                                            <form:input type="date" path="ngayMatOngNgoai" cssClass="form-control form-control-sm" disabled="${isViewMode}"/>
                                                        </div>
                                                    </div>

                                                    <div class="mb-3">
                                                        <p class="mb-1 font-weight-bold small">Bà ngoại:</p>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusBaNgoai" value="con_song" cssClass="status-check" label="Còn sống" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <form:radiobutton path="statusBaNgoai" value="da_mat" cssClass="status-check" label="Đã mất" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="mt-2 date-input" style="display: none;">
                                                            <label class="small">Ngày từ trần:</label>
                                                            <form:input type="date" path="ngayMatBaNgoai" cssClass="form-control form-control-sm" disabled="${isViewMode}"/>
                                                        </div>
                                                    </div>

                                                    <label class="mt-2 small italic">Ghi chú (Ngoại):</label>
                                                    <form:input path="ghiChuNgoai" cssClass="form-control form-control-sm" disabled="${isViewMode}"/>
                                                </div>
                                            </div>
                                        </div>
                                            <div class="card mb-4 border-primary">
                                                <div class="card-header bg-primary text-white font-weight-bold">
                                                    III. QUAN HỆ XÃ HỘI
                                                </div>
                                                <div class="card-body">
                                                    <h6 class="text-primary font-weight-bold border-bottom pb-1">1. Bạn bè thân thiết</h6>
                                                    <div class="row">
                                                        <div class="col-md-6 border-right">
                                                            <p class="text-danger small font-weight-bold mb-2">● Bạn gái thân nhất</p>
                                                            <div class="form-group mb-2">
                                                                <label class="small">Họ và tên / Năm sinh</label>
                                                                <div class="input-group input-group-sm">
                                                                    <form:input path="hoTenBanGai" cssClass="form-control" placeholder="Họ tên" disabled="${isViewMode}"/>
                                                                    <form:input path="ngaySinhBanGai" cssClass="form-control" placeholder="Năm sinh" disabled="${isViewMode}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-2">
                                                                <label class="small">SĐT / Địa chỉ</label>
                                                                <div class="input-group input-group-sm">
                                                                    <form:input path="sdtBanGai" cssClass="form-control" placeholder="Số điện thoại" disabled="${isViewMode}"/>
                                                                    <form:input path="diaChiBanGai" cssClass="form-control" placeholder="Địa chỉ" disabled="${isViewMode}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <p class="text-primary small font-weight-bold mb-2">● Bạn trai thân nhất</p>
                                                            <div class="form-group mb-2">
                                                                <label class="small">Họ và tên / Năm sinh</label>
                                                                <div class="input-group input-group-sm">
                                                                    <form:input path="hoTenBanTrai" cssClass="form-control" placeholder="Họ tên" disabled="${isViewMode}"/>
                                                                    <form:input path="ngaySinhBanTrai" cssClass="form-control" placeholder="Năm sinh" disabled="${isViewMode}"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-2">
                                                                <label class="small">SĐT / Địa chỉ</label>
                                                                <div class="input-group input-group-sm">
                                                                    <form:input path="sdtBanTrai" cssClass="form-control" placeholder="Số điện thoại" disabled="${isViewMode}"/>
                                                                    <form:input path="diaChiBanTrai" cssClass="form-control" placeholder="Địa chỉ" disabled="${isViewMode}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <hr>

                                                    <div class="row">
                                                        <div class="col-md-12 mb-3">
                                                            <h6 class="text-primary font-weight-bold">2. Người có ảnh hưởng tích cực</h6>
                                                            <label class="small italic text-muted">Trong bạn bè, người thân ai là người có ảnh hưởng tích cực đến cuộc sống và sự nghiệp của đồng chí?</label>
                                                            <form:textarea path="nguoiAnhHuongTichCuc" cssClass="form-control" rows="2" placeholder="Ghi rõ họ tên, mối quan hệ và lý do..." disabled="${isViewMode}"/>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-4">
                                                            <label>Họ tên Cán bộ địa phương</label>
                                                            <input type="text" path="hoTenCBDP1" class="form-control"
                                                                   value="${quanNhan.hoTenCBDP1}" ${isViewMode ? 'disabled' : ''}>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label>Chức vụ</label>
                                                            <input type="text" path="chucVuCBDP1" class="form-control"
                                                                   value="${quanNhan.chucVuCBDP1}" ${isViewMode ? 'disabled' : ''}>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label>Số điện thoại</label>
                                                            <input type="text" path="sdtCBDP1" class="form-control"
                                                                   value="${quanNhan.sdtCBDP1}" ${isViewMode ? 'disabled' : ''}>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-4">
                                                            <label>Họ tên Cán bộ địa phương</label>
                                                            <input type="text" path="hoTenCBDP2" class="form-control"
                                                                   value="${quanNhan.hoTenCBDP2}" ${isViewMode ? 'disabled' : ''}>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label>Chức vụ</label>
                                                            <input type="text" path="chucVuCBDP2" class="form-control"
                                                                   value="${quanNhan.chucVuCBDP2}" ${isViewMode ? 'disabled' : ''}>
                                                        </div>
                                                        <div class="form-group col-md-4">
                                                            <label>Số điện thoại</label>
                                                            <input type="text" path="sdtCBDP2" class="form-control"
                                                                   value="${quanNhan.sdtCBDP2}" ${isViewMode ? 'disabled' : ''}>
                                                        </div>
                                                    </div>

                                                    <h6 class="font-weight-bold text-primary mt-4">4. Các quan hệ xã hội phức tạp bên ngoài</h6>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <label class="font-weight-bold">Nội dung cụ thể</label>
                                                            <form:textarea path="dienBienCuThe" cssClass="form-control" rows="3" disabled="${isViewMode}"/>
                                                        </div>
                                                    </div>
                                                    <h6 class="font-weight-bold text-primary mt-4">5. Diễn biến tư tưởng</h6>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label class="font-weight-bold">Ngày, tháng</label>
                                                            <form:input path="dienBienNgayThang" cssClass="form-control" placeholder="dd/mm/yyyy" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label class="font-weight-bold">Cán bộ gặp gỡ</label>
                                                            <form:input path="dienBienCanBo" cssClass="form-control" disabled="${isViewMode}"/>
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label class="font-weight-bold">Nội dung diễn biến</label>
                                                            <form:textarea path="dienBienNoiDung" cssClass="form-control" rows="3" disabled="${isViewMode}"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
                                    <input type="hidden" value="${quanNhan.id}" id="id" name="id"/>
                                </c:if>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        <script>


            $(document).ready(function () {
                $(window).on('load', function () {
                    // 1. Khi trang đã tải xong hoàn toàn
                    $(".load").hide(); // Hiệu ứng mờ dần rồi ẩn đi
                });
                $('a').on('click', function (e) {
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
            $(document).ready(function() {
                // Hàm xử lý ẩn hiện
                function toggleCMKT() {
                    var selectedValue = $('#nguyenVongSelect').val();
                    if (selectedValue === 'Đi học CMKT') {
                        $('#fieldCMKT').show();
                    } else {
                        $('#fieldCMKT').hide();
                        // Xóa giá trị nếu người dùng đổi sang lựa chọn khác (tùy chọn)
                        if (!'${isViewMode}') {
                            $('input[name="chiTietCMKT"]').val('');
                        }
                    }
                }

                $(document).ready(function() {
                    // Xử lý ẩn hiện thông tin vợ
                    $('#hasWife').change(function() {
                        if ($(this).val() === 'true') {
                            $('#wifeInfoFields').fadeIn();
                        } else {
                            $('#wifeInfoFields').fadeOut();
                            // Xóa dữ liệu nếu chọn chưa có vợ (tùy chọn)
                            $('#wifeInfoFields input').val('');
                        }
                    });

                    // Kiểm tra lúc load trang (nếu là chế độ sửa)
                    if ($("input[name='hoTenVo']").val() !== "") {
                        $('#hasWife').val('true');
                        $('#wifeInfoFields').show();
                    }
                });
                $(document).ready(function() {
                    // Hàm kiểm tra và ẩn hiện field ngày mất
                    function toggleDeathDate() {
                        $('.status-check:checked').each(function() {
                            var container = $(this).closest('div.mb-3').find('.date-input');
                            if ($(this).val() === 'da_mat') {
                                container.show();
                            } else {
                                container.hide();
                            }
                        });
                    }

                    // Lắng nghe sự kiện thay đổi radio button
                    $('.status-check').change(function() {
                        var container = $(this).closest('div.mb-3').find('.date-input');
                        if ($(this).val() === 'da_mat') {
                            container.fadeIn();
                        } else {
                            container.fadeOut();
                        }
                    });

                    // Chạy khi load trang (trong trường hợp sửa dữ liệu cũ)
                    toggleDeathDate();
                });

                // Chạy khi load trang (để hiển thị đúng dữ liệu đã lưu)
                toggleCMKT();

                // Chạy khi thay đổi select
                $('#nguyenVongSelect').change(function() {
                    toggleCMKT();
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
                    url: '${capNhatQuanNhanAPI}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        if (result !== null)
                            window.location.href = "${capNhatQuanNhaURL}/" + result.id + "?message=update_success&alert=success";
                        else
                            window.location.href = "${capNhatQuanNhaURL}/" + result.id + "?message=update_fail&alert=danger";
                    },
                    error: function (error) {
                        $(".load").hide();
                        window.location.href = "${capNhatQuanNhaURL}?message=system_error&alert=danger";
                    }
                });
            }

            $('#btnContinue, #btnCancel').click(function (e) {
                e.preventDefault(); // Chặn chuyển trang tức thì
                // Hiện hiệu ứng loading
                $(".load").css("display", "flex").hide().fadeIn(200);
                setTimeout(function () {
                    window.location.href = "${danhSachQuanNhanURL}";
                }, 400);
            });


            function validation() {
                $('.error').hide().text('');
                var isValid = true;

                // var hoTenKhaiSinh = $('input[name="hoTenKhaiSinh"]').val().trim();
                var canCuocCongDan = $('input[name="canCuocCongDan"]').val().trim();
                var soHieuQuanNhan = $('input[name="soHieuQuanNhan"]').val().trim();
                // var ngayThangNamSinh = $('input[name="ngayThangNamSinh"]').val().trim();
                // var sucKhoe = $('select[name="sucKhoe"]').val();
                // var chieuCao = $('input[name="chieuCao"]').val();
                // var canNang = $('input[name="canNang"]').val();
                // var khiChat = $('select[name="khiChat"]').val();
                // var sdt = $('input[name="soDienThoaiBaoTin"]').val().trim();
                // var phoneRegex = /^(0[3|5|7|8|9])+([0-9]{8})$/;
                //
                // if (hoTenKhaiSinh === '') {
                //     $('.errhoTenKhaiSinh').show().text('Họ tên khai sinh không được để trống');
                //     isValid = false;
                // }
                // if (canCuocCongDan === '') {
                //     $('.errcanCuocCongDan').show().text('Số căn cước công dân không được để trống');
                //     isValid = false;
                // }
                // if (soHieuQuanNhan === '') {
                //     $('.errsoHieuQuanNhan').show().text('Số hiệu quân nhân không được để trống');
                //     isValid = false;
                // }
                // if (ngayThangNamSinh === '') {
                //     $('.errngayThangNamSinh').show().text('Ngày, tháng, năm sinh không được để trống');
                //     isValid = false;
                // }
                // if (sucKhoe === '' || sucKhoe === null) {
                //     alert('Vui lòng chọn phân loại sức khỏe');
                //     isValid = false;
                // }
                // if (chieuCao !== '' && chieuCao <= 0) {
                //     alert('Chiều cao phải lớn hơn 0');
                //     return false;
                // }
                // if (canNang !== '' && canNang <= 0) {
                //     alert('Cân nặng phải lớn hơn 0');
                //     return false;
                // }
                // if (khiChat === '') {
                //     alert('Vui lòng chọn đặc điểm khí chất');
                //     isValid = false;
                // }
                // if (sdt !== '' && !phoneRegex.test(sdt)) {
                //     alert('Số điện thoại báo tin không đúng định dạng (10 số, bắt đầu bằng 03, 05, 07, 08, 09)');
                //     return false;
                // }
                return isValid;
            }

            function addChildRow() {
                const html = `
        <tr class="small">
            <td><input type="text" class="form-control form-control-sm child-name"></td>
            <td><input type="text" class="form-control form-control-sm child-dob" placeholder="dd/mm/yyyy"></td>
            <td><input type="text" class="form-control form-control-sm child-address"></td>
            <td class="text-center">
                <button type="button" class="btn btn-link text-danger p-0" onclick="$(this).closest('tr').remove()">
                    <i class='bx bx-trash'></i>
                </button>
            </td>
        </tr>`;
                $('#childrenList').append(html);
                $('#noChildMsg').hide();
            }
        </script>
        </body>
        <%@ include file="/common/footer.jsp" %>
    </div>
</div>
<script src="<c:url value='/template/vendor/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/template/menu/dropDownSidebarMenu.js'/>"></script>
</html>