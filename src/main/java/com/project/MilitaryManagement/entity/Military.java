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
    private Long id; // Mã định danh quân nhân

    // --- Thông tin cá nhân & quân nhân ---
    @Column(length = 100)
    private String birthFullName; // Họ đệm tên khai sinh
    @Column(length = 100)
    private String commonFullName; // Họ đệm tên thường dùng
    @Column(length = 50)
    private String militaryIdNumber; // Số hiệu quân nhân, CMQĐ, CN, VCQP
    @Column(length = 50)
    private String nationalIdNumber; // Số thẻ căn cước công dân
    @Column(length = 20)
    private String dateOfBirth; // Ngày tháng năm sinh
    @Column(length = 10)
    private String militaryRank; // Cấp bậc
    @Column(length = 20)
    private String rankConfermentDate; // Ngày nhận cấp bậc
    @Column(length = 20)
    private String militaryCardIssuanceDate; // Ngày cấp thẻ quân nhân
    @Column(length = 100)
    private String position; // Chức vụ
    @Column(length = 20)
    private String positionAppointmentDate; // Ngày nhận chức vụ
    @Column(length = 50)
    private String cnqsNumber; // Số CNQS
    @Column(length = 50)
    private String technicalGrade; // Bậc kỹ thuật
    @Column(length = 20)
    private String enlistmentDate; // Ngày nhập ngũ
    @Column(length = 20)
    private String dischargeDate; // Ngày xuất ngũ
    @Column(length = 20)
    private String reenlistmentDate; // Ngày tái ngũ
    @Column(length = 100)
    private String recruitmentInfo; // Thông tin tuyển chọn, tuyển dụng
    // --- BỔ SUNG: Thông tin Chiến đấu & Quá trình công tác ---
    private boolean participatedInCombat; // Chiến đấu (Kiểu dữ liệu boolean)
    @Column(columnDefinition = "TEXT")
    private String previousPositions; // Chức vụ đã qua (Kiểu dữ liệu string)
    @Column(length = 100)
    private String combatDuration; // Thời gian chiến đấu (Kiểu dữ liệu string)
    // --- Thông tin Đảng & Đoàn ---
    @Column(length = 20)
    private String youthUnionJoinDate; // Ngày vào Đoàn
    @Column(length = 20)
    private String partyJoinDate; // Ngày vào Đảng
    @Column(length = 20)
    private String officialPartyMembershipDate; // Ngày chính thức vào Đảng

    // --- Thông tin Luân chuyển & Lương ---
    @Column(length = 20)
    private String qncnTransferDate; // Ngày chuyển QNCN
    @Column(length = 20)
    private String cnvqpTransferDate; // Ngày chuyển CNVQP
    @Column(length = 50)
    private String salaryGradeLevel; // Nhóm ngạch, bậc lương

    // --- Thông tin Nhân thân & Xã hội ---
    @Column(length = 100)
    private String familyBackground; // Thành phần gia đình
    @Column(length = 100)
    private String personalBackground; // Thành phần bản thân
    @Column(length = 50)
    private String ethnicity; // Dân tộc
    @Column(length = 50)
    private String religion; // Tôn giáo
    @Column(length = 50)
    private String educationLevel; // Trình độ văn hóa
    @Column(length = 50)
    private String foreignLanguage; // Ngoại ngữ
    @Column(length = 50)
    private String healthStatus; // Tình trạng sức khỏe
    @Column(length = 50)
    private String disabilityRank; // Hạng thương tật
    @Column(columnDefinition = "TEXT")
    private String commendations; // Khen thưởng
    @Column(columnDefinition = "TEXT")
    private String disciplinaryActions; // Kỷ luật

    // --- Thông tin Học vấn ---
    @Column(length = 100)
    private String schoolName; // Tên trường
    @Column(length = 100)
    private String academicLevel; // Cấp học
    @Column(length = 100)
    private String major; // Ngành học
    @Column(length = 50)
    private String studyDuration; // Thời gian học

    // --- Thông tin Nơi ở & Liên lạc ---
    @Column(length = 100)
    private String placeOfOrigin; // Nguyên quán
    @Column(length = 100)
    private String placeOfBirth; // Sinh quán
    @Column(columnDefinition = "TEXT")
    private String permanentResidence; // Trú quán
    @Column(length = 100)
    private String emergencyContactPerson; // Người nhận báo tin
    @Column(length = 20)
    private String emergencyContactPhone; // Số điện thoại người nhận báo tin
    @Column(columnDefinition = "TEXT")
    private String emergencyContactAddress; // Địa chỉ người nhận báo tin

    // --- Thông tin Gia đình ---
    @Column(length = 100)
    private String fatherFullName; // Họ tên cha
    @Column(length = 100)
    private String motherFullName; // Họ tên mẹ
    @Column(length = 100)
    private String spouseFullName; // Họ tên vợ/chồng
    private int numberOfChildren; // Số con
    @Column(length = 100)
    private String professionalQualification; // Trình độ chuyên môn (TC/SC)
    @Column(columnDefinition = "TEXT")
    private String notes; // Ghi chú

    // --- Bổ sung thông tin cá nhân & quân nhân ---
    @Column(length = 100)
    private String trainingUnit; // Đơn vị huấn luyện CSM
    @Column(length = 100)
    private String battalion; // Tiểu đoàn
    @Column(length = 100)
    private String company; // Đại đội
    @Column(length = 100)
    private String ethnicLanguage; // Tiếng dân tộc
    @Column(length = 100)
    private String selfTaughtProfession; // Nghề tự học
    @Column(length = 100)
    private String pathology; // Bệnh lý
    @Column(length = 10)
    private String height; // Chiều cao
    @Column(length = 10)
    private String weight; // Cân nặng
    @Column(length = 50)
    private String temperament; // Khí chất (Trầm lặng, Nóng nảy,…)
    @Column(length = 100)
    private String familyPolicyStatus; // Gia đình chính sách
    @Column(length = 100)
    private String hobbies; // Sở thích
    @Column(length = 100)
    private String preEnlistmentJob; // Nghề trước nhập ngũ
    @Column(length = 100)
    private String enlistmentReason; // Lý do đi bộ đội (Lệnh gọi,…)
    @Column(columnDefinition = "TEXT")
    private String militaryEnvironmentThought; // Suy nghĩ về môi trường quân đội
    @Column(columnDefinition = "TEXT")
    private String personalAspiration; // Nguyện vọng bản thân
    @Column(length = 255)
    private String cmktAspirationDetail; // Chi tiết nguyện vọng CMKT
    @Column(columnDefinition = "TEXT")
    private String leaveAddress; // Địa chỉ khi đi phép

    // --- Thông tin chi tiết gia đình ---
    @Column(length = 20)
    private String fatherDateOfBirth; // Ngày sinh cha
    @Column(length = 20)
    private String fatherPhoneNumber; // SĐT cha
    @Column(length = 100)
    private String fatherJob; // Nghề nghiệp cha
    @Column(length = 100)
    private String fatherPosition; // Chức vụ cha
    @Column(length = 100)
    private String fatherWorkplace; // Nơi công tác cha
    @Column(length = 255)
    private String fatherCurrentAddress; // Địa chỉ hiện tại cha
    @Column(length = 100)
    private String fatherHealthStatus; // Tình trạng sức khỏe cha
    @Column(length = 100)
    private String fatherPathology; // Bệnh lý cha
    @Column(length = 20)
    private String fatherDateOfDeath; // Ngày mất cha
    private boolean fatherIsPartyMember; // Cha là Đảng viên
    private boolean fatherIsDeceased; // Cha đã mất

    @Column(length = 20)
    private String motherDateOfBirth; // Ngày sinh mẹ
    @Column(length = 20)
    private String motherPhoneNumber; // SĐT mẹ
    @Column(length = 100)
    private String motherJob; // Nghề nghiệp mẹ
    @Column(length = 100)
    private String motherPosition; // Chức vụ mẹ
    @Column(length = 100)
    private String motherWorkplace; // Nơi công tác mẹ
    @Column(length = 255)
    private String motherCurrentAddress; // Địa chỉ hiện tại mẹ
    @Column(length = 100)
    private String motherHealthStatus; // Sức khỏe mẹ
    @Column(length = 100)
    private String motherPathology; // Bệnh lý mẹ
    @Column(length = 20)
    private String motherDateOfDeath; // Ngày mất mẹ
    private boolean motherIsPartyMember; // Mẹ là Đảng viên
    private boolean motherIsDeceased; // Mẹ đã mất

    @Column(length = 50)
    private String parentsMaritalStatus; // Tình trạng hôn nhân cha mẹ
    @Column(length = 100)
    private String familyEconomicStatus; // Hoàn cảnh kinh tế gia đình
    @Column(length = 20)
    private String numberOfSiblings; // Tổng số anh chị em
    @Column(length = 20)
    private String numberOfBrothers; // Số anh em trai
    @Column(length = 20)
    private String numberOfSisters; // Số chị em gái
    @Column(length = 20)
    private String birthOrder; // Thứ tự sinh
    @Column(length = 100)
    private String siblingsPartyMembers; // Anh/chị/em là Đảng viên
    @Column(length = 20)
    private String familyPhoneNumber; // Số điện thoại gia đình

    // --- Thông tin Ông, Bà ---
    private boolean paternalGrandfatherIsDeceased; // Ông nội đã mất
    private boolean paternalGrandmotherIsDeceased; // Bà nội đã mất
    @Column(length = 20)
    private String paternalGrandfatherDateOfDeath; // Ngày mất ông nội
    @Column(length = 20)
    private String paternalGrandmotherDateOfDeath; // Ngày mất bà nội
    @Column(columnDefinition = "TEXT")
    private String paternalGrandparentsNotes; // Ghi chú ông bà nội

    private boolean maternalGrandfatherIsDeceased; // Ông ngoại đã mất
    private boolean maternalGrandmotherIsDeceased; // Bà ngoại đã mất
    @Column(length = 20)
    private String maternalGrandfatherDateOfDeath; // Ngày mất ông ngoại
    @Column(length = 20)
    private String maternalGrandmotherDateOfDeath; // Ngày mất bà ngoại
    @Column(columnDefinition = "TEXT")
    private String maternalGrandparentsNotes; // Ghi chú ông bà ngoại

    // --- Quan hệ xã hội ---
    @Column(length = 100)
    private String girlfriendName; // Tên bạn gái
    @Column(length = 20)
    private String girlfriendDob; // Ngày sinh bạn gái
    @Column(columnDefinition = "TEXT")
    private String girlfriendAddress; // Địa chỉ bạn gái
    @Column(length = 20)
    private String girlfriendPhone; // SĐT bạn gái

    @Column(length = 100)
    private String bestfriendName; // Tên bạn thân
    @Column(length = 20)
    private String bestfriendDob; // Ngày sinh bạn thân
    @Column(columnDefinition = "TEXT")
    private String bestfriendAddress; // Địa chỉ bạn thân
    @Column(length = 20)
    private String bestfriendPhone; // SĐT bạn thân

    @Column(length = 100)
    private String positiveInfluence; // Ảnh hưởng tích cực

    @Column(length = 100)
    private String localOfficial1Name; // Cán bộ địa phương 1 - Họ tên
    @Column(length = 100)
    private String localOfficial1Position; // Chức vụ
    @Column(length = 100)
    private String localOfficial1Phone; // SĐT

    @Column(length = 100)
    private String localOfficial2Name; // Cán bộ địa phương 2 - Họ tên
    @Column(length = 100)
    private String localOfficial2Position; // Chức vụ
    @Column(length = 100)
    private String localOfficial2Phone; // SĐT

    // --- Phần II (Bổ sung) ---
    @Column(length = 100)
    private String preEnlistmentProfession; // Nghề trước nhập ngũ
    @Column(length = 100)
    private String preEnlistmentWorkplace; // Nơi làm việc trước nhập ngũ
    @Column(length = 100)
    private String preEnlistmentDuration; // Thời gian làm việc
    @Column(columnDefinition = "TEXT")
    private String supplementaryFamilyEconomicStatus; // Hoàn cảnh kinh tế bổ sung

    // --- Vợ, Con ---
    @Column(length = 20)
    private String spouseDateOfBirth; // Ngày sinh vợ/chồng
    @Column(length = 20)
    private String spousePhoneNumber; // SĐT vợ/chồng
    @Column(length = 50)
    private String maritalLifeStatus; // Tình trạng hôn nhân
    @Column(columnDefinition = "TEXT")
    private String spouseAddress; // Địa chỉ vợ/chồng
    @Column(length = 100)
    private String livingSituation; // Tình hình sinh hoạt
    @Column(length = 100)
    private String spouseEconomicStatus; // Kinh tế vợ/chồng
    @Column(length = 100)
    private String spouseHealthStatus; // Sức khỏe vợ/chồng
    @Column(length = 100)
    private String spousePathology; // Bệnh lý vợ/chồng
    @Column(length = 20)
    private String marriageDuration; // Thời gian hôn nhân
    private boolean hasChildren; // Có con không
    @Column(length = 20)
    private String numberOfSons; // Số con trai
    @Column(length = 20)
    private String numberOfDaughters; // Số con gái
    @Column(length = 100)
    private String childrenHealthStatus; // Sức khỏe con

    // --- Gia đình vợ ---
    @Column(length = 100)
    private String fatherInLawName; // Họ tên cha vợ
    @Column(length = 20)
    private String fatherInLawDob; // Ngày sinh cha vợ
    @Column(length = 20)
    private String fatherInLawPhone; // SĐT cha vợ
    @Column(length = 100)
    private String fatherInLawJob; // Nghề cha vợ
    @Column(length = 100)
    private String fatherInLawAddress; // Địa chỉ cha vợ
    @Column(length = 100)
    private String fatherInLawHealth; // Sức khỏe cha vợ

    @Column(length = 100)
    private String motherInLawName; // Họ tên mẹ vợ
    @Column(length = 20)
    private String motherInLawDob; // Ngày sinh mẹ vợ
    @Column(length = 20)
    private String motherInLawPhone; // SĐT mẹ vợ
    @Column(length = 100)
    private String motherInLawJob; // Nghề mẹ vợ
    @Column(length = 100)
    private String motherInLawAddress; // Địa chỉ mẹ vợ
    @Column(length = 100)
    private String motherInLawHealth; // Sức khỏe mẹ vợ

    @Column(length = 100)
    private String spouseFamilyEconomicStatus; // Kinh tế gia đình vợ
    @Column(length = 20)
    private String spouseParentsTotalChildren; // Tổng số con của cha mẹ vợ
    @Column(length = 20)
    private String spouseParentsNumOfSons; // Số con trai
    @Column(length = 20)
    private String spouseParentsNumOfDaughters; // Số con gái
    @Column(length = 20)
    private String spouseBirthOrder; // Thứ tự sinh của vợ/chồng

    // --- Nguyện vọng ---
    private boolean aspirationAttendNcoSchool; // Học trường Hạ sĩ quan
    private boolean aspirationAttendTechnicalSchool; // Học trường CMKT
    private boolean aspirationAttendReserveOfficerSchool; // Học sĩ quan dự bị
    private boolean aspirationAttendOfficerSchool; // Học sĩ quan
    private boolean aspirationJoinParty; // Kết nạp Đảng
    private boolean aspirationDischargeOnTime; // Ra quân đúng hạn

    // --- Quản trị hệ thống ---
    private int status; // Trạng thái (1: hoạt động, 0: ngừng)

    @CreatedBy
    @Column(name = "created_by", length = 50)
    protected String createdBy; // Người tạo

    @LastModifiedBy
    @Column(name = "modified_by", length = 50)
    protected String modifiedBy; // Người chỉnh sửa cuối

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    protected Date createdDate; // Ngày tạo bản ghi

    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modified_date")
    protected Date modifiedDate; // Ngày cập nhật cuối
}
