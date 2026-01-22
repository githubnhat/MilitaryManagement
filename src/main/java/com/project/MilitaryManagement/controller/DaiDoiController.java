package com.project.MilitaryManagement.controller;

import com.project.MilitaryManagement.entity.DaiDoi;
import com.project.MilitaryManagement.entity.TieuDoan;
import com.project.MilitaryManagement.service.DaiDoiService;
import com.project.MilitaryManagement.service.TieuDoanService;
import com.project.MilitaryManagement.utils.MessageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class DaiDoiController {
    private final MessageUtil messageUtil;
    private final DaiDoiService daiDoiService;
    private final TieuDoanService tieuDoanService; // Thêm service này

    @GetMapping(value = "/danh-sach-dai-doi")
    public String daiDoiList(Model model,
                             @RequestParam(value = "message", required = false) String message,
                             @RequestParam(value = "alert", required = false) String alert) {

        List<DaiDoi> daiDoiList = daiDoiService.findAllByStatus(1);
        // Lấy danh sách tiểu đoàn để hiển thị trong select field
        List<TieuDoan> tieuDoanList = tieuDoanService.findAllByStatus(1);

        model.addAttribute("daiDoiList", daiDoiList);
        model.addAttribute("tieuDoanList", tieuDoanList); // Gửi sang JSP
        messageUtil.showMessage(message, alert, model);
        return "daiDoi";
    }
}