package com.project.MilitaryManagement.controller;

import com.project.MilitaryManagement.entity.TrungDoi;
import com.project.MilitaryManagement.service.TieuDoanService;
import com.project.MilitaryManagement.service.TrungDoiService;
import com.project.MilitaryManagement.utils.MessageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class TrungDoiController {
    private final MessageUtil messageUtil;
    private final TrungDoiService trungDoiService;
    private final TieuDoanService tieuDoanService;

    @GetMapping(value = "/danh-sach-trung-doi")
    public String trungDoiList(Model model,
                               @RequestParam(value = "message", required = false) String message,
                               @RequestParam(value = "alert", required = false) String alert) {
        List<TrungDoi> trungDoiList = trungDoiService.findAllByStatus(1);
        model.addAttribute("tieuDoanList", tieuDoanService.findAllByStatus(1));
        model.addAttribute("trungDoiList", trungDoiList);
        messageUtil.showMessage(message, alert, model);
        return "trungDoi";
    }
}