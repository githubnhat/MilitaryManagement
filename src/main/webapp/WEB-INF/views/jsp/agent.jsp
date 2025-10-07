<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="editClientURL" value='/create-client' />
<c:url var="homeURL" value="/home" />
<c:url var="createAccountAPI" value='/api/account/create' />
<c:url var="modifyAccountAPI" value='/api/account/modify' />
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
			<h2 class="title">Create account</h2>
		</c:if>
		<c:if test="${action.equals('M')}">
			<h2 class="title">Modify account</h2>
		</c:if>
		<c:if test="${action.equals('I')}">
			<h2 class="title">Inquire on account info</h2>
		</c:if>

		<div class="page-content">
			<div class="row">
				<c:if test="${action.equals('I')}">
					<div class="col-12">
						<form:form class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="agent">
							<div class="form-content">
								<div class="row">
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Company Code</label>
										<div class="col-9">
											<form:input path="companyCode" disabled="true" maxlength="8"
												cssClass="col-5 pl-1" />
										</div>
										<p class="error errcompanyCode ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Company Name</label>
										<div class="col-9">
											<form:input path="companyName" disabled="true" maxlength="60"
												cssClass="col-6 pl-1" />
										</div>
										<p class="error errcompanyName ml-3"></p>
									</div>

								</div>
								<div class="row">
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Agent Code</label>
										<div class="col-9">
											<form:input path="agentCode"  disabled="true" maxlength="8"
												cssClass="col-6 pl-1" readonly="true" />
										</div>
										<p class="error erragentCode ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Account Name</label>
										<div class="col-9">
											<form:input path="accountName"  disabled="true" maxlength="60"
												cssClass="col-6 pl-1" />
										</div>
										<p class="error erraccountName ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label for="gender"
											class="control-label no-padding-right ml-3">Account
											Type</label>
										<div class="col-9">
											<c:if test="${action.equals('I')}">
												<form:select path="accountType" disabled="true"
													id="accountType" maxlength="30">
													<c:if test="${not empty agent.accountType}">
														<c:forEach var="item" items="${accountType}">
															<c:if test="${item.code == agent.accountType}">
																<option value="${item.code}" selected="true">${item.value}</option>
															</c:if>
														</c:forEach>
													</c:if>
												</form:select>
											</c:if>
										</div>
										<p class="error erraccountType ml-3"></p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">License Number</label>
										<div class="col-9">
											<form:input path="licenseNumber"  disabled="true" maxlength="20"
												cssClass="col-12 pl-1" />
										</div>
										<p class="error errlicenseNumber ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label for="gender"
											class="control-label no-padding-right ml-3">Account
											Status</label>
										<div class="col-9">
											<form:select path="accountStatus" disabled="true" maxlength="30"
												id="accountStatus">
												<c:if test="${not empty agent.accountStatus}">
													<c:forEach var="item" items="${accountStatus}">
														<c:choose>
															<c:when test="${item.code == agent.accountStatus}">
																<option value="${item.code}" selected="true">${item.value}</option>
															</c:when>
															<c:otherwise>
																<option value="${item.code}">${item.value}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>

												</c:if>
												<c:if test="${empty agent.accountStatus}">
													<c:forEach var="item" items="${accountStatus}">
														<c:choose>
															<c:when test="${item.code.equals('A')}">
																<option value="${item.code}" selected="true">${item.value}</option>
															</c:when>
															<c:otherwise>
																<option value="${item.code}">${item.value}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:if>
											</form:select>
										</div>
										<p class="error errmaritalStatus ml-3"></p>
									</div>
								</div>

							</div>
							<div class="clearfix form-actions form-btn">
								<div>
									<c:if test="${action.equals('C')}">
										<button class="btn btn-info" type="button" id="btnCreate">
											<i class="ace-icon fa fa-check bigger-110">Save</i>
										</button>
									</c:if>
									<c:if test="${action.equals('M')}">
										<button class="btn btn-info" type="button" id="btnModify">
											<i class="ace-icon fa fa-check bigger-110">Modify</i>
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
				</c:if>
				<c:if test="${!action.equals('I')}">
						<div class="col-12">
						<form:form class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="agent">
							<div class="form-content">
								<div class="row">
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Company Code</label>
										<div class="col-9">
											<form:input path="companyCode" maxlength="8"
												cssClass="col-5 pl-1" />
										</div>
										<p class="error errcompanyCode ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Company Name</label>
										<div class="col-9">
											<form:input path="companyName" maxlength="60"
												cssClass="col-6 pl-1" />
										</div>
										<p class="error errcompanyName ml-3"></p>
									</div>

								</div>
								<div class="row">
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Agent Code</label>
										<div class="col-9">
											<form:input path="agentCode" maxlength="8"
												cssClass="col-6 pl-1" readonly="true" />
										</div>
										<p class="error erragentCode ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">Account Name</label>
										<div class="col-9">
											<form:input path="accountName" maxlength="60"
												cssClass="col-6 pl-1" />
										</div>
										<p class="error erraccountName ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label for="gender"
											class="control-label no-padding-right ml-3">Account
											Type</label>
										<div class="col-9">
											<c:if test="${action.equals('M')}">
												<form:select path="accountType" readonly="true"
													id="accountType" maxlength="30">
													<c:if test="${not empty agent.accountType}">
														<c:forEach var="item" items="${accountType}">
															<c:if test="${item.code == agent.accountType}">
																<option value="${item.code}" selected="true">${item.value}</option>
															</c:if>
														</c:forEach>
													</c:if>
												</form:select>
											</c:if>
											<c:if test="${action.equals('C')}">
												<form:select path="accountType" id="accountType"
													maxlength="30">
													<form:option value="" label="-- Select --" />
													<c:if test="${not empty agent.accountType}">
														<c:forEach var="item" items="${accountType}">
															<c:choose>
																<c:when test="${item.code == agent.accountType}">
																	<option value="${item.code}" selected="true">${item.value}</option>
																</c:when>
																<c:otherwise>
																	<option value="${item.code}">${item.value}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>

													</c:if>
													<c:if test="${empty agent.accountType}">
														<form:options items="${accountType}" />
													</c:if>
												</form:select>
											</c:if>
										</div>
										<p class="error erraccountType ml-3"></p>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-4">
										<label class="control-label no-padding-right ml-3"
											for="form-field-1">License Number</label>
										<div class="col-9">
											<form:input path="licenseNumber" maxlength="20"
												cssClass="col-12 pl-1" />
										</div>
										<p class="error errlicenseNumber ml-3"></p>
									</div>
									<div class="form-group col-4">
										<label for="gender"
											class="control-label no-padding-right ml-3">Account
											Status</label>
										<div class="col-9">
											<form:select path="accountStatus" maxlength="30"
												id="accountStatus">
												<c:if test="${not empty agent.accountStatus}">
													<c:forEach var="item" items="${accountStatus}">
														<c:choose>
															<c:when test="${item.code == agent.accountStatus}">
																<option value="${item.code}" selected="true">${item.value}</option>
															</c:when>
															<c:otherwise>
																<option value="${item.code}">${item.value}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>

												</c:if>
												<c:if test="${empty agent.accountStatus}">
													<c:forEach var="item" items="${accountStatus}">
														<c:choose>
															<c:when test="${item.code.equals('A')}">
																<option value="${item.code}" selected="true">${item.value}</option>
															</c:when>
															<c:otherwise>
																<option value="${item.code}">${item.value}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:if>
											</form:select>
										</div>
										<p class="error errmaritalStatus ml-3"></p>
									</div>
								</div>

							</div>
							<div class="clearfix form-actions form-btn">
								<div>
									<c:if test="${action.equals('C')}">
										<button class="btn btn-info" type="button" id="btnCreate">
											<i class="ace-icon fa fa-check bigger-110">Save</i>
										</button>
									</c:if>
									<c:if test="${action.equals('M')}">
										<button class="btn btn-info" type="button" id="btnModify">
											<i class="ace-icon fa fa-check bigger-110">Modify</i>
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
				</c:if>
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
	    	creatClient(data);
	});
	
	function creatClient(data) {
		$.ajax({
            url: '${createAccountAPI}',
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
            		window.location.href = "${homeURL}?message=Account " + result.agentCode +" created successfully";
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
	    	modifyAccount(data);
	});
	
	function modifyAccount(data) {
		$.ajax({
            url: '${modifyAccountAPI}',
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
            		window.location.href = "${homeURL}?message=message=Account " + result.agentCode +" updated successfully";
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