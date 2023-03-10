package swp12.gym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import swp12.gym.model.entity.User;

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
        return "base/login";
    }

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String indexPage() {
        return "base/homepage";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String goRegisterPage(Model model){
        model.addAttribute("new_users", new User());
        return "base/register";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String goLoginPage(){
        return "base/login";
    }

    @RequestMapping(value = "/forgot-password",method = RequestMethod.GET)
    public String goForgotPage(){
        return "base/forgot-password";
    }


    @RequestMapping(value = "/register/create_user", method = RequestMethod.POST)
    public String saveNewUsers(@ModelAttribute("new_users") User user){
        System.out.println(user.getU_id());
        System.out.println(user.getU_email());
        System.out.println(user.getU_full_name());
        System.out.println(user.getU_password());
        return "base/homepage";
    }

}
