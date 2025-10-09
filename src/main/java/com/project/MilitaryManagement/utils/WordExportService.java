package com.project.MilitaryManagement.utils; // Thay package của bạn


import com.project.MilitaryManagement.entity.Military;

import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.xwpf.usermodel.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WordExportService {

    public void exportFromTemplate(HttpServletResponse response, Military military) throws IOException {
        ClassPathResource resource = new ClassPathResource("templates/file/phieu_thong_tin_template.docx");
        try (InputStream inputStream = resource.getInputStream();
             XWPFDocument document = new XWPFDocument(inputStream)) {

            Map<String, String> data = createDataMap(military);

            // Xử lý các trường đơn và checkbox
            for (XWPFParagraph p : document.getParagraphs()) replaceInParagraph(p, data);
            for (XWPFTable table : document.getTables()) {
                for (XWPFTableRow row : table.getRows()) {
                    for (XWPFTableCell cell : row.getTableCells()) {
                        for (XWPFParagraph p : cell.getParagraphs()) replaceInParagraph(p, data);
                    }
                }
            }

//            // Xử lý các bảng động
//            handleDynamicTable(document, "${item.period}", military.getWorkHistory(), (item, text) ->
//                    text.replace("${item.period}", item.getPeriod() != null ? item.getPeriod() : "")
//                            .replace("${item.details}", item.getDetails() != null ? item.getDetails() : "")
//                            .replace("${item.commendation}", item.getCommendation() != null ? item.getCommendation() : "")
//                            .replace("${item.discipline}", item.getDiscipline() != null ? item.getDiscipline() : ""));
//
//            handleDynamicTable(document, "${item.monthYear}", military.getIdeologicalHistory(), (item, text) ->
//                    text.replace("${item.monthYear}", item.getMonthYear() != null ? item.getMonthYear() : "")
//                            .replace("${item.content}", item.getContent() != null ? item.getContent() : "")
//                            .replace("${item.reason}", item.getReason() != null ? item.getReason() : "")
//                            .replace("${item.direction}", item.getDirection() != null ? item.getDirection() : "")
//                            .replace("${item.solution}", item.getSolution() != null ? item.getSolution() : ""));

            // Gửi file
            response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
            String headerKey = "Content-Disposition";
            String rawFileName = "PhieuThongTin_" + military.getCommonFullName() + ".docx";
            String encodedFileName = URLEncoder.encode(rawFileName, StandardCharsets.UTF_8.toString()).replaceAll("\\+", "%20");
            response.setHeader(headerKey, "attachment; filename*=UTF-8''" + encodedFileName);
            document.write(response.getOutputStream());
        }
    }

    private Map<String, String> createDataMap(Military military) {
        Map<String, String> data = new HashMap<>();
        String checked = "☑";
        String unchecked = "☐";

        // --- Điền tất cả các trường ---
        data.put("${birthFullName}", formatValue(military.getBirthFullName()));
        data.put("${commonFullName}", formatValue(military.getCommonFullName()));
        data.put("${militaryIdNumber}", formatValue(military.getMilitaryIdNumber()));
        data.put("${nationalIdNumber}", formatValue(military.getNationalIdNumber()));
        data.put("${dateOfBirth}", formatValue(military.getDateOfBirth()));
        data.put("${militaryRank}", formatValue(military.getMilitaryRank()));
        data.put("${rankConfermentDate}", formatValue(military.getRankConfermentDate()));
        data.put("${militaryCardIssuanceDate}", formatValue(military.getMilitaryCardIssuanceDate()));
        data.put("${position}", formatValue(military.getPosition()));
        data.put("${positionAppointmentDate}", formatValue(military.getPositionAppointmentDate()));
        data.put("${cnqsNumber}", formatValue(military.getCnqsNumber()));
        data.put("${technicalGrade}", formatValue(military.getTechnicalGrade()));
        data.put("${enlistmentDate}", formatValue(military.getEnlistmentDate()));
        data.put("${dischargeDate}", formatValue(military.getDischargeDate()));
        data.put("${reenlistmentDate}", formatValue(military.getReenlistmentDate()));
        data.put("${recruitmentInfo}", formatValue(military.getRecruitmentInfo()));
        data.put("${trainingUnit}", formatValue(military.getTrainingUnit()));
        data.put("${battalion}", formatValue(military.getBattalion()));
        data.put("${company}", formatValue(military.getCompany()));
        data.put("${youthUnionJoinDate}", formatValue(military.getYouthUnionJoinDate()));
        data.put("${partyJoinDate}", formatValue(military.getPartyJoinDate()));
        data.put("${officialPartyMembershipDate}", formatValue(military.getOfficialPartyMembershipDate()));
        data.put("${qncnTransferDate}", formatValue(military.getQncnTransferDate()));
        data.put("${cnvqpTransferDate}", formatValue(military.getCnvqpTransferDate()));
        data.put("${salaryGradeLevel}", formatValue(military.getSalaryGradeLevel()));
        data.put("${familyBackground}", formatValue(military.getFamilyBackground()));
        data.put("${personalBackground}", formatValue(military.getPersonalBackground()));
        data.put("${ethnicity}", formatValue(military.getEthnicity()));
        data.put("${religion}", formatValue(military.getReligion()));
        data.put("${educationLevel}", formatValue(military.getEducationLevel()));
        data.put("${foreignLanguage}", formatValue(military.getForeignLanguage()));
        data.put("${ethnicLanguage}", formatValue(military.getEthnicLanguage()));
        data.put("${healthStatus}", formatValue(military.getHealthStatus()));
        data.put("${pathology}", formatValue(military.getPathology()));
        data.put("${height}", formatValue(military.getHeight()));
        data.put("${weight}", formatValue(military.getWeight()));
        data.put("${disabilityRank}", formatValue(military.getDisabilityRank()));
        data.put("${commendations}", formatValue(military.getCommendations()));
        data.put("${disciplinaryActions}", formatValue(military.getDisciplinaryActions()));
        data.put("${hobbies}", formatValue(military.getHobbies()));
        data.put("${preEnlistmentJob}", formatValue(military.getPreEnlistmentJob()));
        data.put("${cmktAspirationDetail}", formatValue(military.getCmktAspirationDetail()));
        data.put("${schoolName}", formatValue(military.getSchoolName()));
        data.put("${academicLevel}", formatValue(military.getAcademicLevel()));
        data.put("${major}", formatValue(military.getMajor()));
        data.put("${studyDuration}", formatValue(military.getStudyDuration()));
        data.put("${professionalQualification}", formatValue(military.getProfessionalQualification()));
        data.put("${selfTaughtProfession}", formatValue(military.getSelfTaughtProfession()));
        data.put("${placeOfOrigin}", formatValue(military.getPlaceOfOrigin()));
        data.put("${placeOfBirth}", formatValue(military.getPlaceOfBirth()));
        data.put("${permanentResidence}", formatValue(military.getPermanentResidence()));
        data.put("${leaveAddress}", formatValue(military.getLeaveAddress()));
        data.put("${emergencyContactPerson}", formatValue(military.getEmergencyContactPerson()));
        data.put("${emergencyContactPhone}", formatValue(military.getEmergencyContactPhone()));
        data.put("${emergencyContactAddress}", formatValue(military.getEmergencyContactAddress()));
        data.put("${familyPhoneNumber}", formatValue(military.getFamilyPhoneNumber()));
        data.put("${fatherFullName}", formatValue(military.getFatherFullName()));
        data.put("${fatherDateOfBirth}", formatValue(military.getFatherDateOfBirth()));
        data.put("${fatherPhoneNumber}", formatValue(military.getFatherPhoneNumber()));
        data.put("${fatherJob}", formatValue(military.getFatherJob()));
        data.put("${fatherPosition}", formatValue(military.getFatherPosition()));
        data.put("${fatherWorkplace}", formatValue(military.getFatherWorkplace()));
        data.put("${fatherCurrentAddress}", formatValue(military.getFatherCurrentAddress()));
        data.put("${fatherHealthStatus}", formatValue(military.getFatherHealthStatus()));
        data.put("${fatherPathology}", formatValue(military.getFatherPathology()));
        data.put("${fatherDateOfDeath}", formatValue(military.getFatherDateOfDeath()));
        data.put("${motherFullName}", formatValue(military.getMotherFullName()));
        data.put("${motherDateOfBirth}", formatValue(military.getMotherDateOfBirth()));
        data.put("${motherPhoneNumber}", formatValue(military.getMotherPhoneNumber()));
        data.put("${motherJob}", formatValue(military.getMotherJob()));
        data.put("${motherPosition}", formatValue(military.getMotherPosition()));
        data.put("${motherWorkplace}", formatValue(military.getMotherWorkplace()));
        data.put("${motherCurrentAddress}", formatValue(military.getMotherCurrentAddress()));
        data.put("${motherHealthStatus}", formatValue(military.getMotherHealthStatus()));
        data.put("${motherPathology}", formatValue(military.getMotherPathology()));
        data.put("${motherDateOfDeath}", formatValue(military.getMotherDateOfDeath()));
        data.put("${numberOfSiblings}", formatValue(military.getNumberOfSiblings()));
        data.put("${numberOfBrothers}", formatValue(military.getNumberOfBrothers()));
        data.put("${numberOfSisters}", formatValue(military.getNumberOfSisters()));
        data.put("${birthOrder}", formatValue(military.getBirthOrder()));
        data.put("${siblingsPartyMembers}", formatValue(military.getSiblingsPartyMembers()));
        data.put("${paternalGrandfatherDateOfDeath}", formatValue(military.getPaternalGrandfatherDateOfDeath()));
        data.put("${paternalGrandmotherDateOfDeath}", formatValue(military.getPaternalGrandmotherDateOfDeath()));
        data.put("${paternalGrandparentsNotes}", formatValue(military.getPaternalGrandparentsNotes()));
        data.put("${maternalGrandfatherDateOfDeath}", formatValue(military.getMaternalGrandfatherDateOfDeath()));
        data.put("${maternalGrandmotherDateOfDeath}", formatValue(military.getMaternalGrandmotherDateOfDeath()));
        data.put("${maternalGrandparentsNotes}", formatValue(military.getMaternalGrandparentsNotes()));
        data.put("${girlfriendName}", formatValue(military.getGirlfriendName()));
        data.put("${girlfriendDob}", formatValue(military.getGirlfriendDob()));
        data.put("${girlfriendAddress}", formatValue(military.getGirlfriendAddress()));
        data.put("${girlfriendPhone}", formatValue(military.getGirlfriendPhone()));
        data.put("${bestfriendName}", formatValue(military.getBestfriendName()));
        data.put("${bestfriendDob}", formatValue(military.getBestfriendDob()));
        data.put("${bestfriendAddress}", formatValue(military.getBestfriendAddress()));
        data.put("${bestfriendPhone}", formatValue(military.getBestfriendPhone()));
        data.put("${positiveInfluence}", formatValue(military.getPositiveInfluence()));
        data.put("${localOfficial1Name}", formatValue(military.getLocalOfficial1Name()));
        data.put("${localOfficial1Position}", formatValue(military.getLocalOfficial1Position()));
        data.put("${localOfficial1Phone}", formatValue(military.getLocalOfficial1Phone()));
        data.put("${localOfficial2Name}", formatValue(military.getLocalOfficial2Name()));
        data.put("${localOfficial2Position}", formatValue(military.getLocalOfficial2Position()));
        data.put("${localOfficial2Phone}", formatValue(military.getLocalOfficial2Phone()));
        data.put("${preEnlistmentProfession}", formatValue(military.getPreEnlistmentProfession()));
        data.put("${preEnlistmentWorkplace}", formatValue(military.getPreEnlistmentWorkplace()));
        data.put("${preEnlistmentDuration}", formatValue(military.getPreEnlistmentDuration()));
        data.put("${spouseFullName}", formatValue(military.getSpouseFullName()));
        data.put("${spouseDateOfBirth}", formatValue(military.getSpouseDateOfBirth()));
        data.put("${spousePhoneNumber}", formatValue(military.getSpousePhoneNumber()));
        data.put("${spouseAddress}", formatValue(military.getSpouseAddress()));
        data.put("${spouseHealthStatus}", formatValue(military.getSpouseHealthStatus()));
        data.put("${spousePathology}", formatValue(military.getSpousePathology()));
        data.put("${numberOfSons}", formatValue(military.getNumberOfSons()));
        data.put("${numberOfDaughters}", formatValue(military.getNumberOfDaughters()));
        data.put("${childrenHealthStatus}", formatValue(military.getChildrenHealthStatus()));
        data.put("${fatherInLawName}", formatValue(military.getFatherInLawName()));
        data.put("${fatherInLawDob}", formatValue(military.getFatherInLawDob()));
        data.put("${fatherInLawPhone}", formatValue(military.getFatherInLawPhone()));
        data.put("${fatherInLawJob}", formatValue(military.getFatherInLawJob()));
        data.put("${fatherInLawAddress}", formatValue(military.getFatherInLawAddress()));
        data.put("${fatherInLawHealth}", formatValue(military.getFatherInLawHealth()));
        data.put("${motherInLawName}", formatValue(military.getMotherInLawName()));
        data.put("${motherInLawDob}", formatValue(military.getMotherInLawDob()));
        data.put("${motherInLawPhone}", formatValue(military.getMotherInLawPhone()));
        data.put("${motherInLawJob}", formatValue(military.getMotherInLawJob()));
        data.put("${motherInLawAddress}", formatValue(military.getMotherInLawAddress()));
        data.put("${motherInLawHealth}", formatValue(military.getMotherInLawHealth()));
        data.put("${spouseParentsTotalChildren}", formatValue(military.getSpouseParentsTotalChildren()));
        data.put("${spouseParentsNumOfSons}", formatValue(military.getSpouseParentsNumOfSons()));
        data.put("${spouseParentsNumOfDaughters}", formatValue(military.getSpouseParentsNumOfDaughters()));
        data.put("${spouseBirthOrder}", formatValue(military.getSpouseBirthOrder()));
        data.put("${notes}", formatValue(military.getNotes()));

        // Xử lý riêng cho trường `int`
        data.put("${numberOfChildren}", military.getNumberOfChildren() > 0 ? String.valueOf(military.getNumberOfChildren()) : formatValue(null));


        // --- Xử lý cho các checkbox ---
        data.put("${temperament_tramLang}", "Trầm lặng".equals(military.getTemperament()) ? checked : unchecked);
        data.put("${temperament_nongNay}", "Nóng nảy".equals(military.getTemperament()) ? checked : unchecked);
        data.put("${temperament_hoatBat}", "Hoạt bát".equals(military.getTemperament()) ? checked : unchecked);
        data.put("${familyPolicy_lietSi}", "Con liệt sĩ".equals(military.getFamilyPolicyStatus()) ? checked : unchecked);
        data.put("${familyPolicy_thuongBinh}", "Con TB".equals(military.getFamilyPolicyStatus()) ? checked : unchecked);
        data.put("${familyPolicy_benhBinh}", "Con BB".equals(military.getFamilyPolicyStatus()) ? checked : unchecked);
        data.put("${familyPolicy_hoNgheo}", "Hộ nghèo".equals(military.getFamilyPolicyStatus()) ? checked : unchecked);
        data.put("${familyPolicy_hoCanNgheo}", "Hộ cận nghèo".equals(military.getFamilyPolicyStatus()) ? checked : unchecked);
        data.put("${reason_lenhGoi}", "Lệnh gọi".equals(military.getEnlistmentReason()) ? checked : unchecked);
        data.put("${reason_tinhNguyen}", "Tình nguyện".equals(military.getEnlistmentReason()) ? checked : unchecked);
        data.put("${envThought_tot}", "Môi trường tốt".equals(military.getMilitaryEnvironmentThought()) ? checked : unchecked);
        data.put("${envThought_gianNan}", "Môi trường gian nan".equals(military.getMilitaryEnvironmentThought()) ? checked : unchecked);
        data.put("${father_conSong}", !military.isFatherIsDeceased() ? checked : unchecked);
        data.put("${father_tuTran}", military.isFatherIsDeceased() ? checked : unchecked);
        data.put("${father_dangVien}", military.isFatherIsPartyMember() ? checked : unchecked);
        data.put("${mother_conSong}", !military.isMotherIsDeceased() ? checked : unchecked);
        data.put("${mother_tuTran}", military.isMotherIsDeceased() ? checked : unchecked);
        data.put("${mother_dangVien}", military.isMotherIsPartyMember() ? checked : unchecked);
        data.put("${parentsMarital_hanhPhuc}", "Hạnh phúc".equals(military.getParentsMaritalStatus()) ? checked : unchecked);
        data.put("${parentsMarital_lyThan}", "Ly thân".equals(military.getParentsMaritalStatus()) ? checked : unchecked);
        data.put("${parentsMarital_lyHon}", "Ly hôn".equals(military.getParentsMaritalStatus()) ? checked : unchecked);
        data.put("${familyEco_khaGia}", "Khá giả".equals(military.getFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${familyEco_duSong}", "Đủ sống".equals(military.getFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${familyEco_khoKhan}", "Khó khăn".equals(military.getFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${pGrandfather_conSong}", !military.isPaternalGrandfatherIsDeceased() ? checked : unchecked);
        data.put("${pGrandfather_tuTran}", military.isPaternalGrandfatherIsDeceased() ? checked : unchecked);
        data.put("${pGrandmother_conSong}", !military.isPaternalGrandmotherIsDeceased() ? checked : unchecked);
        data.put("${pGrandmother_tuTran}", military.isPaternalGrandmotherIsDeceased() ? checked : unchecked);
        data.put("${mGrandfather_conSong}", !military.isMaternalGrandfatherIsDeceased() ? checked : unchecked);
        data.put("${mGrandfather_tuTran}", military.isMaternalGrandfatherIsDeceased() ? checked : unchecked);
        data.put("${mGrandmother_conSong}", !military.isMaternalGrandmotherIsDeceased() ? checked : unchecked);
        data.put("${mGrandmother_tuTran}", military.isMaternalGrandmotherIsDeceased() ? checked : unchecked);
        data.put("${supFamilyEco_khaGia}", "Khá giả".equals(military.getSupplementaryFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${supFamilyEco_duSong}", "Đủ sống".equals(military.getSupplementaryFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${supFamilyEco_khoKhan}", "Khó khăn".equals(military.getSupplementaryFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${marriageDur_tren5}", ">5 năm".equals(military.getMarriageDuration()) ? checked : unchecked);
        data.put("${marriageDur_duoi5}", "<5 năm".equals(military.getMarriageDuration()) ? checked : unchecked);
        data.put("${maritalLife_hanhPhuc}", "Hạnh phúc".equals(military.getMaritalLifeStatus()) ? checked : unchecked);
        data.put("${maritalLife_binhThuong}", "Bình thường".equals(military.getMaritalLifeStatus()) ? checked : unchecked);
        data.put("${maritalLife_batHoa}", "Bất hòa".equals(military.getMaritalLifeStatus()) ? checked : unchecked);
        data.put("${living_oRieng}", "Ở riêng".equals(military.getLivingSituation()) ? checked : unchecked);
        data.put("${living_cungChaMeChong}", "Ở cùng cha mẹ chồng".equals(military.getLivingSituation()) ? checked : unchecked);
        data.put("${living_cungChaMeDe}", "Ở cùng cha mẹ đẻ".equals(military.getLivingSituation()) ? checked : unchecked);
        data.put("${spouseEco_khaGia}", "Khá giả".equals(military.getSpouseEconomicStatus()) ? checked : unchecked);
        data.put("${spouseEco_duSong}", "Đủ sống".equals(military.getSpouseEconomicStatus()) ? checked : unchecked);
        data.put("${spouseEco_khoKhan}", "Khó khăn".equals(military.getSpouseEconomicStatus()) ? checked : unchecked);
        data.put("${coCon_chua}", !military.isHasChildren() ? checked : unchecked);
        data.put("${coCon_daCo}", military.isHasChildren() ? checked : unchecked);
        data.put("${spouseFamilyEco_khaGia}", "Khá giả".equals(military.getSpouseFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${spouseFamilyEco_duSong}", "Đủ sống".equals(military.getSpouseFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${spouseFamilyEco_khoKhan}", "Khó khăn".equals(military.getSpouseFamilyEconomicStatus()) ? checked : unchecked);
        data.put("${aspiration_tieuDoiTruong}", military.isAspirationAttendNcoSchool() ? checked : unchecked);
        data.put("${aspiration_cmkt}", military.isAspirationAttendTechnicalSchool() ? checked : unchecked);
        data.put("${aspiration_sqdb}", military.isAspirationAttendReserveOfficerSchool() ? checked : unchecked);
        data.put("${aspiration_siQuan}", military.isAspirationAttendOfficerSchool() ? checked : unchecked);
        data.put("${aspiration_ketNapDang}", military.isAspirationJoinParty() ? checked : unchecked);
        data.put("${aspiration_raQuan}", military.isAspirationDischargeOnTime() ? checked : unchecked);

        return data;
    }

    // Hàm chung để xử lý bảng động
    private <T> void handleDynamicTable(XWPFDocument document, String templatePlaceholder, List<T> items, RowFiller<T> filler) {
        if (items == null || items.isEmpty()) return;

        for (XWPFTable table : document.getTables()) {
            XWPFTableRow templateRow = null;
            int templateRowIndex = -1;
            for (int i = 0; i < table.getRows().size(); i++) {
                XWPFTableRow row = table.getRow(i);
                if (row.getCell(0) != null && row.getCell(0).getText().contains(templatePlaceholder)) {
                    templateRow = row;
                    templateRowIndex = i;
                    break;
                }
            }
            if (templateRow != null) {
                // Điền dữ liệu cho hàng đầu tiên
                T firstItem = items.get(0);
                for (XWPFTableCell cell : templateRow.getTableCells()) {
                    cell.setText(filler.fill(firstItem, cell.getText()));
                }
                // Tạo các hàng mới
                for (int i = 1; i < items.size(); i++) {
                    XWPFTableRow newRow = table.insertNewTableRow(templateRowIndex + i);
                    T item = items.get(i);
                    for (int j = 0; j < templateRow.getTableCells().size(); j++) {
                        XWPFTableCell newCell = newRow.createCell();
                        newCell.setText(filler.fill(item, templateRow.getCell(j).getText()));
                    }
                }
            }
        }
    }

    @FunctionalInterface
    interface RowFiller<T> {
        String fill(T item, String templateText);
    }

    private void replaceInParagraph(XWPFParagraph paragraph, Map<String, String> data) {
        List<XWPFRun> runs = paragraph.getRuns();
        if (runs == null || runs.isEmpty()) return;
        String combinedText = "";
        for (XWPFRun run : runs) {
            String text = run.getText(0);
            if (text != null) combinedText += text;
        }
        boolean needsReplacement = false;
        for (Map.Entry<String, String> entry : data.entrySet()) {
            if (combinedText.contains(entry.getKey())) {
                needsReplacement = true;
                combinedText = combinedText.replace(entry.getKey(), entry.getValue() != null ? entry.getValue() : "");
            }
        }
        if (needsReplacement) {
            for (int i = runs.size() - 1; i >= 0; i--) paragraph.removeRun(i);
            paragraph.createRun().setText(combinedText);
        }
    }
    private String formatValue(Object value) {
        // Chuỗi dấu chấm bạn muốn hiển thị
        String dots = "..............................";

        if (value == null) {
            return dots;
        }
        String stringValue = String.valueOf(value);
        if (stringValue.trim().isEmpty()) {
            return dots;
        }
        return stringValue;
    }
}