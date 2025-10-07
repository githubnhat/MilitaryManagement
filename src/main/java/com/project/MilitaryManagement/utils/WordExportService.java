package com.project.MilitaryManagement.utils;

import com.project.MilitaryManagement.entity.Military;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class WordExportService {

    public void exportToWord(HttpServletResponse response, Military military) throws IOException {
        // 1. Tạo một tài liệu Word rỗng
        XWPFDocument document = new XWPFDocument();

        // 2. Thiết lập HTTP Headers để trình duyệt hiểu đây là file download
        response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=ThongTinQuanNhan_" + military.getCommonFullName() + ".docx";
        response.setHeader(headerKey, headerValue);

        // 3. Tạo nội dung cho file Word
        // Tiêu đề
        XWPFParagraph title = document.createParagraph();
        title.setAlignment(ParagraphAlignment.CENTER);
        XWPFRun titleRun = title.createRun();
        titleRun.setBold(true);
        titleRun.setFontSize(18);
        titleRun.setText("THÔNG TIN CHI TIẾT QUÂN NHÂN");

        // Thêm các dòng thông tin
        addInfoParagraph(document, "Họ và tên khai sinh:", military.getBirthFullName());
        addInfoParagraph(document, "Cấp bậc:", military.getMilitaryRank());
        addInfoParagraph(document, "Chức vụ:", military.getPosition());
        addInfoParagraph(document, "Số hiệu quân nhân:", military.getMilitaryIdNumber());
        addInfoParagraph(document, "Ngày nhập ngũ:", military.getEnlistmentDate());
        // Thêm các trường khác bạn muốn tại đây...

        // 4. Ghi tài liệu vào response's output stream
        document.write(response.getOutputStream());
        document.close();
    }

    // Hàm tiện ích để thêm một cặp "Tiêu đề: Giá trị"
    private void addInfoParagraph(XWPFDocument document, String label, String value) {
        XWPFParagraph paragraph = document.createParagraph();
        XWPFRun labelRun = paragraph.createRun();
        labelRun.setBold(true);
        labelRun.setText(label + " ");

        XWPFRun valueRun = paragraph.createRun();
        valueRun.setText(value != null ? value : ""); // Xử lý nếu giá trị null
    }
}