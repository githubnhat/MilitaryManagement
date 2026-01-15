package com.project.MilitaryManagement.controller;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.entity.QuanNhan;
import com.project.MilitaryManagement.service.MilitaryService;
import com.project.MilitaryManagement.service.QuanNhanService;
import com.project.MilitaryManagement.utils.MessageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class QuanNhanController {
    private final QuanNhanService quanNhanService;
    private  final MessageUtil messageUtil;
    @GetMapping(value = "/tao-quan-nhan")
    public String taoQuanNhan(Model model,
                                 @RequestParam(value = "message", required = false) String message,
                                 @RequestParam(value = "alert", required = false) String alert) {
        model.addAttribute("hanhDong", "C");
        QuanNhan quanNhan = new QuanNhan();
        model.addAttribute("quanNhan", quanNhan);
        messageUtil.showMessage(message, alert, model);
        return "quanNhan";
    }

    @GetMapping(value = "/xem-quan-nhan/{id}")
    public String xemQuanNhan(@PathVariable Long id, Model model,
                                  @RequestParam(value = "message", required = false) String message,
                                  @RequestParam(value = "alert", required = false) String alert) {
        if (id != null) {
            QuanNhan quanNhan = quanNhanService.findQuanNhanById(id);
            model.addAttribute("hanhDong", "I");
            model.addAttribute("quanNhan", quanNhan);
        }
        messageUtil.showMessage(message, alert, model);
        return "quanNhan";
    }

    @GetMapping(value = "/danh-sach-quan-nhan")
    public String militaryList(Model model,
                               @RequestParam(value = "keyword", required = false) String keyword,
                               @RequestParam(value = "message", required = false) String message,
                               @RequestParam(value = "alert", required = false) String alert) {
        List<QuanNhan> quanNhans;

        if (keyword != null && !keyword.trim().isEmpty()) {
            // Nếu có từ khóa, thực hiện tìm kiếm
            quanNhans = quanNhanService.searchByKeyword(keyword);
        } else {
            // Nếu không có từ khóa, lấy toàn bộ danh sách
            quanNhans = quanNhanService.findAllByStatus(1);
        }

        model.addAttribute("quanNhans", quanNhans);
        model.addAttribute("keyword", keyword); // Trả lại từ khóa để hiển thị trên ô tìm kiếm
        messageUtil.showMessage(message, alert, model);
        return "danhSachQuanNhan";
    }

}
