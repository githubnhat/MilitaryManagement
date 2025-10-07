package com.project.MilitaryManagement.utils;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MessageUtil {
    public static void showMessage(String message, String alert, Model model) {
        if (message != null && alert != null) {
            switch (message) {
                case "update_success":
                    model.addAttribute("message", "Cập nhật thành công!");
                    break;
                case "create_success":
                    model.addAttribute("message", "Tạo thành công!");
                    break;
                case "delete_success":
                    model.addAttribute("message", "Xoá thành công!");
                    break;
                case "update_fail":
                    model.addAttribute("message", "Cập nhật thất bại!");
                    break;
                case "create_fail":
                    model.addAttribute("message", "Tạo thất bại!");
                    break;
                case "delete_fail":
                    model.addAttribute("message", "Xoá thất bại!");
                    break;
                case "system_error":
                    model.addAttribute("message", "Lỗi hệ thống!");
                    break;
            }
            model.addAttribute("alert", alert);
        }
    }
}
