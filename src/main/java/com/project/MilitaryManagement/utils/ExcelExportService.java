package com.project.MilitaryManagement.utils;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.entity.QuanNhan;
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

    public void exportFromTemplate(HttpServletResponse response, List<QuanNhan> quanNhanList) throws IOException {
        InputStream templateFile = new ClassPathResource("templates/file/danh_sach_template.xlsx").getInputStream();

        try (Workbook workbook = new XSSFWorkbook(templateFile)) {
            Sheet sheet = workbook.getSheetAt(0);
            int templateRowIndex = 9; // Dòng mẫu bắt đầu
            Row templateRow = sheet.getRow(templateRowIndex);

            if (quanNhanList == null || quanNhanList.isEmpty() || templateRow == null) {
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
                sheet.shiftRows(templateRowIndex, sheet.getLastRowNum(), quanNhanList.size());
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
            for (int i = 0; i < quanNhanList.size(); i++) {
                QuanNhan quanNhan = quanNhanList.get(i);
                Row currentRow = sheet.createRow(templateRowIndex + i);

                createCell(currentRow, 0, i + 1, templateCellStyles[0]);

                createCell(currentRow, 1, i + 1, templateCellStyles[1]);

                String fullName = quanNhan.getHoTenKhaiSinh().trim();
                int lastSpaceIndex = fullName.lastIndexOf(" ");

                String ten;
                String phanConLai;

                if (lastSpaceIndex == -1) {
                    ten = fullName;
                    phanConLai = "";
                } else {
                    phanConLai = fullName.substring(0, lastSpaceIndex);
                    ten = fullName.substring(lastSpaceIndex + 1);
                }
                // Họ
                createCell(currentRow, 2, phanConLai , createWrapTextStyle(workbook, templateCellStyles[2]));
                // Tên
                createCell(currentRow, 3, ten , createWrapTextStyle(workbook, templateCellStyles[3]));
                //
                String dob = quanNhan.getNgayThangNamSinh();
                String[] parts = dob.split("/");

                String ngay = parts[0]; // "25"
                String thang = parts[1]; // "12"
                String nam = parts[2]; // "2000"
                // ngày
                createCell(currentRow, 4, ngay , createWrapTextStyle(workbook, templateCellStyles[4]));
                // tháng
                createCell(currentRow, 5, thang , createWrapTextStyle(workbook, templateCellStyles[5]));
                // năm
                createCell(currentRow, 6, nam , createWrapTextStyle(workbook, templateCellStyles[6]));
                // số hiệu quân nhân
                String soHieuQuanNhan = quanNhan.getSoHieuQuanNhan() != null ? quanNhan.getSoHieuQuanNhan() : "";
                createCell(currentRow, 7, soHieuQuanNhan , createWrapTextStyle(workbook, templateCellStyles[7]));

                //Nhập ngũ
                String nhapNgu = quanNhan.getNhapNgu();
                String nhapNguResult = nhapNgu;

                if (nhapNgu.indexOf("/") != nhapNgu.lastIndexOf("/")) {
                    nhapNguResult = nhapNgu.substring(nhapNgu.indexOf("/") + 1);
                }
                createCell(currentRow, 8, nhapNguResult , createWrapTextStyle(workbook, templateCellStyles[8]));

                // Cấp bậc
                createCell(currentRow, 9, quanNhan.getCapBac() , createWrapTextStyle(workbook, templateCellStyles[9]));

                // Chức vụ
                createCell(currentRow, 10, quanNhan.getChucVu() , createWrapTextStyle(workbook, templateCellStyles[10]));

                // Đơn vị
                createCell(currentRow, 11, quanNhan.getDonViCSM() , createWrapTextStyle(workbook, templateCellStyles[11]));

                // Văn hoá
                createCell(currentRow, 12, quanNhan.getTrinhDoHocVan() , createWrapTextStyle(workbook, templateCellStyles[12]));

                // Dân tộc
                createCell(currentRow, 13, quanNhan.getDanToc() , createWrapTextStyle(workbook, templateCellStyles[13]));

                // Tôn giáo
                String tonGiao = quanNhan.getTonGiao() != null ? quanNhan.getTonGiao() : "Không";
                createCell(currentRow, 14, tonGiao , createWrapTextStyle(workbook, templateCellStyles[14]));

                // Đoàn Đảng
                String doanDang = "Không";
                doanDang = !"".equals(quanNhan.getNgayVaoDoan()) ? "Đoàn" : "Không";
                doanDang = !"".equals(quanNhan.getNgayVaoDang()) ? "Đảng" : doanDang;
                createCell(currentRow, 15, doanDang , createWrapTextStyle(workbook, templateCellStyles[15]));

                // Sức khoẻ
                createCell(currentRow, 16, quanNhan.getSucKhoe().toString() , createWrapTextStyle(workbook, templateCellStyles[16]));

                // CMKT Cấp
                String chuyenMon = quanNhan.getChuyenMonDaoTao(); // Lấy giá trị từ form [cite: 63]
                String vietTatChuyenMon = switch (chuyenMon) {
                    case "Đại học" -> "ĐH";
                    case "Cao đẳng" -> "CĐ";
                    case "Trung cấp" -> "TC";
                    case "Sơ cấp" -> "SC";
                    default -> "";
                };
                createCell(currentRow, 17, vietTatChuyenMon , createWrapTextStyle(workbook, templateCellStyles[17]));

                // CMKT Ngành học
                String nganhHoc = quanNhan.getNganhHoc() != null ? quanNhan.getNganhHoc() : "";
                createCell(currentRow, 18, nganhHoc , createWrapTextStyle(workbook, templateCellStyles[18]));

                // Họ và tên cha mẹ
                String namSinhCha = quanNhan.getNgaySinhCha().substring(quanNhan.getNgaySinhCha().length() - 2);
                String cha = quanNhan.getHoTenCha() != null ? quanNhan.getHoTenCha() : "" ;
                String namSinhMe = quanNhan.getNgaySinhMe().substring(quanNhan.getNgaySinhMe().length() - 2);
                String me = quanNhan.getHoTenMe() != null ? quanNhan.getHoTenMe() : "";

                String hoTenChaMe =  cha + " - " + namSinhCha + "\n" + me + " - " +  namSinhMe;
                createCell(currentRow, 19, hoTenChaMe , createWrapTextStyle(workbook, templateCellStyles[19]));

                // Nguyên Quán
                String[] parts1 = quanNhan.getNguyenQuan().split(",");

                // Trim từng phần tử để đảm bảo sạch dữ liệu
                for (int j = 0; j < parts.length; j++) {
                    parts1[j] = parts1[j].trim();
                }

                // Gán giá trị dựa trên thứ tự (cần kiểm tra độ dài mảng để tránh lỗi)
                String ap = (parts1.length > 0) ? parts1[0] : "";
                String xa = (parts1.length > 1) ? parts1[1] : "";
                String huyen = (parts1.length > 2) ? parts1[2] : "";
                String tinh = (parts1.length > 3) ? parts1[3] : "";
                createCell(currentRow, 20, ap , createWrapTextStyle(workbook, templateCellStyles[20]));
                createCell(currentRow, 21, xa , createWrapTextStyle(workbook, templateCellStyles[21]));
                createCell(currentRow, 22, huyen , createWrapTextStyle(workbook, templateCellStyles[22]));
                createCell(currentRow, 23, tinh , createWrapTextStyle(workbook, templateCellStyles[23]));
            }

            // Xóa dòng template gốc
            Row originalTemplateRowToDelete = sheet.getRow(templateRowIndex + quanNhanList.size());
            if (originalTemplateRowToDelete != null) {
                sheet.removeRow(originalTemplateRowToDelete);
            }

            workbook.write(response.getOutputStream());
        }
    }

    /**
     * Helper mới: Tạo một ô với nội dung Rich Text (in đậm một phần).
     */
//    private void createRichTextCell(Row row, int columnCount, String boldText, String normalText,
//                                    CellStyle style, XSSFFont boldFont, XSSFFont normalFont) {
//        Cell cell = row.createCell(columnCount);
//        String fullText = boldText + "\n" + normalText;
//        XSSFRichTextString richString = new XSSFRichTextString(fullText);
//
//        if (boldText != null && !boldText.isEmpty()) {
//            richString.applyFont(0, boldText.length(), boldFont);
//        }
//
//        if (normalText != null && !normalText.isEmpty()) {
//            richString.applyFont(boldText.length(), fullText.length(), normalFont);
//        }
//
//        cell.setCellValue(richString);
//        cell.setCellStyle(style);
//    }

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