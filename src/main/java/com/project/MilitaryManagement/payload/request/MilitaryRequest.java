package com.project.MilitaryManagement.payload.request;

import lombok.With;

@With
public record MilitaryRequest (
        Long id,
        String birthFullName,               // Họ đệm tên khai sinh
        String commonFullName,              // Họ đệm tên thường dùng
        String militaryIdNumber,            // Số hiệu quân nhân, số CMQĐ, CN, VCQP
        String nationalIdNumber,            // Số thẻ căn cước
        String dateOfBirth,                 // Ngày tháng năm sinh
        String militaryRank,                        // Cấp bậc
        String rankConfermentDate,          // Ngày nhận cấp bậc
        String militaryCardIssuanceDate,    // Ngày cấp thẻ quân nhân
        String position,                    // Chức vụ
        String positionAppointmentDate,     // Ngày nhận chức vụ
        String cnqsNumber,                  // CNQS
        String technicalGrade,              // Bậc kỹ thuật
        String enlistmentDate,              // Nhập ngũ
        String dischargeDate,               // Xuất ngũ
        String reenlistmentDate,            // Tái ngũ
        String recruitmentInfo,             // Tuyển chọn, tuyển dụng

        // --- Thông tin Đảng & Đoàn ---
        String youthUnionJoinDate,          // Ngày vào Đoàn
        String partyJoinDate,               // Ngày vào Đảng
        String officialPartyMembershipDate, // Ngày chính thức

        // --- Thông tin luân chuyển & lương ---
        String qncnTransferDate,            // Ngày chuyển QNCN
        String cnvqpTransferDate,           // Ngày chuyển CNVQP
        String salaryGradeLevel,            // Lương nhóm ngạch bậc

        // --- Thông tin nhân thân & xã hội ---
        String familyBackground,            // Thành phần gia đình
        String personalBackground,          // Thành phần bản thân
        String ethnicity,                   // Dân tộc
        String religion,                    // Tôn giáo
        String educationLevel,              // Văn hóa
        String foreignLanguage,             // Ngoại ngữ
        String healthStatus,                // Sức khỏe
        String disabilityRank,              // Hạng thương tật
        String commendations,               // Khen thưởng
        String disciplinaryActions,         // Kỷ luật

        // --- Thông tin học vấn ---
        String schoolName,                  // Tên trường
        String academicLevel,               // Cấp học
        String major,                       // Ngành học
        String studyDuration,               // Thời gian
        String professionalQualification,   // Trình độ chuyên môn

        // --- Thông tin nơi ở & liên lạc ---
        String placeOfOrigin,               // Nguyên quán
        String placeOfBirth,                // Sinh quán
        String permanentResidence,          // Trú quán
        String emergencyContactPerson,      // Người nhận báo tin
        String emergencyContactPhone,       // Số điện thoại người nhận báo tin

        // --- Thông tin gia đình ---
        String fatherFullName,              // Họ đệm tên cha
        String motherFullName,              // Họ đệm tên mẹ
        String spouseFullName,              // Họ đệm tên vợ (chồng)
        int numberOfChildren,               // Mấy con

        // --- Khác ---
        String notes,                       // Ghi chú
        int status
)
{
}