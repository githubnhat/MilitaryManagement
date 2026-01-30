<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="taoTrungDoiAPIurl" value="/api/v1/trung-doi/tao-trung-doi"/>
<c:url var="trungDoiUrl" value="/danh-sach-trung-doi"/>
<c:url var="capNhatTrungDoiAPIurl" value="/api/v1/trung-doi/cap-nhat-trung-doi"/>
<c:url var="xoaTrungDoiAPIurl" value="/api/v1/trung-doi/xoa-trung-doi"/>
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
                                    <a href="#addTrungDoiModal" class="btn btn-success" data-toggle="modal"><i
                                            class="fa fa-plus-circle"></i> <span>Thêm</span></a>
                                    <a href="#deleteTrungDoiModal" class="btn btn-danger" data-toggle="modal"><i
                                            class="fa fa-trash-o"></i> <span>Xóa</span></a>
                                </div>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="text-center">
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="selectAll">
                                                    <label for="selectAll"></label>
                                                </span>
                                        </th>
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
                                            <td class="text-center">
                                                  <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
                                                    <label for="checkbox_${item.id}"></label>
                                                </span>
                                            </td>
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
                                                <a href="#" class="edit" data-toggle="modal"
                                                   data-target="#editTrungDoiModal"
                                                   data-id="${item.id}"
                                                   data-ten="${item.tenTrungDoi}"
                                                   data-tieudoan="${item.daiDoi.tieuDoan.id}"
                                                   data-daidoi="${item.daiDoi.id}">
                                                    <i class='bx bxs-edit'></i>
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

        <div id="editTrungDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmitModify">
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa Trung Đội</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="edit_id"/>

                            <div class="form-group">
                                <label class="font-weight-bold">Tên trung đội</label>
                                <input type="text" name="tenTrungDoi" id="edit_tenTrungDoi" class="form-control"
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
                                <select class="form-control" name="daiDoi" id="edit_idDaiDoi" required>
                                    <c:forEach var="dd" items="${daiDoiList}">
                                        <option value="${dd.id}">${dd.tenDaiDoi}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="modifyTrungDoi" type="submit" class="btn btn-success">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="deleteTrungDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Xóa Trung Đội</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn chắc chắn muốn xóa những trung đội đã chọn?</p>
                            <p class="text-warning"><small>Hành động này sẽ không thể khôi phục lại.</small>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="deleteTrungDoi" type="submit" class="btn btn-danger">Xóa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                // --- 1. XỬ LÝ MODAL THÊM MỚI ---
                $('#selectTieuDoan').change(function () {
                    let id = $(this).val();
                    let $selectDaiDoi = $('#selectDaiDoi');
                    $selectDaiDoi.empty().append('<option value="">-- Chọn đại đội --</option>');

                    if (id) {
                        $.get('${layDaiDoiByTieuDoanUrl}/' + id, function (res) {
                            $.each(res, function (i, item) {
                                $selectDaiDoi.append('<option value="' + item.id + '">' + item.tenDaiDoi + '</option>');
                            });
                        });
                    }
                });

                $('#addTrungDoiBtn').click(function (e) {
                    e.preventDefault();
                    sendAjaxRequest('${taoTrungDoiAPIurl}', '#formSubmit', 'create_success');
                });

                // --- 2. XỬ LÝ MODAL CHỈNH SỬA ---
                $('.edit').click(function () {
                    let id = $(this).data('id');
                    let ten = $(this).data('ten');
                    let tieuDoanId = $(this).data('tieudoan');
                    let daiDoiId = $(this).data('daidoi');

                    // Điền dữ liệu vào Modal
                    $('#edit_id').val(id);
                    $('#edit_tenTrungDoi').val(ten);
                    $('#edit_selectTieuDoan').val(tieuDoanId);

                    // Load danh sách Đại đội dựa trên Tiểu đoàn đã chọn
                    loadDaiDoiForEdit(tieuDoanId, daiDoiId);
                });

                function loadDaiDoiForEdit(tieuDoanId, selectedDaiDoiId) {
                    let $selectDD = $('#edit_idDaiDoi');
                    $selectDD.empty().append('<option value="">-- Chọn đại đội --</option>');

                    if (tieuDoanId) {
                        $.get('${layDaiDoiByTieuDoanUrl}/' + tieuDoanId, function (res) {
                            $.each(res, function (i, item) {
                                $selectDD.append('<option value="' + item.id + '">' + item.tenDaiDoi + '</option>');
                            });
                            // Tự động chọn Đại đội hiện tại sau khi danh sách được tải xong
                            if (selectedDaiDoiId) {
                                $selectDD.val(selectedDaiDoiId);
                            }
                        });
                    }
                }

                // Khi thay đổi Tiểu đoàn trong Modal Sửa
                $('#edit_selectTieuDoan').change(function () {
                    loadDaiDoiForEdit($(this).val(), null);
                });

                // Gửi yêu cầu cập nhật
                $('#modifyTrungDoi').click(function (e) {
                    e.preventDefault();
                    sendAjaxRequest('${capNhatTrungDoiAPIurl}', '#formSubmitModify', 'update_success');
                });

                // --- 3. HÀM DÙNG CHUNG & XÓA ---
                function sendAjaxRequest(url, formId, msgType) {
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
                            window.location.href = "${trungDoiUrl}?message=" + msgType + "&alert=success";
                        },
                        error: function () {
                            window.location.href = "${trungDoiUrl}?message=system_error&alert=danger";
                        }
                    });
                }

                $('#deleteTrungDoi').click(function (e) {
                    e.preventDefault();
                    let ids = $('tbody input[type=checkbox]:checked').map(function () {
                        return $(this).val();
                    }).get();

                    if (ids.length > 0) {
                        $.ajax({
                            url: '${xoaTrungDoiAPIurl}',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({ids: ids}),
                            success: function () {
                                window.location.href = "${trungDoiUrl}?message=delete_success&alert=success";
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