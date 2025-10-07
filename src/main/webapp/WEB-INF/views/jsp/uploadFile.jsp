<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="homeURL" value="/home" />
<c:url var="listFileURL" value="/list-file" />
<c:url var="uploadFileURL" value="/uploadFile" />
<c:url var="uploadFileAPI" value='/api/uploadFile' />
<c:url var="renameFileAPI" value='/api/renameFile' />
<c:url var="deleteFileAPI" value='/api/deleteFile' />

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>DXC Assure Policy</title>

</head>

<body>

	<!-- Page Content -->
	<div class="container-fluid home-page-content">

		<c:if test="${action.equals('C')}">
			<h2 class="title">File detail</h2>
		</c:if>
		<c:if test="${action.equals('M')}">
			<h2 class="title">Upload file</h2>
		</c:if>
		<div class="row">
			<div class="text-center float-left text-success info successMes ml-4"></div>
			<div class="text-center float-left text-danger info errorMes ml-4"></div>
		</div>
		<div class="row">
			<div class="page-content col-12">
				<div class="row">
					<div class="col-12">
						<form:form class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="file">
							<div class="form-content">
								<div class="row">
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3">Folder
											Name</label>
										<div class="col-9">
											<form:select path="folderName" maxlength="80">
												<c:if test="${not empty file.folderName}">
													<c:forEach var="item" items="${folderNames}">
														<c:if test="${item.code == file.folderName}">
															<option value="${item.code}" selected="true">${item.value}</option>
														</c:if>
													</c:forEach>

												</c:if>
												<c:if test="${empty file.folderName}">
													<form:option value="" label="-- Select --" />
													<c:forEach var="item" items="${folderNames}">
														<option value="${item.code}">${item.value}</option>
													</c:forEach>
												</c:if>
											</form:select>
										</div>
										<p class="error errfolderName ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Upload file</label>
										<div class="col-9">
											<c:if test="${action.equals('C')}">
												<form:input path="name" type="file" id="uploadFile"
													cssClass="col-12 pl-1" />
											</c:if>
											<c:if test="${action.equals('M')}">
												<form:input path="name" id="uploadFile"
													cssClass="col-12 pl-1" />
											</c:if>
										</div>
										<p class="error errname ml-3"></p>
									</div>
									<div class="form-group col-4">
										<div class="col-9">
											<c:if test="${action.equals('M')}">
												<form:input path="uniqueNumber" type="hidden"
													value="${item.uniqueNumber}" cssClass="col-12 pl-1" />
											</c:if>
										</div>
									</div>
								</div>
							</div>
							<div class="clearfix form-actions form-btn">
								<c:if test="${action.equals('C')}">
									<button class="btn btn-info" type="button" id="btnUpload">
										<i class="ace-icon fa fa-check bigger-110"></i>Upload
									</button>
									<button class="btn" id="btnCancle">
									<i class="ace-icon fa fa-undo bigger-110"></i> Cancle
								</button>
								</c:if>

								<c:if test="${action.equals('M')}">
									<button class="btn btn-info" type="button" id="btnRename">
										<i class="ace-icon fa fa-check bigger-110"></i>Rename
									</button>
									<button class="btn btn-danger" type="button" id="btnRemove">
										<i class="ace-icon fa fa-check bigger-110"></i>Remove
									</button>
									<button class="btn" id="btnContinue">
									<i class="ace-icon fa fa-undo bigger-110"></i> Cancle
								</button>
								</c:if>

								
							</div>
					</div>
					</form:form>
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
	
	$('#btnRename').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
     	renameFile(data);
	});
	
	function renameFile(data) {
		$.ajax({
            url: '${renameFileAPI}',
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
            		$('.successMes').show().text(" Renamed file successfully "+result.name);
            	}
            },
            error: function (error) {
            	$('.successMes').hide();
            	$('.error').hide();
            	$('.errorMes').show().text("Error System!");
            }
        });
	}
	
	
	$('#btnRemove').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
     	removeFile(data);
	});
	
	function removeFile(data) {
		$.ajax({
            url: '${deleteFileAPI}',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${listFileURL}?folder="+ result.folderName 
            							+ "&message=File " + result.name +" deleted successfully";
            },
            error: function (error) {
            	$('.errorMes').show().text("Error System!");
            }
        });
	}
	
	$('#btnRemove').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
     	removeFile(data);
	});
	
		$('#btnContinue').click(function (e) {
	   window.location.href = "${homeURL}";
	});
	
	$('#btnCancle').click(function (e) {
	   window.location.href = "${uploadFileURL}";
	});
	
	</script>
</body>

</html>