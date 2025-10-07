<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="editClientURL" value='/create-military' />
<c:url var="homeURL" value="/home" />
<c:url var="createPolicyAPI" value='/api/policy/create' />
<c:url var="refreshPolicyAPI" value='/api/policy/refresh' />
<c:url var="modifyPolicyAPI" value='/api/policy/modify' />
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
			<h2 class="title">Create policy</h2>
		</c:if>
		<c:if test="${action.equals('M')}">
			<h2 class="title">Modify policy</h2>
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
										 >Policy No</label>
									<div class="col-9">
										<form:input path="policyNo" maxlength="8"
											cssClass="col-5 pl-1" readonly="true" />
									</div>
									<p class="error errpolicyNo ml-3"></p>
								</div>
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Inception Date</label>
									<div class="col-9">
										<form:input path="inceptionDate" type="date"
											cssClass="col-7 pl-1" />
									</div>
									<p class="error errinceptionDate ml-3"></p>
								</div>
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Expiry Date</label>
									<div class="col-9">
										<form:input path="expiryDate" type="date"
											cssClass="col-7 pl-1" />
									</div>
									<p class="error errexpiryDate ml-3"></p>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Policy Owner</label>
									<div class="col-9">
										<form:input path="policyOwner" maxlength="8"
											cssClass="col-5 pl-1" />
									</div>
									<p class="error errpolicyOwner ml-3"></p>
								</div>
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Engine No</label>
									<div class="col-9">
										<form:input path="engineNo" maxlength="30"
											cssClass="col-9 pl-1" />
									</div>
									<p class="error errengineNo ml-3"></p>
								</div>
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Chassis No</label>
									<div class="col-9">
										<form:input path="chassisNo" maxlength="30"
											cssClass="col-9 pl-1" />
									</div>
									<p class="error errchassisNo ml-3"></p>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Vehicle Registration No</label>
									<div class="col-9">
										<form:input path="vehicleRegistrationNo" maxlength="30"
											cssClass="col-12 pl-1" />
									</div>
									<p class="error errvehicleRegistrationNo ml-3"></p>
								</div>
<%--								<div class="form-group col-4">--%>
<%--									<label for="gender" class="control-label no-padding-right ml-3">Billing--%>
<%--										Currency</label>--%>
<%--									<div class="col-9">--%>
<%--										<form:select path="billingCurrency" maxlength="30"--%>
<%--											id="maritalStatus">--%>
<%--											<form:option value="" label="-- Select --" />--%>
<%--											<c:if test="${not empty client.billingCurrency}">--%>
<%--												<c:forEach var="item" items="${billingCurrency}">--%>
<%--													<c:choose>--%>
<%--														<c:when test="${item.code == client.billingCurrency}">--%>
<%--															<option value="${item.code}" selected="true">${item.value}</option>--%>
<%--														</c:when>--%>
<%--														<c:otherwise>--%>
<%--															<option value="${item.code}">${item.value}</option>--%>
<%--														</c:otherwise>--%>
<%--													</c:choose>--%>
<%--												</c:forEach>--%>

<%--											</c:if>--%>
<%--											<c:if test="${empty client.billingCurrency}">--%>
<%--												<form:options items="${billingCurrency}" />--%>
<%--											</c:if>--%>
<%--										</form:select>--%>
<%--									</div>--%>
<%--									<p class="error errbillingCurrency ml-3"></p>--%>
<%--								</div>--%>

								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Sum Insured</label>
									<div class="col-9">
										<form:input path="sumInsured" maxlength="17"
											cssClass="col-12 pl-1" />
									</div>
									<p class="error errsumInsured ml-3"></p>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Rate</label>
									<div class="col-9">
										<form:input path="rate" maxlength="7" cssClass="col-5 pl-1" />
									</div>
									<p class="error errrate ml-3"></p>
								</div>
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Annual Premium </label>
									<div class="col-9">
										<form:input path="annualPremium" maxlength="17"
											id="annualPremium" cssClass="col-7 pl-1" />
									</div>
									<p class="error errannualPremium ml-3"></p>
								</div>
								<div class="form-group col-4">
									<label class="control-label no-padding-right ml-3"
										 >Posted Premium</label>
									<div class="col-9">
										<form:input path="postedPremium" maxlength="17"
											id="postedPremium" cssClass="col-7 pl-1" />
									</div>
									<p class="error errpostedPremium ml-3"></p>
								</div>
							</div>
						</div>
						<div class="clearfix form-actions form-btn">
							<div>
								<c:if test="${action.equals('C')}">
									<button class="btn btn-info" type="button" id="btnCreate">
										<i class="ace-icon fa fa-check bigger-110">Save</i>
									</button>
									<button class="btn btn-success" type="button" id="btnRefresh">
										<i class="ace-icon fa fa-check bigger-110">Refresh</i>
									</button>
								</c:if>
								<c:if test="${action.equals('M')}">
									<button class="btn btn-info" type="button" id="btnModify">
										<i class="ace-icon fa fa-check bigger-110">Modify</i>
									</button>
									<button class="btn btn-success" type="button" id="btnRefresh">
										<i class="ace-icon fa fa-check bigger-110">Refresh</i>
									</button>
								</c:if>
								<c:if test="${action.equals('I')}">
									<button class="btn btn-info" type="button" id="btnContinue">
										<i class="ace-icon fa fa-check bigger-110">Continue</i>
									</button>
								</c:if>
								<button class="btn" type="button" id="btnCancle">
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
		$('#btnCreate').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    	creatPolicy(data);
	});
	
	function creatPolicy(data) {
		$.ajax({
            url: '${createPolicyAPI}',
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
            		if(result.annualPremium != 0){
            			$("#annualPremium").val(result.annualPremium);
     				}
     				if(result.postedPremium != 0){
            			$("#postedPremium").val(result.postedPremium);
     				}
            	} else {
            		window.location.href = "${homeURL}?message=Policy " + result.policyNo +" created successfully";
            	}
            },
            error: function (error) {
            	window.location.href = "${editClientURL}";
            }
        });
	}
	
	
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
            url: '${modifyPolicyAPI}',
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
            		if(result.annualPremium != 0){
            			$("#annualPremium").val(result.annualPremium);
     				}
     				if(result.postedPremium != 0){
            			$("#postedPremium").val(result.postedPremium);
     				}
            	} else {
            		window.location.href = "${homeURL}?message=Policy " + result.policyNo +" updated successfully";
            	}
            },
            error: function (error) {
            	window.location.href = "${editClientURL}";
            }
        });
	}
	
	$('#btnRefresh').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    	refreshPolicy(data);
	});
	
	function refreshPolicy(data) {
		$.ajax({
            url: '${refreshPolicyAPI}',
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
            	}
            	if(result.annualPremium != 0){
            		$("#annualPremium").val(result.annualPremium);
     			}
     			if(result.postedPremium != 0){
            		$("#postedPremium").val(result.postedPremium);
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