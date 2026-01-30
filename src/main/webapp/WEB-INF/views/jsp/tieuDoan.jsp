<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="taoTieuDoanAPIurl" value="/api/v1/tieu-doan/tao-tieu-doan"/>
<c:url var="capNhatTieuDoanAPIurl" value="/api/v1/tieu-doan/cap-nhat-tieu-doan"/>
<c:url var="xoaTieuDoanAPIurl" value="/api/v1/tieu-doan/xoa-tieu-doan"/>
<c:url var="tieuDoanUrl" value="/danh-sach-tieu-doan"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý quân nhân</title>

    <link rel="icon"
          href="<c:url value='/template/images/LOGO 950.png'/>">
    <link
            href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>"
            rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet"
          href="<c:url value='/template/vendor/css/bootstrap.min.css'/>"
          type="text/css">
    <link rel="stylesheet"
          href="<c:url value='/template/vendor/css/style.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/menu/menu.css'/>"
          type="text/css">

    <script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
    <%-- <script src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js'/>" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     --%>

    <!-- Custom styles for this template -->
</head>
<body>
<!-- Header-->
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
                                <strong class="card-title">Danh sách tiểu đoàn</strong>
                            </div>
                            <div class="card-header">
                                <c:if test="${not empty message}">
                                    <div class="float-left">
                                        <div class="text-center float-left alert alert-${alert}">${message}</div>
                                    </div>
                                </c:if>
                                <div class="float-right">
                                    <a href="#addTieuDoanModal" class="btn btn-success" data-toggle="modal"><i
                                            class="fa fa-plus-circle" aria-hidden="true"></i> <span>Thêm</span></a>
                                    <a href="#deleteTieuDoanModal" class="btn btn-danger" data-toggle="modal"><i
                                            class="fa fa-trash-o" aria-hidden="true"></i> <span>Xóa</span></a>
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
                                        <th class="text-center">Tên tiểu đoàn</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${tieuDoanList}">
                                        <tr>
                                            <td class="text-center">
                                                  <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
                                                    <label for="checkbox_${item.id}"></label>
                                                </span>
                                            </td>
                                            <td><span class="show-less">${item.tenTieuDoan}</span></td>
                                            <c:if test="${item.status == 1}">
                                                <td class="text-center"><span class="status text-success">&bull;</span>Hoạt
                                                    động
                                                </td>
                                            </c:if>
                                            <c:if test="${item.status == 0}">
                                                <td class="text-center"><span class="status text-danger">&bull;</span>Tạm
                                                    ngưng
                                                </td>
                                            </c:if>
                                            <td class="text-center">
                                                <a href="#" class="edit" data-toggle="modal"
                                                   data-target="#editTieuDoanModal"
                                                   data-id="${item.id}"
                                                   data-ten="${item.tenTieuDoan}">
                                                    <i class="bx bx-pencil" aria-hidden="true" data-toggle="tooltip"
                                                       title="Chỉnh sửa"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


        <!-- Add Modal HTML -->
        <div id="addTieuDoanModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmitAdd">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm Tiểu Đoàn</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                          <div class="form-group">
                            <label class="font-weight-bold">Tên tiểu đoàn</label>
                            <input type="text" name="tenTieuDoan" class="form-control"/>
                          </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="addTieuDoan" type="submit" class="btn btn-success">Thêm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modify Modal HTML -->
        <div id="editTieuDoanModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="formSubmitModify">
                        <div class="modal-header">
                            <h4 class="modal-title">Chỉnh sửa Tiểu Đoàn</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="id" id="edit_id"/>
                            <div class="form-group">
                                <label class="font-weight-bold">Tên tiểu đoàn</label>
                                <input type="text" name="tenTieuDoan" id="edit_tenTieuDoan" class="form-control"/>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="modifyTieuDoan" type="submit" class="btn btn-success">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteTieuDoanModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">
                            <h4 class="modal-title">Xóa điều kiện </h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Bạn chắc chắn muốn xóa những điều kiện này?</p>
                            <p class="text-warning"><small>Hành động này sẽ không thể khôi phục lại.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                            <button id="deleteTieuDoan" type="submit" class="btn btn-danger">Xóa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            // let editor = '';
            // $(document).ready(function () {
            //     editor = CKEDITOR.replace('tenTieuDoan', {
            //         language: "vi"
            //     });
            // });

            $('#addTieuDoan').click(function (e) {
                e.preventDefault();
                let data = {}; // mang object name: value
                let formData = $('#formSubmitAdd').serializeArray();
                // vong lap
                $.each(formData, function (i, v) {
                    data['' + v.name] = v.value
                });
                // data['tenTieuDoan'] = editor.getData();
                addTieuDoan(data);
            })

            function addTieuDoan(data) {
                $('.load').show();
                $.ajax({
                    url: '${taoTieuDoanAPIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        $('.load').hide();
                        if (result !== null)
                            window.location.href = "${tieuDoanUrl}?message=create_success&alert=success";
                        else
                            window.location.href = "${tieuDoanUrl}?message=create_fail&alert=danger";
                    },
                    error: function (error) {
                        $('.load').hide();
                        window.location.href = "${tieuDoanUrl}?message=system_error&alert=danger";
                    }
                })
            }


            // 1. Khi bấm nút Edit: Lấy data từ hàng đó điền vào Modal
                $('.edit').click(function () {
                    var id = $(this).data('id');
                    var ten = $(this).data('ten');

                    $('#edit_id').val(id);
                    $('#edit_tenTieuDoan').val(ten);
                });

                // 2. Xử lý gửi API Cập nhật
                $('#modifyTieuDoan').click(function (e) {
                    e.preventDefault();
                    let data = {};
                    let formData = $('#formSubmitModify').serializeArray();
                    $.each(formData, function (i, v) {
                        data["" + v.name] = v.value;
                    });

                    updateTieuDoan(data);
                });


            function updateTieuDoan(data) {

                $.ajax({
                    url: '${capNhatTieuDoanAPIurl}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        if (result !== null)
                            window.location.href = "${tieuDoanUrl}?message=update_success&alert=success";
                        else
                            window.location.href = "${tieuDoanUrl}?message=update_fail&alert=danger";
                    },
                    error: function (error) {
                        $(".load").hide();
                        window.location.href = "${tieuDoanUrl}?message=system_error&alert=danger";
                    }
                });
            }

            $('#deleteTieuDoan').click(function (e) {
                e.preventDefault();
                let data = {}; // mang object name: value
                // lay data khi check vao cac checkbox
                let dataArray = $('tbody input[type=checkbox]:checked').map(function () {
                    return $(this).val(); // lay value cua input checked
                }).get();
                if (dataArray.length != 0) {
                    data['ids'] = dataArray;
                    deleteTieuDoan(data);
                }
            })

            function deleteTieuDoan(data) {
                $('.load').show();
                $.ajax({
                    url: '${xoaTieuDoanAPIurl}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        $('.load').hide();
                        if (result)
                            window.location.href = "${tieuDoanUrl}?message=delete_success&alert=success";
                        else
                            window.location.href = "${tieuDoanUrl}?message=delete_fail&alert=danger";
                    },
                    error: function (error) {
                        $('.load').hide();
                        window.location.href = "${tieuDoanUrl}?message=system_error&alert=danger";
                    }
                })
            }


        </script>
        <%@ include file="/common/footer.jsp" %>
    </div>
</div>


<!-- Bootstrap core JavaScript -->
<%-- 	<script src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js'/>" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 --%>
<script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
<script src="<c:url value='/template/vendor/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/template/menu/dropDownSidebarMenu.js'/>"></script>
<script src="<c:url value='/template/vendor/js/ckeditor/ckeditor.js'/>"></script>
</body>
</html>
