package com.project.MilitaryManagement.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Military {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    // --- Thông tin cá nhân & quân nhân ---
    private String birthFullName;               // Họ đệm tên khai sinh
    private String commonFullName;              // Họ đệm tên thường dùng
    private String militaryIdNumber;            // Số hiệu quân nhân, số CMQĐ, CN, VCQP
    private String nationalIdNumber;            // Số thẻ căn cước
    private String dateOfBirth;                 // Ngày tháng năm sinh
    private String militaryRank;                        // Cấp bậc
    private String rankConfermentDate;          // Ngày nhận cấp bậc
    private String militaryCardIssuanceDate;    // Ngày cấp thẻ quân nhân
    private String position;                    // Chức vụ
    private String positionAppointmentDate;     // Ngày nhận chức vụ
    private String cnqsNumber;                  // CNQS
    private String technicalGrade;              // Bậc kỹ thuật
    private String enlistmentDate;              // Nhập ngũ
    private String dischargeDate;               // Xuất ngũ
    private String reenlistmentDate;            // Tái ngũ
    private String recruitmentInfo;             // Tuyển chọn, tuyển dụng

    // --- Thông tin Đảng & Đoàn ---
    private String youthUnionJoinDate;          // Ngày vào Đoàn
    private String partyJoinDate;               // Ngày vào Đảng
    private String officialPartyMembershipDate; // Ngày chính thức

    // --- Thông tin luân chuyển & lương ---
    private String qncnTransferDate;            // Ngày chuyển QNCN
    private String cnvqpTransferDate;           // Ngày chuyển CNVQP
    private String salaryGradeLevel;            // Lương nhóm ngạch bậc

    // --- Thông tin nhân thân & xã hội ---
    private String familyBackground;            // Thành phần gia đình
    private String personalBackground;          // Thành phần bản thân
    private String ethnicity;                   // Dân tộc
    private String religion;                    // Tôn giáo
    private String educationLevel;              // Văn hóa
    private String foreignLanguage;             // Ngoại ngữ
    private String healthStatus;                // Sức khỏe
    private String disabilityRank;              // Hạng thương tật
    private String commendations;               // Khen thưởng
    private String disciplinaryActions;         // Kỷ luật

    // --- Thông tin học vấn ---
    private String schoolName;                  // Tên trường
    private String academicLevel;               // Cấp học
    private String major;                       // Ngành học
    private String studyDuration;               // Thời gian

    // --- Thông tin nơi ở & liên lạc ---
    private String placeOfOrigin;               // Nguyên quán
    private String placeOfBirth;                // Sinh quán
    private String permanentResidence;          // Trú quán
    private String emergencyContactPerson;      // Người nhận báo tin
    private String emergencyContactPhone;       // Số điện thoại người nhận báo tin

    // --- Thông tin gia đình ---
    private String fatherFullName;              // Họ đệm tên cha
    private String motherFullName;              // Họ đệm tên mẹ
    private String spouseFullName;              // Họ đệm tên vợ (chồng)
    private int numberOfChildren;            // Mấy con (Lưu ý: nên dùng kiểu int)
    private String professionalQualification; // Trình độ chuyên môn selection TC/SC
    private String notes;                       // Ghi chú
    private int status;
    @CreatedBy
    @Column(name = "created_by")
    protected String createdBy;
    @LastModifiedBy
    @Column(name = "modified_by")
    protected String modifiedBy;
    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    protected Date createdDate;
    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modified_date")
    protected Date modifiedDate;
}
