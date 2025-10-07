<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="modifyPolicyURL" value='/modify-policy' />
<c:url var="homeURL" value="/home" />
<c:url var="validatePolicyNoAPI" value='/api/policy/validate' />
<c:url var="issuePolicyAPI" value='/api/policy/issue' />
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
			<h2 class="title">Modify account</h2>
		</c:if>
		<c:if test="${action.equals('I')}">
			<h2 class="title">Inquire on account info</h2>
		</c:if>
		<div class="page-content">
			<div class="row">
				<div class="col-12">
					<form:form class="form-horizontal" role="form" id="formSubmit"
						modelAttribute="policy">
						<div class="form-content">
							<div class="row">
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										for="form-field-1">Policy no</label>
									<div class="col-9">
										<form:input path="policyNo" maxlength="8"
											cssClass="col-5 pl-1" />
									</div>
									<p class="error errpolicyNo ml-3"></p>
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
								<button class="btn btn-info" type="button" id="btnIssue">
									<i class="ace-icon fa fa-check bigger-110"></i>Issue
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
	    	modifyPolicy(data);
	});
	
	function modifyPolicy(data) {
		$.ajax({
            url: '${validatePolicyNoAPI}',
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
            		window.location.href = "${modifyPolicyURL}?policyno=" + result.policyNo;
            	}
            },
            error: function (error) {
            	window.location.href = "${editClientURL}";
            }
        });
	}
	
		$('#btnIssue').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    	issuePolicy(data);
	});
	
	function issuePolicy(data) {
		$.ajax({
            url: '${issuePolicyAPI}',
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
            		window.location.href = "${homeURL}?message=Issue policy " + result.policyNo +" successfully";;
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