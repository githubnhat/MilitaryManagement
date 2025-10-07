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
		<h2 class="title">List Folder</h2>
		<div class="row">
			<div class="text-center float-left text-success info successMes ml-4"></div>
			<div class="text-center float-left text-danger info errorMes ml-4"></div>
		</div>
		<div class="row">
			<div class="page-content col-12">
				<div class="row">
					<div class="col-12">
						<c:if test="${not empty folderNames}">
							<div class="row">
								<c:forEach var="item" items="${folderNames}">
									<div class="col-12">
										<a href="<c:url value='/list-file?folder=${item.value}'/>">${item.value}</a>
									</div>
								</c:forEach>
							</div>
						</c:if>
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