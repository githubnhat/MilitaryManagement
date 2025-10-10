package com.project.MilitaryManagement.utils;

import com.project.MilitaryManagement.entity.Military;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class ExcelExportService {

    public void exportFromTemplate(HttpServletResponse response, List<Military> militaryList) throws IOException {
        InputStream templateFile = new ClassPathResource("templates/file/danh_sach_template.xlsx").getInputStream();

        try (Workbook workbook = new XSSFWorkbook(templateFile)) {
            Sheet sheet = workbook.getSheetAt(0);
            int templateRowIndex = 9; // Dòng mẫu bắt đầu
            Row templateRow = sheet.getRow(templateRowIndex);

            if (militaryList == null || militaryList.isEmpty() || templateRow == null) {
                workbook.write(response.getOutputStream());
                return;
            }

            CellStyle[] templateCellStyles = new CellStyle[templateRow.getLastCellNum()];
            for (int i = 0; i < templateRow.getLastCellNum(); i++) {
                Cell cell = templateRow.getCell(i);
                if (cell != null) {
                    templateCellStyles[i] = cell.getCellStyle();
                }
            }

            if (sheet.getLastRowNum() >= templateRowIndex) {
                sheet.shiftRows(templateRowIndex, sheet.getLastRowNum(), militaryList.size());
            }

            // --- 1. TẠO CÁC FONT CẦN THIẾT ---
            XSSFFont boldFont = (XSSFFont) workbook.createFont();
            boldFont.setBold(true);
            boldFont.setFontHeightInPoints((short) 14);
            boldFont.setFontName("Times New Roman");

            XSSFFont normalFont = (XSSFFont) workbook.createFont();
            normalFont.setBold(false);
            normalFont.setFontHeightInPoints((short) 14);
            normalFont.setFontName("Times New Roman");

            // Lặp và điền dữ liệu
            for (int i = 0; i < militaryList.size(); i++) {
                Military military = militaryList.get(i);
                Row currentRow = sheet.createRow(templateRowIndex + i);

                createCell(currentRow, 0, i + 1, templateCellStyles[0]);

                // Cột 1: Chức vụ đảm nhận tháng/ năm (giữ nguyên)
                String position = military.getPosition() != null ? military.getPosition() : "";
                String positionAppointmentDate = military.getPositionAppointmentDate() != null ? military.getPositionAppointmentDate() : "";
                createCell(currentRow, 1, position + "\n" + positionAppointmentDate, createWrapTextStyle(workbook, templateCellStyles[1]));

                // --- 2. ÁP DỤNG RICH TEXT CHO CỘT 2 ---
                String hoTen = military.getBirthFullName() != null ? military.getBirthFullName() : "";
                String namSinh = military.getDateOfBirth() != null ? military.getDateOfBirth() : "";
                String queQuan = military.getPlaceOfOrigin() != null ? military.getPlaceOfOrigin() : "";
                String SCMQĐ = military.getMilitaryIdNumber() != null ? military.getMilitaryIdNumber() : "";
                String CCCD = military.getNationalIdNumber() != null ? military.getNationalIdNumber() : "";
                // Ghép các phần không in đậm lại
                String otherInfo = namSinh + "\n" + queQuan + "\n" + SCMQĐ + "\n" + CCCD;
                // Gọi hàm helper để tạo ô rich text
                createRichTextCell(currentRow, 2, hoTen, otherInfo,
                        createWrapTextStyle(workbook, templateCellStyles[2]),
                        boldFont, normalFont);

                // Cột 3: Cấp bậc/Tháng năm
                String capBac = military.getMilitaryRank() != null ? military.getMilitaryRank() : "";
                String ngayNhanCapBac = military.getRankConfermentDate() != null ? military.getRankConfermentDate() : "";
                createCell(currentRow, 3, capBac + "\n" + ngayNhanCapBac, createWrapTextStyle(workbook, templateCellStyles[3]));

                // Cột 4: Nhập ngũ
                createCell(currentRow, 4, military.getEnlistmentDate(), templateCellStyles[4]);

                // Các cột còn lại giữ nguyên logic cũ...
                String ngayVaoDang = military.getPartyJoinDate() != null ? military.getPartyJoinDate() : "";
                String ngayChinhThucVaoDang = military.getOfficialPartyMembershipDate() != null ? military.getOfficialPartyMembershipDate() : "";
                createCell(currentRow, 5, ngayVaoDang + "\n" + ngayChinhThucVaoDang, createWrapTextStyle(workbook, templateCellStyles[5]));

                createCell(currentRow, 6, "", templateCellStyles[6]);

                String truong = military.getSchoolName() != null ? military.getSchoolName() : "";
                String thoiGianHoc = military.getStudyDuration() != null ? military.getStudyDuration() : "";
                createCell(currentRow, 7, truong + "\n" + thoiGianHoc, createWrapTextStyle(workbook, templateCellStyles[7]));

                String vanHoa = military.getEducationLevel() != null ? military.getEducationLevel() : "";
                String sucKhoe = military.getHealthStatus() != null ? military.getHealthStatus() : "";
                createCell(currentRow, 8, vanHoa + "\n" + sucKhoe, createWrapTextStyle(workbook, templateCellStyles[8]));

                createCell(currentRow, 9, military.getTrainingUnit(), templateCellStyles[9]);
                createCell(currentRow, 10, military.getProfessionalQualification(), templateCellStyles[10]);
                createCell(currentRow, 11, military.getNotes(), templateCellStyles[11]);
            }

            // Xóa dòng template gốc
            Row originalTemplateRowToDelete = sheet.getRow(templateRowIndex + militaryList.size());
            if (originalTemplateRowToDelete != null) {
                sheet.removeRow(originalTemplateRowToDelete);
            }

            workbook.write(response.getOutputStream());
        }
    }

    /**
     * Helper mới: Tạo một ô với nội dung Rich Text (in đậm một phần).
     */
    private void createRichTextCell(Row row, int columnCount, String boldText, String normalText,
                                    CellStyle style, XSSFFont boldFont, XSSFFont normalFont) {
        Cell cell = row.createCell(columnCount);
        String fullText = boldText + "\n" + normalText;
        XSSFRichTextString richString = new XSSFRichTextString(fullText);

        if (boldText != null && !boldText.isEmpty()) {
            richString.applyFont(0, boldText.length(), boldFont);
        }

        if (normalText != null && !normalText.isEmpty()) {
            richString.applyFont(boldText.length(), fullText.length(), normalFont);
        }

        cell.setCellValue(richString);
        cell.setCellStyle(style);
    }

    private CellStyle createWrapTextStyle(Workbook workbook, CellStyle originalStyle) {
        CellStyle style = workbook.createCellStyle();
        if (originalStyle != null) {
            style.cloneStyleFrom(originalStyle);
        }
        style.setWrapText(true);
        return style;
    }

    private void createCell(Row row, int columnCount, Object value, CellStyle style) {
        Cell cell = row.createCell(columnCount);
        if (value instanceof Number) {
            cell.setCellValue(((Number) value).doubleValue());
        } else {
            cell.setCellValue(String.valueOf(value != null ? value : ""));
        }
        if (style != null) {
            cell.setCellStyle(style);
        }
    }
}