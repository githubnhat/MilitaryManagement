package com.project.MilitaryManagement.controller;

import com.project.MilitaryManagement.entity.TieuDoi;
import com.project.MilitaryManagement.service.TieuDoanService;
import com.project.MilitaryManagement.service.TieuDoiService;
import com.project.MilitaryManagement.utils.MessageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class TieuDoiController {
    private final MessageUtil messageUtil;
    private final TieuDoiService tieuDoiService;
    private final TieuDoanService tieuDoanService;

    @GetMapping(value = "/danh-sach-tieu-doi")
    public String listTieuDoi(Model model,
                              @RequestParam(value = "message", required = false) String message,
                              @RequestParam(value = "alert", required = false) String alert) {
        List<TieuDoi> tieuDoiList = tieuDoiService.findAllByStatus(1);
        model.addAttribute("tieuDoiList", tieuDoiList);
        model.addAttribute("tieuDoanList", tieuDoanService.findAllByStatus(1));
        messageUtil.showMessage(message, alert, model);
        return "tieuDoi"; // Tên file HTML trong templates
    }
}