package com.project.MilitaryManagement.controller;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class TrangChuController {
    @GetMapping(value = "/trang-chu")
    public String trangChu(Model model) {
        model.addAttribute("message", "Chào mừng đến với trang chủ!");
        return "trangChu";
    }

    @GetMapping(value = "/")
    public String welcomePage(Model model) {
        return "index";
    }
}
