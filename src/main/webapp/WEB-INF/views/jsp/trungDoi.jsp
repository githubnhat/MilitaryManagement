<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="taoTrungDoiAPIurl" value="/api/v1/trung-doi/tao-trung-doi"/>
<c:url var="trungDoiUrl" value="/danh-sach-trung-doi"/>
<c:url var="layDaiDoiByTieuDoanUrl" value="/api/v1/dai-doi/lay-theo-tieu-doan"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Trung đội</title>
    <link rel="icon" href="<c:url value='/template/images/LOGO 950.png'/>">
    <link href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/style.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/menu/menu.css'/>" type="text/css">
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
                                <strong class="card-title">Danh sách Trung đội</strong>
                            </div>
                            <div class="card-header">
                                <c:if test="${not empty message}">
                                    <div class="text-center float-left alert alert-${alert}">${message}</div>
                                </c:if>
                                <div class="float-right">
                                    <a href="#addTrungDoiModal" class="btn btn-success" data-toggle="modal">
                                        <i class="fa fa-plus-circle"></i> <span>Thêm mới</span>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Tên Trung đội</th>
                                        <th class="text-center">Thuộc Đại đội</th>
                                        <th class="text-center">Thuộc Tiểu đoàn</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${trungDoiList}">
                                        <tr>
                                            <td>${item.tenTrungDoi}</td>
                                            <td>${item.daiDoi.tenDaiDoi}</td> <%-- --%>
                                            <td>${item.daiDoi.tieuDoan.tenTieuDoan}</td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${item.status == 1}"> <%-- --%>
                                                        <span class="status text-success">&bull;</span> Hoạt động
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status text-danger">&bull;</span> Tạm ngưng
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <a href="#" class="edit"><i class="fa fa-pencil" title="Chỉnh sửa"></i></a>
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

        <div id="addTrungDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmit">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm Trung Đội</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="font-weight-bold">Tên trung đội</label>
                                <input type="text" name="tenTrungDoi" class="form-control" required/>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Chọn Tiểu đoàn</label>
                                <select class="form-control" id="selectTieuDoan">
                                    <option value="">-- Chọn tiểu đoàn --</option>
                                    <c:forEach var="td" items="${tieuDoanList}">
                                        <option value="${td.id}">${td.tenTieuDoan}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Trực thuộc Đại đội</label>
                                <select class="form-control" name="daiDoi" id="selectDaiDoi" required>
                                    <option value="">-- Vui lòng chọn tiểu đoàn trước --</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="addTrungDoiBtn" type="submit" class="btn btn-success">Lưu lại</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // 1. Xử lý AJAX load Đại đội khi chọn Tiểu đoàn
            $('#selectTieuDoan').change(function() {
                let tieuDoanId = $(this).val();
                let $selectDaiDoi = $('#selectDaiDoi');

                $selectDaiDoi.empty();
                if (tieuDoanId) {
                    $selectDaiDoi.append('<option value="">-- Đang tải đại đội... --</option>');
                    $.ajax({
                        url: '${layDaiDoiByTieuDoanUrl}/' + tieuDoanId,
                        type: 'GET',
                        success: function(res) {
                            $selectDaiDoi.empty();
                            $selectDaiDoi.append('<option value="">-- Chọn đại đội --</option>');
                            $.each(res, function(i, item) {
                                $selectDaiDoi.append('<option value="' + item.id + '">' + item.tenDaiDoi + '</option>');
                            });
                        },
                        error: function() {
                            alert("Lỗi khi tải danh sách Đại đội");
                        }
                    });
                } else {
                    $selectDaiDoi.append('<option value="">-- Vui lòng chọn tiểu đoàn trước --</option>');
                }
            });

            // 2. Xử lý Submit Form thêm Trung đội
            $('#addTrungDoiBtn').click(function (e) {
                e.preventDefault();
                let data = {};
                let formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data['' + v.name] = v.value;
                });

                $.ajax({
                    url: '${taoTrungDoiAPIurl}', <%-- --%>
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        window.location.href = "${trungDoiUrl}?message=insert_success&alert=success";
                    },
                    error: function (error) {
                        window.location.href = "${trungDoiUrl}?message=system_error&alert=danger";
                    }
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