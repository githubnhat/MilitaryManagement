package com.project.MilitaryManagement.controller;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.entity.QuanNhan;
import com.project.MilitaryManagement.utils.MessageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class QuanNhanController {
    private  final MessageUtil messageUtil;
    @GetMapping(value = "/tao-quan-nhan")
    public String createMilitary(Model model,
                                 @RequestParam(value = "message", required = false) String message,
                                 @RequestParam(value = "alert", required = false) String alert) {
        model.addAttribute("hanhDong", "C");
        QuanNhan quanNhan = new QuanNhan();
        model.addAttribute("quanNhan", quanNhan);
        messageUtil.showMessage(message, alert, model);
        return "quanNhan";
    }
}
