package com.project.MilitaryManagement.payload.request;

import lombok.With;
import org.apache.poi.ss.formula.functions.T;

import java.util.Date;
import java.util.List;

@With
public record MilitaryRequest(

        Long id,                                       // ID tự sinh

        // --- Thông tin cá nhân & quân nhân ---
        String birthFullName,                          // Họ đệm tên khai sinh
        String commonFullName,                         // Họ đệm tên thường dùng
        String militaryIdNumber,                       // Số hiệu quân nhân
        String nationalIdNumber,                       // Số CCCD
        String dateOfBirth,                            // Ngày sinh
        String militaryRank,                           // Cấp bậc
        String rankConfermentDate,                     // Ngày phong cấp
        String militaryCardIssuanceDate,               // Ngày cấp thẻ quân nhân
        String position,                               // Chức vụ
        String positionAppointmentDate,                // Ngày bổ nhiệm
        String cnqsNumber,                             // CNQS
        String technicalGrade,                         // Bậc kỹ thuật
        String enlistmentDate,                         // Ngày nhập ngũ
        String dischargeDate,                          // Ngày xuất ngũ
        String reenlistmentDate,                       // Ngày tái ngũ
        String recruitmentInfo,                        // Thông tin tuyển chọn

        // --- Đảng & Đoàn ---
        String youthUnionJoinDate,                     // Ngày vào Đoàn
        String partyJoinDate,                          // Ngày vào Đảng
        String officialPartyMembershipDate,            // Ngày chính thức vào Đảng

        // --- Luân chuyển & Lương ---
        String qncnTransferDate,                       // Ngày chuyển QNCN
        String cnvqpTransferDate,                      // Ngày chuyển CNVQP
        String salaryGradeLevel,                       // Lương nhóm ngạch bậc

        // --- Nhân thân & xã hội ---
        String familyBackground,                       // Thành phần gia đình
        String personalBackground,                     // Thành phần bản thân
        String ethnicity,                              // Dân tộc
        String religion,                               // Tôn giáo
        String educationLevel,                         // Trình độ văn hóa
        String foreignLanguage,                        // Ngoại ngữ
        String healthStatus,                           // Tình trạng sức khỏe
        String disabilityRank,                         // Hạng thương tật
        String commendations,                          // Khen thưởng
        String disciplinaryActions,                    // Kỷ luật

        // --- Học vấn ---
        String schoolName,                             // Tên trường
        String academicLevel,                          // Cấp học
        String major,                                  // Ngành học
        String studyDuration,                          // Thời gian học

        // --- Nơi ở & liên lạc ---
        String placeOfOrigin,                          // Nguyên quán
        String placeOfBirth,                           // Sinh quán
        String permanentResidence,                     // Nơi ở thường trú
        String emergencyContactPerson,                 // Người liên hệ khẩn cấp
        String emergencyContactPhone,                  // SĐT liên hệ khẩn cấp
        String emergencyContactAddress,                // Địa chỉ liên hệ khẩn cấp

        // --- Gia đình ---
        String fatherFullName,                         // Họ tên cha
        String motherFullName,                         // Họ tên mẹ
        String spouseFullName,                         // Họ tên vợ/chồng
        int numberOfChildren,                          // Số con
        String professionalQualification,              // Trình độ chuyên môn
        String notes,                                  // Ghi chú

        // --- Cá nhân & quân nhân (bổ sung) ---
        String trainingUnit,                           // Đơn vị huấn luyện
        String battalion,                              // Tiểu đoàn
        String company,                                // Đại đội
        String ethnicLanguage,                         // Tiếng dân tộc
        String selfTaughtProfession,                   // Nghề tự học
        String pathology,                              // Bệnh lý
        String height,                                 // Chiều cao
        String weight,                                 // Cân nặng
        String temperament,                            // Tính cách
        String familyPolicyStatus,                     // Gia đình chính sách
        String hobbies,                                // Sở thích
        String preEnlistmentJob,                       // Nghề trước khi nhập ngũ
        String enlistmentReason,                       // Lý do nhập ngũ
        String militaryEnvironmentThought,             // Nhận thức môi trường quân ngũ
        String personalAspiration,                     // Nguyện vọng cá nhân
        String cmktAspirationDetail,                   // Chi tiết nguyện vọng CMKT
        String leaveAddress,                           // Địa chỉ nghỉ phép

        // --- Gia đình chi tiết (cha) ---
        String fatherDateOfBirth,                      // Ngày sinh cha
        String fatherPhoneNumber,                      // SĐT cha
        String fatherJob,                              // Nghề nghiệp cha
        String fatherPosition,                         // Chức vụ cha
        String fatherWorkplace,                        // Nơi công tác cha
        String fatherCurrentAddress,                   // Địa chỉ hiện tại cha
        String fatherHealthStatus,                     // Sức khỏe cha
        String fatherPathology,                        // Bệnh lý cha
        String fatherDateOfDeath,                      // Ngày mất cha
        boolean fatherIsPartyMember,                   // Cha là đảng viên
        boolean fatherIsDeceased,                      // Cha đã mất

        // --- Mẹ ---
        String motherDateOfBirth,                      // Ngày sinh mẹ
        String motherPhoneNumber,                      // SĐT mẹ
        String motherJob,                              // Nghề nghiệp mẹ
        String motherPosition,                         // Chức vụ mẹ
        String motherWorkplace,                        // Nơi công tác mẹ
        String motherCurrentAddress,                   // Địa chỉ hiện tại mẹ
        String motherHealthStatus,                     // Sức khỏe mẹ
        String motherPathology,                        // Bệnh lý mẹ
        String motherDateOfDeath,                      // Ngày mất mẹ
        boolean motherIsPartyMember,                   // Mẹ là đảng viên
        boolean motherIsDeceased,                      // Mẹ đã mất

        // --- Gia đình mở rộng ---
        String parentsMaritalStatus,                   // Tình trạng hôn nhân cha mẹ
        String familyEconomicStatus,                   // Kinh tế gia đình
        String numberOfSiblings,                       // Số anh chị em
        String numberOfBrothers,                       // Số anh trai
        String numberOfSisters,                        // Số em gái
        String birthOrder,                             // Thứ tự sinh
        String siblingsPartyMembers,                   // Anh chị em là đảng viên
        String familyPhoneNumber,                      // SĐT gia đình

        // --- Ông bà nội ---
        boolean paternalGrandfatherIsDeceased,         // Ông nội mất
        boolean paternalGrandmotherIsDeceased,         // Bà nội mất
        String paternalGrandfatherDateOfDeath,         // Ngày mất ông nội
        String paternalGrandmotherDateOfDeath,         // Ngày mất bà nội
        String paternalGrandparentsNotes,              // Ghi chú ông bà nội

        // --- Ông bà ngoại ---
        boolean maternalGrandfatherIsDeceased,         // Ông ngoại mất
        boolean maternalGrandmotherIsDeceased,         // Bà ngoại mất
        String maternalGrandfatherDateOfDeath,         // Ngày mất ông ngoại
        String maternalGrandmotherDateOfDeath,         // Ngày mất bà ngoại
        String maternalGrandparentsNotes,              // Ghi chú ông bà ngoại

        // --- Quan hệ xã hội ---
        String girlfriendName,                         // Tên bạn gái
        String girlfriendDob,                          // Ngày sinh bạn gái
        String girlfriendAddress,                      // Địa chỉ bạn gái
        String girlfriendPhone,                        // SĐT bạn gái
        String bestfriendName,                         // Tên bạn thân
        String bestfriendDob,                          // Ngày sinh bạn thân
        String bestfriendAddress,                      // Địa chỉ bạn thân
        String bestfriendPhone,                        // SĐT bạn thân
        String positiveInfluence,                      // Ảnh hưởng tích cực
        String localOfficial1Name,                     // Cán bộ địa phương 1
        String localOfficial1Position,                 // Chức vụ
        String localOfficial1Phone,                    // SĐT
        String localOfficial2Name,                     // Cán bộ địa phương 2
        String localOfficial2Position,                 // Chức vụ
        String localOfficial2Phone,                    // SĐT

        // --- Phần II (bổ sung) ---
        String preEnlistmentProfession,                // Nghề trước nhập ngũ
        String preEnlistmentWorkplace,                 // Nơi làm việc
        String preEnlistmentDuration,                  // Thời gian làm việc
        String supplementaryFamilyEconomicStatus,      // Bổ sung kinh tế gia đình

        // --- Vợ, con ---
        String spouseDateOfBirth,                      // Ngày sinh vợ/chồng
        String spousePhoneNumber,                      // SĐT vợ/chồng
        String maritalLifeStatus,                      // Tình trạng hôn nhân
        String spouseAddress,                          // Địa chỉ vợ/chồng
        String livingSituation,                        // Tình trạng sống
        String spouseEconomicStatus,                   // Kinh tế vợ/chồng
        String spouseHealthStatus,                     // Sức khỏe vợ/chồng
        String spousePathology,                        // Bệnh lý vợ/chồng
        String marriageDuration,                       // Thời gian kết hôn
        boolean hasChildren,                           // Có con không
        String numberOfSons,                           // Số con trai
        String numberOfDaughters,                      // Số con gái
        String childrenHealthStatus,                   // Sức khỏe con

        // --- Gia đình vợ ---
        String fatherInLawName,                        // Họ tên cha vợ
        String fatherInLawJob,                         // Nghề nghiệp cha vợ
        String fatherInLawAddress,                     // Địa chỉ cha vợ
        String fatherInLawHealth,                      // Sức khỏe cha vợ
        String fatherInLawDob,                         // Ngày sinh cha vợ
        String fatherInLawPhone,                       // SĐT cha vợ
        String motherInLawName,                        // Họ tên mẹ vợ
        String motherInLawJob,                         // Nghề nghiệp mẹ vợ
        String motherInLawAddress,                     // Địa chỉ mẹ vợ
        String motherInLawHealth,                      // Sức khỏe mẹ vợ
        String motherInLawDob,                         // Ngày sinh mẹ vợ
        String motherInLawPhone,                       // SĐT mẹ vợ
        String spouseFamilyEconomicStatus,             // Kinh tế gia đình vợ
        String spouseParentsTotalChildren,             // Tổng số con
        String spouseParentsNumOfSons,                 // Số con trai
        String spouseParentsNumOfDaughters,            // Số con gái
        String spouseBirthOrder,                       // Thứ tự sinh của vợ/chồng
        boolean aspirationAttendNcoSchool,             // Nguyện vọng học Hạ sĩ quan
        boolean aspirationAttendTechnicalSchool,       // Nguyện vọng học CMKT
        boolean aspirationAttendReserveOfficerSchool,  // Nguyện vọng học SQ dự bị
        boolean aspirationAttendOfficerSchool,         // Nguyện vọng học Sĩ quan
        boolean aspirationJoinParty,                   // Nguyện vọng vào Đảng
        boolean aspirationDischargeOnTime,             // Nguyện vọng ra quân đúng hạn

        // --- Quản trị ---
        long [] ids,
        int status,                                    // Trạng thái
        String createdBy,                              // Người tạo
        String modifiedBy,                             // Người chỉnh sửa
        Date createdDate,                              // Ngày tạo
        Date modifiedDate                              // Ngày chỉnh sửa
) { }
