<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="createMilitaryURL" value='/create-military'/>
<c:url var="modifyMilitaryURL" value='/modify-military'/>
<c:url var="enquiryMilitaryURL" value='/enquiry-military'/>
<c:url var="listMilitaryURL" value='/military-list'/>
<c:url var="homeURL" value="/home"/>
<c:url var="createMilitaryAPI" value='/api/v1/military/create'/>
<c:url var="modifyMilitaryAPI" value='/api/v1/military/modify'/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Military Management</title>
    <link rel="icon" href="<c:url value='/template/images/LOGO 950.png'/>">
    <link href="<c:url value='/template/menu/boxicons-2.1.4/css/boxicons.min.css'/>" rel="stylesheet"/>
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/vendor/css/style.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/template/menu/menu.css'/>" type="text/css">
    <script src="<c:url value='/template/vendor/jquery/jquery.js'/>"></script>
</head>
<body>
<div class="load" style="display: none">
        <img src="<c:url value='/images/loading.gif'/>">
    </div>
<%@ include file="/common/header.jsp" %>
<div>
    <%@ include file="/common/menu.jsp" %>
    <div class="home-section">
        <body>
        <div class="container-fluid home-page-content">
            <c:if test="${action.equals('C')}">
                <h2 class="title">Thêm quân nhân</h2>
            </c:if>
            <c:if test="${action.equals('M')}">
                <h2 class="title">Sửa thông tin quân nhân</h2>
            </c:if>
            <c:if test="${action.equals('I')}">
                <h2 class="title">Thông tin quân nhân</h2>
            </c:if>

            <div class="page-content">
                <div class="row">
                    <c:if test="${not empty message}">
                        <div class="text-center float-left alert alert-${alert}">${message}</div>
                    </c:if>
                </div>
                <div class="row">
                    <div class="col-12">
                        <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="military">

                            <c:set var="isViewMode" value="${action.equals('I')}"/>

                            <div class="form-content">

                                <h5 class="section-title">Thông tin cá nhân & quân nhân</h5>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Họ đệm tên khai sinh</label>
                                        <div class="col-9"><form:input path="birthFullName" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errbirthFullName ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Họ đệm tên thường
                                            dùng</label>
                                        <div class="col-9"><form:input path="commonFullName" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errcommonFullName ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Số hiệu quân nhân, số CMQĐ,
                                            CN, VCQP</label>
                                        <div class="col-9"><form:input path="militaryIdNumber" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmilitaryIdNumber ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Số thẻ căn cước</label>
                                        <div class="col-9"><form:input path="nationalIdNumber" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errnationalIdNumber ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày tháng năm sinh</label>
                                        <div class="col-9"><form:input path="dateOfBirth" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errdateOfBirth ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Cấp bậc</label>
                                        <div class="col-9">
                                            <form:select path="militaryRank" cssClass="col-12 pl-1"
                                                         disabled="${isViewMode}">
                                                <form:option value="" label="-- Chọn --"/>
                                                <form:option value="1/" label="1/"/>
                                                <form:option value="2/" label="2/"/>
                                                <form:option value="3/" label="3/"/>
                                                <form:option value="4/" label="4/"/>
                                                <form:option value="1//" label="1//"/>
                                                <form:option value="2//" label="2//"/>
                                                <form:option value="1/CN" label="1/CN"/>
                                                <form:option value="2/CN" label="2/CN"/>
                                                <form:option value="3/CN" label="3/CN"/>
                                                <form:option value="4/CN" label="4/CN"/>
                                                <form:option value="1//CN" label="1//CN"/>
                                                <form:option value="2//CN" label="2//CN"/>
                                            </form:select>
                                        </div>
                                        <p class="error errmilitaryRank ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày nhận cấp bậc</label>
                                        <div class="col-9"><form:input path="rankConfermentDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errrankConfermentDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày cấp thẻ quân
                                            nhân</label>
                                        <div class="col-9"><form:input path="militaryCardIssuanceDate"
                                                                       cssClass="col-12 pl-1" placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmilitaryCardIssuanceDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Chức vụ</label>
                                        <div class="col-9"><form:input path="position" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errposition ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày nhận chức vụ</label>
                                        <div class="col-9"><form:input path="positionAppointmentDate"
                                                                       cssClass="col-12 pl-1" placeholder="MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errpositionAppointmentDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">CNQS</label>
                                        <div class="col-9"><form:input path="cnqsNumber" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errcnqsNumber ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Bậc kỹ thuật</label>
                                        <div class="col-9"><form:input path="technicalGrade" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errtechnicalGrade ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày nhập ngũ</label>
                                        <div class="col-9"><form:input path="enlistmentDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errenlistmentDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày xuất ngũ</label>
                                        <div class="col-9"><form:input path="dischargeDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errdischargeDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày tái ngũ</label>
                                        <div class="col-9"><form:input path="reenlistmentDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errreenlistmentDate ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tuyển chọn, tuyển
                                            dụng</label>
                                        <div class="col-9"><form:input path="recruitmentInfo" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errrecruitmentInfo ml-3"></p>
                                    </div>
                                </div>

                                <h5 class="section-title">Thông tin Đảng & Đoàn</h5>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày vào Đoàn</label>
                                        <div class="col-9"><form:input path="youthUnionJoinDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error erryouthUnionJoinDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày vào Đảng</label>
                                        <div class="col-9"><form:input path="partyJoinDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errpartyJoinDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày chính thức</label>
                                        <div class="col-9"><form:input path="officialPartyMembershipDate"
                                                                       cssClass="col-12 pl-1" placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errofficialPartyMembershipDate ml-3"></p>
                                    </div>
                                </div>

                                <h5 class="section-title">Thông tin luân chuyển & lương</h5>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày chuyển QNCN</label>
                                        <div class="col-9"><form:input path="qncnTransferDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errqncnTransferDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày chuyển CNVQP</label>
                                        <div class="col-9"><form:input path="cnvqpTransferDate" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errcnvqpTransferDate ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Lương nhóm ngạch bậc</label>
                                        <div class="col-9"><form:input path="salaryGradeLevel" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errsalaryGradeLevel ml-3"></p>
                                    </div>
                                </div>

                                <h5 class="section-title">Thông tin nhân thân & xã hội</h5>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Thành phần gia đình</label>
                                        <div class="col-9"><form:input path="familyBackground" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfamilyBackground ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Thành phần bản thân</label>
                                        <div class="col-9"><form:input path="personalBackground" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errpersonalBackground ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Dân tộc</label>
                                        <div class="col-9"><form:input path="ethnicity" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errethnicity ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tôn giáo</label>
                                        <div class="col-9"><form:input path="religion" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errreligion ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Văn hóa</label>
                                        <div class="col-9"><form:input path="educationLevel" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error erreducationLevel ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngoại ngữ</label>
                                        <div class="col-9"><form:input path="foreignLanguage" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errforeignLanguage ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Sức khỏe</label>
                                        <div class="col-9">
                                            <form:select path="healthStatus" cssClass="col-12 pl-1"
                                                         disabled="${isViewMode}">
                                                <form:option value="" label="-- Chọn --"/>
                                                <form:option value="1" label="Loại 1"/>
                                                <form:option value="2" label="Loại 2"/>
                                                <form:option value="3" label="Loại 3"/>
                                            </form:select>
                                        </div>
                                        <p class="error errhealthStatus ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Hạng thương tật</label>
                                        <div class="col-9"><form:input path="disabilityRank" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errdisabilityRank ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Khen thưởng</label>
                                        <div class="col-9"><form:input path="commendations" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errcommendations ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Kỷ luật</label>
                                        <div class="col-9"><form:input path="disciplinaryActions" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errdisciplinaryActions ml-3"></p>
                                    </div>
                                </div>

                                <h5 class="section-title">Thông tin học vấn</h5>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tên trường</label>
                                        <div class="col-9"><form:input path="schoolName" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errschoolName ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Cấp học</label>
                                        <div class="col-9"><form:input path="academicLevel" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error erracademicLevel ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngành học</label>
                                        <div class="col-9"><form:input path="major" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmajor ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Thời gian</label>
                                        <div class="col-9"><form:input path="studyDuration" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errstudyDuration ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Trình độ chuyên môn</label>
                                        <div class="col-9"><form:input path="professionalQualification"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errprofessionalQualification ml-3"></p>
                                    </div>
                                </div>

                                <h5 class="section-title">Thông tin nơi ở & liên lạc</h5>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Nguyên quán</label>
                                        <div class="col-9"><form:input path="placeOfOrigin" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errplaceOfOrigin ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Sinh quán</label>
                                        <div class="col-9"><form:input path="placeOfBirth" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errplaceOfBirth ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Trú quán</label>
                                        <div class="col-9"><form:input path="permanentResidence" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errpermanentResidence ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Người nhận báo tin</label>
                                        <div class="col-9"><form:input path="emergencyContactPerson"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error erremergencyContactPerson ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">SĐT người nhận tin</label>
                                        <div class="col-9"><form:input path="emergencyContactPhone"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error erremergencyContactPhone ml-3"></p>
                                    </div>
                                </div>

                                <h5 class="section-title">Thông tin gia đình</h5>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Họ đệm tên cha</label>
                                        <div class="col-9"><form:input path="fatherFullName" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfatherFullName ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Họ đệm tên mẹ</label>
                                        <div class="col-9"><form:input path="motherFullName" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmotherFullName ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Họ đệm tên vợ (chồng)</label>
                                        <div class="col-9"><form:input path="spouseFullName" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errspouseFullName ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Mấy con</label>
                                        <div class="col-9"><form:input path="numberOfChildren" type="number"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errnumberOfChildren ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ghi chú</label>
                                        <div class="col-9"><form:input path="notes" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errnotes ml-3"></p>
                                    </div>
                                </div>
                                    <%-- =================================================================================================== --%>
                                    <%-- ============================ THÔNG TIN CHI TIẾT (DÙNG CHO MẪU WORD) ============================ --%>
                                    <%-- =================================================================================================== --%>
                                <h5 class="section-title">Thông tin chi tiết (Bổ sung cho mẫu Word)</h5>

                                    <%-- Thông tin bổ sung --%>
                                <h6>1. Thông tin bổ sung</h6>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Đơn vị huấn luyện CSM</label>
                                        <div class="col-9"><form:input path="trainingUnit" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errtrainingUnit ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tiểu đoàn</label>
                                        <div class="col-9"><form:input path="battalion" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errbattalion ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Đại đội</label>
                                        <div class="col-9"><form:input path="company" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errcompany ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tiếng dân tộc</label>
                                        <div class="col-9"><form:input path="ethnicLanguage" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errethnicLanguage ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngành nghề tự học</label>
                                        <div class="col-9"><form:input path="selfTaughtProfession"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errselfTaughtProfession ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Bệnh lý</label>
                                        <div class="col-9"><form:input path="pathology" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errpathology ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Chiều cao (cm)</label>
                                        <div class="col-9"><form:input path="height" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errheight ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Cân nặng (kg)</label>
                                        <div class="col-9"><form:input path="weight" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errweight ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Khí chất</label>
                                        <div class="col-9">
                                            <form:select path="temperament" cssClass="col-12 pl-1"
                                                         disabled="${isViewMode}">
                                                <form:option value="" label="-- Chọn --"/>
                                                <form:option value="Trầm lặng" label="Trầm lặng"/>
                                                <form:option value="Nóng nảy" label="Nóng nảy"/>
                                                <form:option value="Hoạt bát" label="Hoạt bát"/>
                                            </form:select>
                                        </div>
                                        <p class="error errtemperament ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Gia đình chính sách</label>
                                        <div class="col-9">
                                            <form:select path="familyPolicyStatus" cssClass="col-12 pl-1"
                                                         disabled="${isViewMode}">
                                                <form:option value="" label="-- Chọn --"/>
                                                <form:option value="Con liệt sĩ" label="Con liệt sĩ"/>
                                                <form:option value="Con TB" label="Con thương binh"/>
                                                <form:option value="Con BB" label="Con bệnh binh"/>
                                                <form:option value="Hộ nghèo" label="Hộ nghèo"/>
                                                <form:option value="Hộ cận nghèo" label="Hộ cận nghèo"/>
                                            </form:select>
                                        </div>
                                        <p class="error errfamilyPolicyStatus ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Sở thích</label>
                                        <div class="col-9"><form:input path="hobbies" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errhobbies ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Công việc trước nhập
                                            ngũ</label>
                                        <div class="col-9"><form:input path="preEnlistmentJob" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errpreEnlistmentJob ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Địa chỉ khi đi phép</label>
                                        <div class="col-9"><form:input path="leaveAddress" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errleaveAddress ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Địa chỉ người nhận
                                            tin</label>
                                        <div class="col-9"><form:input path="emergencyContactAddress"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error erremergencyContactAddress ml-3"></p>
                                    </div>
                                </div>

                                    <%-- Chi tiết gia đình (Cha, Mẹ) --%>
                                <h6>2. Chi tiết gia đình (Cha, Mẹ)</h6>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày sinh cha</label>
                                        <div class="col-9"><form:input path="fatherDateOfBirth" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfatherDateOfBirth ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">SĐT cha</label>
                                        <div class="col-9"><form:input path="fatherPhoneNumber" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfatherPhoneNumber ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Nghề nghiệp cha</label>
                                        <div class="col-9"><form:input path="fatherJob" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfatherJob ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Địa chỉ cha</label>
                                        <div class="col-9"><form:input path="fatherCurrentAddress"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfatherCurrentAddress ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Cha là đảng viên</label>
                                        <div class="col-9">
                                            <form:radiobuttons path="fatherIsPartyMember"
                                                               items="${ {'true':'Có', 'false':'Không'} }"
                                                               disabled="${isViewMode}"/>
                                        </div>
                                        <p class="error errfatherIsPartyMember ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Cha còn sống/đã mất</label>
                                        <div class="col-9">
                                            <form:radiobuttons path="fatherIsDeceased"
                                                               items="${ {'false':'Còn sống', 'true':'Đã mất'} }"
                                                               disabled="${isViewMode}"/>
                                        </div>
                                        <p class="error errfatherIsDeceased ml-3"></p>
                                    </div>
                                </div>
                                <hr style="border-top: 1px solid #ccc;"/>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Ngày sinh mẹ</label>
                                        <div class="col-9"><form:input path="motherDateOfBirth" cssClass="col-12 pl-1"
                                                                       placeholder="dd/MM/yyyy"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmotherDateOfBirth ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">SĐT mẹ</label>
                                        <div class="col-9"><form:input path="motherPhoneNumber" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmotherPhoneNumber ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Nghề nghiệp mẹ</label>
                                        <div class="col-9"><form:input path="motherJob" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmotherJob ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Địa chỉ mẹ</label>
                                        <div class="col-9"><form:input path="motherCurrentAddress"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errmotherCurrentAddress ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Mẹ là đảng viên</label>
                                        <div class="col-9">
                                            <form:radiobuttons path="motherIsPartyMember"
                                                               items="${ {'true':'Có', 'false':'Không'} }"
                                                               disabled="${isViewMode}"/>
                                        </div>
                                        <p class="error errmotherIsPartyMember ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Mẹ còn sống/đã mất</label>
                                        <div class="col-9">
                                            <form:radiobuttons path="motherIsDeceased"
                                                               items="${ {'false':'Còn sống', 'true':'Đã mất'} }"
                                                               disabled="${isViewMode}"/>
                                        </div>
                                        <p class="error errmotherIsDeceased ml-3"></p>
                                    </div>
                                </div>
                                <hr style="border-top: 1px solid #ccc;"/>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tình trạng hôn nhân cha
                                            mẹ</label>
                                        <div class="col-9"><form:input path="parentsMaritalStatus"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errparentsMaritalStatus ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Kinh tế gia đình</label>
                                        <div class="col-9"><form:input path="familyEconomicStatus"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfamilyEconomicStatus ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">SĐT gia đình</label>
                                        <div class="col-9"><form:input path="familyPhoneNumber" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errfamilyPhoneNumber ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Tổng số anh chị em</label>
                                        <div class="col-9"><form:input path="numberOfSiblings" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errnumberOfSiblings ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Số anh em trai</label>
                                        <div class="col-9"><form:input path="numberOfBrothers" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errnumberOfBrothers ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Số chị em gái</label>
                                        <div class="col-9"><form:input path="numberOfSisters" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errnumberOfSisters ml-3"></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">Là con thứ mấy</label>
                                        <div class="col-9"><form:input path="birthOrder" cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errbirthOrder ml-3"></p>
                                    </div>
                                    <div class="form-group col-4">
                                        <label class="control-label no-padding-right ml-3">ACE ruột là đảng viên</label>
                                        <div class="col-9"><form:input path="siblingsPartyMembers"
                                                                       cssClass="col-12 pl-1"
                                                                       disabled="${isViewMode}"/></div>
                                        <p class="error errsiblingsPartyMembers ml-3"></p>
                                    </div>
                                </div>

                                    <%-- Nguyện vọng --%>
                                <h6>3. Nguyện vọng</h6>
                                <div class="row">
                                    <div class="form-group col-4"><label class="control-label no-padding-right ml-3">Học
                                        trường hạ sĩ quan</label>
                                        <div class="col-9"><form:checkbox path="aspirationAttendNcoSchool"
                                                                          disabled="${isViewMode}"/></div>
                                    </div>
                                    <div class="form-group col-4"><label class="control-label no-padding-right ml-3">Học
                                        trường CMKT</label>
                                        <div class="col-9"><form:checkbox path="aspirationAttendTechnicalSchool"
                                                                          disabled="${isViewMode}"/></div>
                                    </div>
                                    <div class="form-group col-4"><label class="control-label no-padding-right ml-3">Học
                                        trường sĩ quan dự bị</label>
                                        <div class="col-9"><form:checkbox path="aspirationAttendReserveOfficerSchool"
                                                                          disabled="${isViewMode}"/></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-4"><label class="control-label no-padding-right ml-3">Học
                                        trường sĩ quan</label>
                                        <div class="col-9"><form:checkbox path="aspirationAttendOfficerSchool"
                                                                          disabled="${isViewMode}"/></div>
                                    </div>
                                    <div class="form-group col-4"><label class="control-label no-padding-right ml-3">Kết
                                        nạp Đảng</label>
                                        <div class="col-9"><form:checkbox path="aspirationJoinParty"
                                                                          disabled="${isViewMode}"/></div>
                                    </div>
                                    <div class="form-group col-4"><label class="control-label no-padding-right ml-3">Ra
                                        quân đúng hạn</label>
                                        <div class="col-9"><form:checkbox path="aspirationDischargeOnTime"
                                                                          disabled="${isViewMode}"/></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12">
                                        <label class="control-label no-padding-right ml-3">Chi tiết nguyện vọng
                                            CMKT</label>
                                        <div class="col-11"><form:input path="cmktAspirationDetail"
                                                                        cssClass="col-12 pl-1"
                                                                        disabled="${isViewMode}"/></div>
                                        <p class="error errcmktAspirationDetail ml-3"></p>
                                    </div>
                                </div>
                                    <%-- =================================================================================================== --%>
                                    <%-- ======================================= KẾT THÚC MỤC MỚI ======================================== --%>
                                    <%-- =================================================================================================== --%>
                            </div>
                            <div class="clearfix form-actions form-btn">
                                <div>
                                    <c:if test="${action.equals('C')}">
                                        <button class="btn btn-info" type="button" id="btnCreate">
                                            <i class="ace-icon fa fa-check bigger-110">Lưu</i>
                                        </button>
                                    </c:if>
                                    <c:if test="${action.equals('M')}">
                                        <button class="btn btn-info" type="button" id="btnModify">
                                            <i class="ace-icon fa fa-check bigger-110">Cập nhật</i>
                                        </button>
                                    </c:if>
                                    <c:if test="${action.equals('I')}">
                                        <button class="btn btn-secondary" type="button" id="btnContinue">
                                            <i class="ace-icon fa fa-arrow-left bigger-110"></i> Trở lại
                                        </button>
                                    </c:if>
                                    <c:if test="${!action.equals('I')}">
                                        <button class="btn" type="button" id="btnCancel">
                                            <i class="ace-icon fa fa-undo bigger-110"></i> Hủy
                                        </button>
                                    </c:if>
                                </div>
                                <c:if test="${action.equals('M')}">
                                    <input type="hidden" value="${military.id}" id="id" name="id"/>
                                </c:if>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#btnCreate').click(function (e) {
                e.preventDefault();
                if (!validation()) return;
                var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                createMilitary(data);
            });

            function createMilitary(data) {
                $('.load').show();
                $.ajax({
                    url: '${createMilitaryAPI}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        $('.load').hide();
                        if (result !== null)
                            window.location.href = "${enquiryMilitaryURL}/" + result.id + "?message=create_success&alert=success";
                        else
                            window.location.href = "${createMilitaryURL}" + "?message=create_fail&alert=danger";
                    },
                    error: function (error) {
                        window.location.href = "${createMilitaryURL}?message=system_error&alert=danger";
                    },
                });
            }

            $('#btnModify').click(function (e) {
                e.preventDefault();
                if (!validation()) return;
                var data = {};
                var formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                modifyMilitary(data);
            });

            function modifyMilitary(data) {
                $('.load').show();
                $.ajax({
                    url: '${modifyMilitaryAPI}',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (result) {
                        $('.load').hide();
                        if (result !== null)
                            window.location.href = "${modifyMilitaryURL}/" + result.id + "?message=update_success&alert=success";
                        else
                            window.location.href = "${modifyMilitaryURL}/" + result.id + "?message=update_fail&alert=danger";
                    },
                    error: function (error) {
                        window.location.href = "${modifyMilitaryURL}?message=system_error&alert=danger";
                    }
                });
            }

            $('#btnContinue, #btnCancel').click(function (e) {
                window.location.href = "${listMilitaryURL}";
            });



            function validation() {
                $('.error').hide().text('');
                var isValid = true;

                var birthFullName = $('input[name="birthFullName"]').val().trim();
                var nationalIdNumber = $('input[name="nationalIdNumber"]').val().trim();
                var dateOfBirth = $('input[name="dateOfBirth"]').val().trim();
                var militaryCardIssuanceDate = $('input[name="militaryCardIssuanceDate"]').val().trim();
                var enlistmentDate = $('input[name="enlistmentDate"]').val().trim();
                var emergencyContactPerson = $('input[name="emergencyContactPerson"]').val().trim();
                var emergencyContactPhone = $('input[name="emergencyContactPhone"]').val().trim();
                var fatherFullName = $('input[name="fatherFullName"]').val().trim();
                var motherFullName = $('input[name="motherFullName"]').val().trim();

                if (birthFullName === '') {
                    $('.errbirthFullName').show().text('Họ đệm tên khai sinh không được để trống');
                    isValid = false;
                }
                if (nationalIdNumber === '') {
                    $('.errnationalIdNumber').show().text('Số thẻ căn cước không được để trống');
                    isValid = false;
                }
                if (dateOfBirth === '') {
                    $('.errdateOfBirth').show().text('Ngày tháng năm sinh không được để trống');
                    isValid = false;
                }
                if (militaryCardIssuanceDate === '') {
                    $('.errmilitaryCardIssuanceDate').show().text('Ngày cấp thẻ quân nhân không được để trống');
                    isValid = false;
                }
                if (enlistmentDate === '') {
                    $('.errenlistmentDate').show().text('Ngày nhập ngũ không được để trống');
                    isValid = false;
                }
                if (emergencyContactPerson === '') {
                    $('.erremergencyContactPerson').show().text('Người nhận báo tin không được để trống');
                    isValid = false;
                }
                if (emergencyContactPhone === '') {
                    $('.erremergencyContactPhone').show().text('Số điện thoại người nhận báo tin không được để trống');
                    isValid = false;
                }
                if (fatherFullName === '') {
                    $('.errfatherFullName').show().text('Họ đệm tên cha không được để trống');
                    isValid = false;
                }
                if (motherFullName === '') {
                    $('.errmotherFullName').show().text('Họ đệm tên mẹ không được để trống');
                    isValid = false;
                }

                return isValid;
            }
        </script>
        </body>
        <%@ include file="/common/footer.jsp" %>
    </div>
</div>
<script src="<c:url value='/template/vendor/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/template/menu/dropDownSidebarMenu.js'/>"></script>
</html>