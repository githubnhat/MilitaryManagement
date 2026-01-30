<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="taoDaiDoiAPIurl" value="/api/v1/dai-doi/tao-dai-doi"/>
<c:url var="capNhatDaiDoiAPIurl" value="/api/v1/dai-doi/cap-nhat-dai-doi"/>
<c:url var="xoaDaiDoiAPIurl" value="/api/v1/dai-doi/xoa-dai-doi"/>
<c:url var="daiDoiUrl" value="/danh-sach-dai-doi"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Đại đội</title>
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
                                <strong class="card-title">Danh sách đại đội</strong>
                            </div>
                            <div class="card-header">
                                <c:if test="${not empty message}">
                                    <div class="text-center float-left alert alert-${alert}">${message}</div>
                                </c:if>
                                <div class="float-right">
                                    <a href="#addDaiDoiModal" class="btn btn-success" data-toggle="modal"><i class="fa fa-plus-circle" aria-hidden="true"></i> <span>Thêm</span></a>
                                    <a href="#deleteDaiDoiModal" class="btn btn-danger" data-toggle="modal"><i class="fa fa-trash-o" aria-hidden="true"></i> <span>Xóa</span></a>
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
                                        <th class="text-center">Tên Đại đội</th>
                                        <th class="text-center">Thuộc Tiểu đoàn</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${daiDoiList}">
                                        <tr>
                                            <td class="text-center">
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
                                                    <label for="checkbox_${item.id}"></label>
                                                </span>
                                            </td>
                                            <td><span class="show-less">${item.tenDaiDoi}</span></td>
                                            <td>${item.tieuDoan.tenTieuDoan}</td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${item.status == 1}">
                                                        <span class="status text-success">&bull;</span>Hoạt động
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status text-danger">&bull;</span>Tạm ngưng
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <a href="#" class="edit" data-toggle="modal"
                                                   data-target="#editDaiDoiModal"
                                                   data-id="${item.id}"
                                                   data-ten="${item.tenDaiDoi}"
                                                   data-tieudoan="${item.tieuDoan.id}">
                                                    <i class="bx bx-pencil" aria-hidden="true" data-toggle="tooltip"
                                                       title="Chỉnh sửa"></i>
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

        <div id="addDaiDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmit">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm Đại Đội</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label class="font-weight-bold">Tên đại đội</label>
                                <input type="text" name="tenDaiDoi" class="form-control" required/>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Trực thuộc tiểu đoàn</label>
                                <select class="form-control" name="tieuDoan" id="idTieuDoan" required>
                                    <option value="">-- Chọn tiểu đoàn --</option>
                                    <c:forEach var="tieuDoan" items="${tieuDoanList}">
                                        <option value="${tieuDoan.id}">${tieuDoan.tenTieuDoan}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="addDaiDoi" type="submit" class="btn btn-success">Thêm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="editDaiDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmitModify">
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa Đại Đội</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="edit_id"/>
                            <div class="form-group">
                                <label class="font-weight-bold">Tên đại đội</label>
                                <input type="text" name="tenDaiDoi" id="edit_tenDaiDoi" class="form-control" required/>
                            </div>
                            <div class="form-group">
                                <label class="font-weight-bold">Trực thuộc tiểu đoàn</label>
                                <select class="form-control" name="tieuDoan" id="edit_idTieuDoan" required>
                                    <c:forEach var="tieuDoan" items="${tieuDoanList}">
                                        <option value="${tieuDoan.id}">${tieuDoan.tenTieuDoan}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="modifyDaiDoi" type="submit" class="btn btn-success">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="deleteDaiDoiModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Xóa Đại Đội</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn chắc chắn muốn xóa những đại đội đã chọn?</p>
                            <p class="text-warning"><small>Hành động này không thể hoàn tác.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="deleteDaiDoi" type="submit" class="btn btn-danger">Xóa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $('#addDaiDoi').click(function (e) {
                e.preventDefault();
                let data = {};
                let formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data['' + v.name] = v.value;
                });
                $.ajax({
                    url: '${taoDaiDoiAPIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        window.location.href = "${daiDoiUrl}?message=create_success&alert=success";
                    },
                    error: function (error) {
                        window.location.href = "${daiDoiUrl}?message=system_error&alert=danger";
                    }
                })
            });
            $('.edit').click(function () {
        var id = $(this).data('id');
        var ten = $(this).data('ten');
        var tieuDoanId = $(this).data('tieudoan');

        $('#edit_id').val(id);
        $('#edit_tenDaiDoi').val(ten);
        $('#edit_idTieuDoan').val(tieuDoanId);
    });

    // 2. Gửi API Cập nhật
    $('#modifyDaiDoi').click(function (e) {
        e.preventDefault();
        let data = {};
        let formData = $('#formSubmitModify').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name] = v.value;
        });

        $.ajax({
            url: '${capNhatDaiDoiAPIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${daiDoiUrl}?message=update_success&alert=success";
            },
            error: function (error) {
                window.location.href = "${daiDoiUrl}?message=system_error&alert=danger";
            }
        });
    });

    // 3. Xử lý Xóa hàng loạt
    $('#deleteDaiDoi').click(function (e) {
        e.preventDefault();
        let ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        if (ids.length > 0) {
            $.ajax({
                url: '${xoaDaiDoiAPIurl}',
                type: 'POST', // Hoặc DELETE tùy theo Controller
                contentType: 'application/json',
                data: JSON.stringify({ids: ids}),
                success: function (result) {
                    window.location.href = "${daiDoiUrl}?message=delete_success&alert=success";
                },
                error: function (error) {
                    window.location.href = "${daiDoiUrl}?message=system_error&alert=danger";
                }
            });
        }
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