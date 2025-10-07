<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="clientURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="modifyClientURL" value='/modify-client' />
<c:url var="inquireClientURL" value='/inquire-client' />
<c:url var="homeURL" value="/home" />
<c:url var="validateClientNumAPI" value='/api/client/validate' />
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>DXC Assure Policy</title>

</head>

<body>

	<!-- Page Content -->
	<div class="container-fluid home-page-content">

		<c:if test="${action.equals('M')}">
			<h2 class="title">Modify client</h2>
		</c:if>
		<c:if test="${action.equals('I')}">
			<h2 class="title">Inquire on client info</h2>
		</c:if>
		<div class="page-content">
			<div class="row">
				<div class="col-12">
					<form:form class="form-horizontal" role="form" id="formSubmit"
						modelAttribute="client">
						<div class="form-content">
							<div class="row">
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										for="form-field-1">Client Number</label>
									<div class="col-9">
										<form:input path="clientNumber" maxlength="8"
											cssClass="col-5 pl-1" />
									</div>
									<p class="error errclientNumber ml-3"></p>
								</div>
							</div>
						</div>
						<div class="clearfix form-actions form-btn">
							<div>
							<c:if test="${action.equals('M')}">
								<button class="btn btn-info" type="button" id="btnModify">
									<i class="ace-icon fa fa-check bigger-110"></i>Continue
								</button>
							</c:if>
							
							<c:if test="${action.equals('I')}">
								<button class="btn btn-info" type="button" id="btnInquiry">
									<i class="ace-icon fa fa-check bigger-110"></i>Continue
								</button>
							</c:if>
								<button class="btn" id="btnCancle">
									<i class="ace-icon fa fa-undo bigger-110"></i> Cancle
								</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->
	<script>
		$('#btnModify').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    	modifyClient(data);
	});
	
	function modifyClient(data) {
		$.ajax({
            url: '${validateClientNumAPI}',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	if(result.errField != null){
            		$('.error').hide();
            			for(let i = 0; i < result.errField.length; i++){
            				var classErr =".err"+ result.errField[i];
            				$(classErr).show().text(result.errDesc[i]);
            		}
            	} else {
            		window.location.href = "${modifyClientURL}?clientnumber=" + result.clientNumber;
            	}
            },
            error: function (error) {
            	window.location.href = "${editClientURL}";
            }
        });
	}
	
		$('#btnInquiry').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    	inquiryClient(data);
	});
	
	function inquiryClient(data) {
		$.ajax({
            url: '${validateClientNumAPI}',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	if(result.errField != null){
            		$('.error').hide();
            			for(let i = 0; i < result.errField.length; i++){
            				var classErr =".err"+ result.errField[i];
            				$(classErr).show().text(result.errDesc[i]);
            		}
            	} else {
            		window.location.href = "${inquireClientURL}?clientnumber=" + result.clientNumber;
            	}
            },
            error: function (error) {
            	window.location.href = "${editClientURL}";
            }
        });
	}
	
	$('#btnContinue').click(function (e) {
	   window.location.href = "${homeURL}";
	});
	
	$('#btnCancle').click(function (e) {
	   window.location.href = "${homeURL}";
	});
	</script>
</body>

</html>