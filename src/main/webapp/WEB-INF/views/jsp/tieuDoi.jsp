<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%-- URL API cho các thao tác --%>
<c:url var="taoTieuDoiAPIurl" value="/api/v1/tieu-doi/tao-tieu-doi"/>
<c:url var="tieuDoiUrl" value="/danh-sach-tieu-doi"/>
<c:url var="layDaiDoiUrl" value="/api/v1/dai-doi/lay-theo-tieu-doan"/>
<c:url var="layTrungDoiUrl" value="/api/v1/trung-doi/lay-theo-dai-doi"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Tiểu đội</title>
    <link rel="icon" href="<c:url value='/template/images/LOGO 950.png'/>">
    <link href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/style.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/menu/menu.css'/>" type="text/css">
    <%-- Load jQuery trước các script khác để tránh lỗi $ is not defined [cite: 1] --%>
    <script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
</head>
<body>
<%@ include file="/common/header.jsp" %>
<div>
    <%@ include file="/common/menu.jsp" %>
    <div class="home-section">
        <div class="content home-page-content">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Danh sách Tiểu đội</strong>
                            </div>
                            <div class="card-header">
                                <c:if test="${not empty message}">
                                    <div class="text-center float-left alert alert-${alert}">${message}</div>
                                </c:if>
                                <div class="float-right">
                                    <a href="#addTieuDoiModal" class="btn btn-success" data-toggle="modal">
                                        <i class="fa fa-plus-circle"></i> <span>Thêm mới</span>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Tên Tiểu đội</th>
                                        <th class="text-center">Thuộc Trung đội</th>
                                        <th class="text-center">Thuộc Đại đội</th>
                                        <th class="text-center">Thuộc Tiểu đoàn</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${tieuDoiList}">
                                        <tr>
                                            <td>${item.tenTieuDoi}</td>
                                            <td>${item.trungDoi.tenTrungDoi}</td> <%-- [cite: 3] --%>
                                             <td>${item.trungDoi.daiDoi.tenDaiDoi}</td> <%-- --%>
                                            <td>${item.trungDoi.daiDoi.tieuDoan.tenTieuDoan}</td>
                                            <td class="text-center">
                                                <span class="status ${item.status == 1 ? 'text-success' : 'text-danger'}">&bull;</span>
                                                ${item.status == 1 ? 'Hoạt động' : 'Tạm ngưng'} <%-- [cite: 3] --%>
                                            </td>
                                            <td class="text-center">
                                                <a href="#" class="edit"><i class="fa fa-pencil"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="addTieuDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmit">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm Tiểu Đội</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="font-weight-bold">Tên tiểu đội</label>
                                <input type="text" name="tenTieuDoi" class="form-control" required/>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">1. Chọn Tiểu đoàn</label>
                                <select class="form-control" id="selectTieuDoan">
                                    <option value="">-- Chọn tiểu đoàn --</option>
                                    <c:forEach var="td" items="${tieuDoanList}">
                                        <option value="${td.id}">${td.tenTieuDoan}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">2. Chọn Đại đội</label>
                                <select class="form-control" id="selectDaiDoi">
                                    <option value="">-- Vui lòng chọn tiểu đoàn --</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">3. Trực thuộc Trung đội</label>
                                <select class="form-control" name="trungDoi" id="selectTrungDoi" required>
                                    <option value="">-- Vui lòng chọn đại đội --</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="btnSave" type="submit" class="btn btn-success">Lưu</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                // 1. Khi thay đổi Tiểu đoàn -> Load Đại đội
                $('#selectTieuDoan').change(function() {
                    let id = $(this).val();
                    let $daiDoi = $('#selectDaiDoi');
                    let $trungDoi = $('#selectTrungDoi');

                    $daiDoi.empty().append('<option value="">-- Chọn đại đội --</option>');
                    $trungDoi.empty().append('<option value="">-- Vui lòng chọn đại đội --</option>');

                    if (id) {
                        $.get('${layDaiDoiUrl}/' + id, function(res) {
                            $.each(res, function(i, item) {
                                $daiDoi.append('<option value="'+item.id+'">'+item.tenDaiDoi+'</option>');
                            });
                        });
                    }
                });

                // 2. Khi thay đổi Đại đội -> Load Trung đội
                $('#selectDaiDoi').change(function() {
                    let id = $(this).val();
                    let $trungDoi = $('#selectTrungDoi');

                    $trungDoi.empty().append('<option value="">-- Chọn trung đội --</option>');

                    if (id) {
                        $.get('${layTrungDoiUrl}/' + id, function(res) {
                            $.each(res, function(i, item) {
                                $trungDoi.append('<option value="'+item.id+'">'+item.tenTrungDoi+'</option>');
                            });
                        });
                    }
                });

                // 3. Submit Form
                $('#btnSave').click(function(e) {
                    e.preventDefault();
                    let data = {};
                    let formData = $('#formSubmit').serializeArray();
                    $.each(formData, function(i, v) {
                        data['' + v.name] = v.value;
                    });

                    $.ajax({
                        url: '${taoTieuDoiAPIurl}',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        success: function() {
                            window.location.href = "${tieuDoiUrl}?message=insert_success&alert=success";
                        },
                        error: function() {
                            window.location.href = "${tieuDoiUrl}?message=error&alert=danger";
                        }
                    });
                });
            });
        </script>
        <%@ include file="/common/footer.jsp" %>
    </div>
</div>
<script src="<c:url value='/template/vendor/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/template/menu/dropDownSidebarMenu.js'/>"></script>
<script src="<c:url value='/template/vendor/js/ckeditor/ckeditor.js'/>"></script>
</body>
</html>