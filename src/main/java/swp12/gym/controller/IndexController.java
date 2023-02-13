package swp12.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {

    @RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
    public String loginPage(@RequestParam(required = false) String message, Model model) {

        if (message != null && !message.trim().equals("")) {
            if (message.equals("session_error")) {
                model.addAttribute("message", "(*) Lỗi thông tin.<br>Vui lòng đăng nhập lại!");
            }

            if (message.equals("wrong_account")) {
                model.addAttribute("message", "Some thing wrong when you logging!");
            }

            if (message.equals("wrong_account")) {
                model.addAttribute("message", "Some thing wrong when you logging!");
            }
        }
        System.out.println("den day");
        return "base/login";
    }

    @RequestMapping(value = "/quen-mat-khau", method = RequestMethod.GET)
    public String forgotPasswordPage(Model model) {
        return "base/resetpassword";
    }

    @RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
    public String registerPage(Model model) {
        return "base/register";
    }

}
