package com.project.MilitaryManagement.controller;

import com.project.MilitaryManagement.entity.QuanNhan;
import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.service.TieuDoanService;
import com.project.MilitaryManagement.utils.MessageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class TieuDoanController {
    private final MessageUtil messageUtil;
    private final TieuDoanService tieuDoanService;
    @GetMapping(value = "/danh-sach-tieu-doan")
    public String militaryList(Model model,
                               @RequestParam(value = "message", required = false) String message,
                               @RequestParam(value = "alert", required = false) String alert) {
        List<TieuDoan> tieuDoanList = new ArrayList<>();
        tieuDoanList = tieuDoanService.findAllByStatus(1);
//        if (keyword != null && !keyword.trim().isEmpty()) {
//            // Nếu có từ khóa, thực hiện tìm kiếm
//            quanNhans = quanNhanService.searchByKeyword(keyword);
//        } else {
//            // Nếu không có từ khóa, lấy toàn bộ danh sách
//            quanNhans = quanNhanService.findAllByStatus(1);
//        }

        model.addAttribute("tieuDoanList", tieuDoanList);
//        model.addAttribute("keyword", keyword); // Trả lại từ khóa để hiển thị trên ô tìm kiếm
        messageUtil.showMessage(message, alert, model);
        return "tieuDoan";
    }
}
