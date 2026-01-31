package com.project.MilitaryManagement.controller;
import com.project.MilitaryManagement.service.QuanNhanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class TrangChuController {
    private final QuanNhanService quanNhanService;
    @GetMapping(value = "/trang-chu")
    public String trangChu(Model model) {
        Map<String, List<Object[]>> statsDonVi = quanNhanService.getThongKeDonVi();

        // 2. Đưa dữ liệu vào model để JSP có thể truy cập
        model.addAttribute("statsDonVi", statsDonVi);
        model.addAttribute("message", "Chào mừng đến với trang chủ!");

        return "trangChu";
    }

    @GetMapping(value = "/")
    public String welcomePage(Model model) {
        return "index";
    }
}
