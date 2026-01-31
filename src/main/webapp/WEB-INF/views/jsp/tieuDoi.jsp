<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%-- URL API cho các thao tác --%>
<c:url var="taoTieuDoiAPIurl" value="/api/v1/tieu-doi/tao-tieu-doi"/>
<c:url var="capNhatTieuDoiAPIurl" value="/api/v1/tieu-doi/cap-nhat-tieu-doi"/>
<c:url var="xoaTieuDoiAPIurl" value="/api/v1/tieu-doi/xoa-tieu-doi"/>
<c:url var="tieuDoiUrl" value="/danh-sach-tieu-doi"/>
<c:url var="layDaiDoiByTieuDoanUrl" value="/api/v1/dai-doi/lay-theo-tieu-doan"/>
<c:url var="layTrungDoiByDaiDoiUrl" value="/api/v1/trung-doi/lay-theo-dai-doi"/>

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
                                    <a href="#deleteTieuDoiModal" class="btn btn-danger" data-toggle="modal"><i
                                            class="fa fa-trash-o" aria-hidden="true"></i> <span>Xóa</span></a>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="text-center">
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="selectAll">
                                                    <label for="selectAll"></label>
                                                </span>
                                        </th>
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
                                            <td class="text-center">
                                                  <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
                                                    <label for="checkbox_${item.id}"></label>
                                                </span>
                                            </td>
                                            <td>${item.tenTieuDoi}</td>
                                            <td>${item.trungDoi.tenTrungDoi}</td> <%-- [cite: 3] --%>
                                             <td>${item.trungDoi.daiDoi.tenDaiDoi}</td> <%-- --%>
                                            <td>${item.trungDoi.daiDoi.tieuDoan.tenTieuDoan}</td>
                                            <td class="text-center">
                                                <span class="status ${item.status == 1 ? 'text-success' : 'text-danger'}">&bull;</span>
                                                ${item.status == 1 ? 'Hoạt động' : 'Tạm ngưng'} <%-- [cite: 3] --%>
                                            </td>
                                            <td>
                                                <a href="#" class="edit" data-toggle="modal"
                                                   data-target="#editTieuDoiModal"
                                                   data-id="${item.id}"
                                                   data-ten="${item.tenTieuDoi}"
                                                   data-trungdoi="${item.trungDoi.id}"
                                                   data-daidoi="${item.trungDoi.daiDoi.id}"
                                                   data-tieudoan="${item.trungDoi.daiDoi.tieuDoan.id}">
                                                    <i class="bx bx-pencil" aria-hidden="true" title="Chỉnh sửa"></i>
                                                </a>
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
        <div id="editTieuDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmitModify">
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa Tiểu Đội</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="edit_id"/>

                            <div class="form-group">
                                <label class="font-weight-bold">Tên tiểu đội</label>
                                <input type="text" name="tenTieuDoi" id="edit_tenTieuDoi" class="form-control"
                                       required/>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Thuộc Tiểu đoàn</label>
                                <select class="form-control" id="edit_selectTieuDoan">
                                    <c:forEach var="td" items="${tieuDoanList}">
                                        <option value="${td.id}">${td.tenTieuDoan}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Trực thuộc Đại đội</label>
                                <select class="form-control" id="edit_selectDaiDoi">
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Trực thuộc Trung đội</label>
                                <select class="form-control" name="trungDoi" id="edit_idTrungDoi" required>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="modifyTieuDoi" type="submit" class="btn btn-success">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="deleteTieuDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Xác nhận xóa</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa các tiểu đội đã chọn?</p>
                    </div>
                    <div class="modal-footer">
                        <button id="deleteTieuDoi" type="button" class="btn btn-danger">Đồng ý xóa</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                // --- PHẦN 1: MODAL THÊM MỚI ---

                // Khi thay đổi Tiểu đoàn -> Reset và load Đại đội
                $('#selectTieuDoan').change(function () {
                    let id = $(this).val();
                    let $daiDoi = $('#selectDaiDoi');
                    let $trungDoi = $('#selectTrungDoi');

                    // Reset cả 2 cấp dưới về mặc định
                    $daiDoi.empty().append('<option value="">-- Chọn đại đội --</option>');
                    $trungDoi.empty().append('<option value="">-- Vui lòng chọn đại đội --</option>');

                    if (id) {
                        $.get('${layDaiDoiByTieuDoanUrl}/' + id, function (res) {
                            $.each(res, function (i, item) {
                                $daiDoi.append('<option value="' + item.id + '">' + item.tenDaiDoi + '</option>');
                            });
                        });
                    }
                });

                // Khi thay đổi Đại đội -> Reset và load Trung đội
                $('#selectDaiDoi').change(function () {
                    let id = $(this).val();
                    let $trungDoi = $('#selectTrungDoi');

                    $trungDoi.empty().append('<option value="">-- Chọn trung đội --</option>');

                    if (id) {
                        $.get('${layTrungDoiByDaiDoiUrl}/' + id, function (res) {
                            $.each(res, function (i, item) {
                                $trungDoi.append('<option value="' + item.id + '">' + item.tenTrungDoi + '</option>');
                            });
                        });
                    }
                });

                // --- PHẦN 2: MODAL CHỈNH SỬA ---

                $('.edit').click(function () {
                    let id = $(this).data('id');
                    let ten = $(this).data('ten');
                    let tieuDoanId = $(this).data('tieudoan');
                    let daiDoiId = $(this).data('daidoi');
                    let trungDoiId = $(this).data('trungdoi');

                    $('#edit_id').val(id);
                    $('#edit_tenTieuDoi').val(ten);
                    $('#edit_selectTieuDoan').val(tieuDoanId);

                    // Gọi chuỗi load dữ liệu ban đầu cho modal sửa [cite: 74]
                    loadDaiDoiForEdit(tieuDoanId, daiDoiId, trungDoiId);
                });

                function loadDaiDoiForEdit(tieuDoanId, selectedDaiDoiId, selectedTrungDoiId) {
                    let $selectDD = $('#edit_selectDaiDoi');
                    let $selectTD = $('#edit_idTrungDoi');

                    // QUAN TRỌNG: Reset dữ liệu cũ để tránh hiển thị sai khi đổi Tiểu đoàn [cite: 75]
                    $selectDD.empty().append('<option value="">-- Chọn đại đội --</option>');
                    $selectTD.empty().append('<option value="">-- Chọn trung đội --</option>');

                    if (tieuDoanId) {
                        $.get('${layDaiDoiByTieuDoanUrl}/' + tieuDoanId, function (res) {
                            $.each(res, function (i, item) {
                                $selectDD.append('<option value="' + item.id + '">' + item.tenDaiDoi + '</option>');
                            });
                            if (selectedDaiDoiId) {
                                $selectDD.val(selectedDaiDoiId);
                                loadTrungDoiForEdit(selectedDaiDoiId, selectedTrungDoiId);
                            }
                        });
                    }
                }

                function loadTrungDoiForEdit(daiDoiId, selectedTrungDoiId) {
                    let $selectTD = $('#edit_idTrungDoi');
                    $selectTD.empty().append('<option value="">-- Chọn trung đội --</option>');

                    if (daiDoiId) {
                        $.get('${layTrungDoiByDaiDoiUrl}/' + daiDoiId, function (res) {
                            $.each(res, function (i, item) {
                                $selectTD.append('<option value="' + item.id + '">' + item.tenTrungDoi + '</option>');
                            });
                            if (selectedTrungDoiId) {
                                $selectTD.val(selectedTrungDoiId);
                            }
                        });
                    }
                }

                // Sự kiện change cho Modal Sửa
                $('#edit_selectTieuDoan').change(function () {
                    loadDaiDoiForEdit($(this).val(), null, null);
                });

                $('#edit_selectDaiDoi').change(function () {
                    loadTrungDoiForEdit($(this).val(), null);
                });

                // --- PHẦN 3: CÁC THAO TÁC API (LƯU, CẬP NHẬT, XÓA) ---

                // Gửi form Thêm mới
                $('#btnSave').click(function (e) {
                    e.preventDefault();
                    sendAjaxRequest('${taoTieuDoiAPIurl}', '#formSubmit');
                });

                // Gửi form Cập nhật
                $('#modifyTieuDoi').click(function (e) {
                    e.preventDefault();
                    sendAjaxRequest('${capNhatTieuDoiAPIurl}', '#formSubmitModify');
                });

                // Hàm dùng chung cho Ajax Post [cite: 68, 86]
                function sendAjaxRequest(url, formId) {
                    let data = {};
                    let formData = $(formId).serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name] = v.value;
                    });

                    $.ajax({
                        url: url,
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        success: function () {
                            let msg = url.includes('tao-tieu-doi') ? 'create_success' : 'update_success';
                            window.location.href = "${tieuDoiUrl}?message=" + msg + "&alert=success";
                        },
                        error: function () {
                            window.location.href = "${tieuDoiUrl}?message=error&alert=danger";
                        }
                    });
                }

                // Xóa hàng loạt [cite: 90, 92]
                $('#deleteTieuDoi').click(function () {
                    let ids = $('tbody input[type=checkbox]:checked').map(function () {
                        return $(this).val();
                    }).get();

                    if (ids.length > 0) {
                        $.ajax({
                            url: '${xoaTieuDoiAPIurl}',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({ids: ids}),
                            success: function () {
                                window.location.href = "${tieuDoiUrl}?message=delete_success&alert=success";
                            }
                        });
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