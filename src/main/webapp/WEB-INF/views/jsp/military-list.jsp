<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="MilitaryUrl" value="/military-list"/>
<c:url var="deleteMilitaryAPI" value='/api/v1/military/delete'/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Military Management</title>

<link rel="icon"
	href="<c:url value='/template/images/LOGO 950.png'/>">
<link
	href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>"
	rel="stylesheet" />

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
<div class="load" style="display: none">
        <img src="<c:url value='/template/images/loading.gif'/>">
    </div>
	<%@ include file="/common/header.jsp"%>
	<div>
		<%@ include file="/common/menu.jsp"%>
		<div class="home-section">
			<body>
<div class="content home-page-content">
    <div class="animated fadeIn">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <strong class="card-title">Danh sách quân nhân</strong>
                    </div>
                    <div class="card-header">

                        <%--<div class="float-right">
                               <a href="<c:url value='/api/v1/military/export/excel'/>" class="btn btn-success mb-3">
                                    <i class='bx bxs-file-export'></i> Xuất Excel
                               </a>
                            <a href="#deleteUserModal" class="btn btn-danger" data-toggle="modal"><i
                                    class="fa fa-trash-o" aria-hidden="true"></i> <span>Xóa</span></a>
                        </div>--%>
                        <div class="row mb-3">
                            <div class="col-8">
                                <form action="<c:url value='/military-list'/>" method="get" class="form-inline">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="keyword"
                                               placeholder="Nhập tên, số hiệu QN, CCCD..."
                                               value="${keyword}" style="width: 300px;"/>
                                    </div>
                                    <button type="submit" class="btn btn-primary ml-2">
                                        <i class='bx bx-search'></i> Tìm kiếm
                                    </button>
                                    <a href="<c:url value='/military-list'/>" class="btn btn-secondary ml-2">Làm mới</a>
                                </form>
                            </div>
                            <div class="col-4 text-right">
                                <a href="<c:url value='/api/v1/military/export/excel'/>" class="btn btn-success">
                                    <i class='bx bxs-file-export'></i> Xuất Excel
                                </a>
                                <a href="#deleteUserModal" class="btn btn-danger" data-toggle="modal"><i
                                    class="fa fa-trash-o" aria-hidden="true"></i> <span>Xóa</span></a>
                            </div>

                        </div>
                        <c:if test="${not empty message}">
                            <div class="text-center float-left alert alert-${alert}">${message}</div>
                        </c:if>
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
                                <th class="text-center">Họ và tên</th>
                                <th class="text-center">Số hiệu QN</th>
                                <th class="text-center">CCCD</th>
                                <th class="text-center">Chức vụ</th>
                                <th class="text-center">Cấp bậc</th>
                                <th class="text-center">Ngày sinh</th>
                                <th class="text-center">Trạng thái</th>x
                                <th class="text-center">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${militarys}">
                                <tr>
                                    <td class="text-center">
                                                 <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
                                                    <label for="checkbox_${item.id}"></label>
                                                </span>
                                    </td>
                                    <td>${item.birthFullName}</td>
                                    <td>${item.militaryIdNumber}</td>
                                    <td>${item.nationalIdNumber}</td>
                                    <td>${item.position}</td>
                                    <td>${item.militaryRank}</td>
                                    <td>${item.dateOfBirth}</td>

                                    <c:if test="${item.status == 1}">
                                        <td class="text-center"><span class="status text-success">&bull;</span>Tại ngũ
                                        </td>
                                    </c:if>
                                    <c:if test="${item.status == 0}">
                                        <td class="text-center"><span class="status text-danger">&bull;</span>Xuất ngũ
                                        </td>
                                    </c:if>
                                    <td class="text-center">
                                        <a href="<c:url value='/modify-military/${item.id}'/>" class="edit">
                                            <i class="bx bx-pencil" aria-hidden="true" data-toggle="tooltip"
                                               title="Chỉnh sửa"></i>
                                        </a>

                                        <a href="<c:url value='/api/v1/military/export/word/${item.id}' />">
                                            <i class="bx bxs-file-doc" aria-hidden="true" data-toggle="tooltip"
                                               title="Xuất file Word"></i>
                                        </a>

                                        <a href="<c:url value='/enquiry-military/${item.id}' />">
                                            <i class='bx bx-show' aria-hidden="true" data-toggle="tooltip"
                                               title="Xem"></i>
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
    </div><!-- .animated -->
</div><!-- .content -->

<!-- Delete Modal HTML -->
<div id="deleteUserModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h4 class="modal-title">Xóa Quân Nhân</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Bạn chắc chắn muốn xóa những quân nhân này?</p>
                    <p class="text-warning"><small>Hành động này sẽ không thể khôi phục lại.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <button id="deleteUser" type="submit" class="btn btn-danger" >Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>


    $('#deleteUser').click(function (e) {
        e.preventDefault();
        let data = {}; // mang object name: value
        // lay data khi check vao cac checkbox
        let dataArray = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val(); // lay value cua input checked
        }).get();
        if (dataArray.length != 0) {
            data['ids'] = dataArray;
            deleteUser(data);
        }
    })

    function deleteUser(data) {
        $('.load').show();
        $.ajax({
            url: '${deleteMilitaryAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                $('.load').hide();
                if(result)
                    window.location.href = "${MilitaryUrl}?message=delete_success&alert=success";
                else
                    window.location.href = "${MilitaryUrl}?message=delete_fail&alert=danger";
            },
            error: function (error) {
                $('.load').hide();
                window.location.href = "${MilitaryUrl}?message=system_error&alert=danger";
            }
        })
    }


</script>
</body>
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>



	<!-- Bootstrap core JavaScript -->
<%-- 	<script src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.js'/>" integrity="sha512-CX7sDOp7UTAq+i1FYIlf9Uo27x4os+kGeoT7rgwvY+4dmjqV0IuE/Bl5hVsjnQPQiTOhAX1O2r2j5bjsFBvv/A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 --%>
<script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
	<script src="<c:url value='/template/vendor/js/bootstrap.bundle.js'/>"></script>
	<script src="<c:url value='/template/menu/dropDownSidebarMenu.js'/>"></script>
</body>
</html>

