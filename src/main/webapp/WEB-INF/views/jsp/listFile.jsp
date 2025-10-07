<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="homeURL" value="/home" />
<c:url var="uploadFileAPI" value='/api/uploadFile' />

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>DXC Assure Policy</title>

</head>

<body>

	<!-- Page Content -->
	<div class="container-fluid home-page-content">
		<h2 class="title">List File</h2>
		<div class="row">
			<c:if test="${not empty message}">
				<div class="text-center float-left text-success ml-4">${message}</div>
			</c:if>
		</div>
		<div class="row">
			<div class="page-content col-12">
				<div class="row">
					<div class="col-12">
						<table id="bootstrap-data-table-export"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th class="text-center">File Name</th>
									<th class="text-center">Folder Name</th>
									<th class="text-center">Created Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${listFiles}">
									<tr>
										<td><a
											href="<c:url value='/upload-file?filename=${item.name}&id=${item.uniqueNumber}'/>">
												${item.name}</a></td>
										<td>${item.folderName}</td>
										<td>${item.createdDate}</td>
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
	<!-- /.container -->
	<script>
		$('#btnUpload').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        data['uploadFiles'] = {};
        var files = $('#uploadFile')[0].files[0];
        	if(files != undefined) {
        		var reader = new FileReader();
        		reader.onload = function(e) {
        			data['base64'] = e.target.result;
        			data['name'] = files.name;
        			uploadFile(data)
        		};	
        		reader.readAsDataURL(files);
        	}
	});
	
	function uploadFile(data) {
		$.ajax({
            url: '${uploadFileAPI}',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	if(result.errField != null){
            		$('.successMes').hide();
            		$('.error').hide();
            		$('.errorMes').hide();
            			for(let i = 0; i < result.errField.length; i++){
            				var classErr =".err"+ result.errField[i];
            				$(classErr).show().text(result.errDesc[i]);
            		}
            	} else {
            		$('.error').hide();
            		$('.errorMes').hide();
            		$('.successMes').show().text(result.name + " uploaded successfully!");
            	}
            },
            error: function (error) {
            	$('.successMes').hide();
            	$('.error').hide();
            	$('.errorMes').show().text("Error System!");
            }
        });
	}
	
	
	
	</script>
</body>

</html>