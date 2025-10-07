package com.project.MilitaryManagement.api;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.service.MilitaryService;
import com.project.MilitaryManagement.utils.WordExportService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/military")
public class ExportApi {

    private final MilitaryService militaryService; // Service chính của bạn

    private final WordExportService wordExportService; // Service vừa tạo

    // ... các endpoint khác của bạn (@PostMapping, @GetMapping...)

    @GetMapping("/export/word/{id}")
    public void exportMilitaryToWord(@PathVariable Long id, HttpServletResponse response) throws IOException {
        // 1. Lấy thông tin military từ database
        Military military = militaryService.findMilitaryById(id);
        if (military == null) {
            // Xử lý trường hợp không tìm thấy
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Military not found with id: " + id);
            return;
        }

        // 2. Gọi service để tạo và trả về file Word
        wordExportService.exportToWord(response, military);
    }
}
