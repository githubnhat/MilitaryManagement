package com.project.MilitaryManagement.controller;

import com.project.MilitaryManagement.entity.Military;
import com.project.MilitaryManagement.service.MilitaryService;
import com.project.MilitaryManagement.utils.MessageUtil;
import lombok.RequiredArgsConstructor;
import org.hibernate.annotations.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MilitaryController {
    private final MilitaryService militaryService;
    private  final MessageUtil messageUtil;
    @GetMapping(value = "/create-military")
    public String createMilitary(Model model,
                                 @RequestParam(value = "message", required = false) String message,
                                 @RequestParam(value = "alert", required = false) String alert) {
        model.addAttribute("action", "C");
        Military military = new Military();
        model.addAttribute("military", military);
        messageUtil.showMessage(message, alert, model);
        return "military";
    }

    @GetMapping(value = "/modify-military/{id}")
    public String modifyMilitary(@PathVariable Long id, Model model,
                                 @RequestParam(value = "message", required = false) String message,
                                 @RequestParam(value = "alert", required = false) String alert) {
        if (id != null) {
            Military military = militaryService.findMilitaryById(id);
            model.addAttribute("action", "M");
            model.addAttribute("military", military);
        }
        messageUtil.showMessage(message, alert, model);
        return "military";
    }
    @GetMapping(value = "/enquiry-military/{id}")
    public String enquiryMilitary(@PathVariable Long id, Model model,
                                 @RequestParam(value = "message", required = false) String message,
                                 @RequestParam(value = "alert", required = false) String alert) {
        if (id != null) {
            Military military = militaryService.findMilitaryById(id);
            model.addAttribute("action", "I");
            model.addAttribute("military", military);
        }
        messageUtil.showMessage(message, alert, model);
        return "military";
    }

    @GetMapping(value = "/military-list")
    public String militaryList(Model model) {
        List<Military> militarys = militaryService.findAllByStatus(1);
        model.addAttribute("militarys", militarys);
        return "military-list";
    }
}
