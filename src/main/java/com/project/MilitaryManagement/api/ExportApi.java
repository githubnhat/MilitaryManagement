package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.service.MilitaryService;
import com.project.MilitaryManagement.utils.ExcelExportService;
import com.project.MilitaryManagement.utils.WordExportService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/military")
public class ExportApi {

    private final MilitaryService militaryService; // Service chính của bạn

    private final WordExportService wordExportService; // Service vừa tạo

    private final ExcelExportService excelExportService; // Thêm service export

    // ... các endpoint khác của bạn (@PostMapping, @GetMapping...)

    @GetMapping("/export/word/{id}")
    public void exportMilitaryToWord(@PathVariable Long id, HttpServletResponse response) throws IOException {
        Military military = militaryService.findMilitaryById(id);
        if (military == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Military not found with id: " + id);
            return;
        }

        // Gọi service với phương thức mới
        wordExportService.exportFromTemplate(response, military);
    }

    @GetMapping("/export/excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        // 1. Cấu hình header cho response để trình duyệt hiểu đây là file Excel
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=danh_sach_quan_nhan_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        // 2. Lấy danh sách quân nhân từ database
        List<Military> militaryList = militaryService.findAllByStatus(1);

        // 3. Gọi service để ghi dữ liệu vào response
        excelExportService.exportFromTemplate(response, militaryList);
    }
}
