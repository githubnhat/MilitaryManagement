package com.project.MilitaryManagement.controller;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class HomeController {
    @GetMapping(value = "/home")
    public String homePage(Model model) {
        model.addAttribute("message", "Chào mừng đến với trang chủ!");
        return "home";
    }

    @GetMapping(value = "/")
    public String welcomePage(Model model) {
        return "index";
    }
}
