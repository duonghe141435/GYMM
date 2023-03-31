package swp12.gym.controller.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import swp12.gym.model.entity.User;
import swp12.gym.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.equals("")) {
            if (message.equals("logout")) {
                model.addAttribute("message", "logout");
            }
            if (message.equals("account_error")) {
                model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác!");
            }
            if (message.equals("authorization_error")) {
                model.addAttribute("message", "Không đủ quyền truy cập.");
            }
            if (message.equals("session_error")) {
                model.addAttribute("message", "Lỗi thông tin.<br>Vui lòng đăng nhập lại!");
            }
        }
        return "base/login";
    }

    @RequestMapping("/login_success")
    public String loginSuccess(HttpServletRequest request, HttpSession session, Authentication authentication) {

        String userName = "- (*)Chưa đăng nhập!"; // Any default user name

        if (authentication != null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userName = userDetails.getUsername();
            // quyền của tài khoản hiện tại
            User user = userService.getNameAndImgByEmail(userName);

            session.setAttribute("display_email", userName);
            session.setAttribute("display_name", user.getU_full_name());
            session.setAttribute("display_img", user.getU_img());


            // Check user's role and then redirect
            if (request.isUserInRole("ROLE_ADMIN")) {
                return "redirect:/admin/dashboard/users";
            }
            if (request.isUserInRole("ROLE_EMPLOYEE")) {
                return "redirect:/employee/dashboard";
            }
            if (request.isUserInRole("ROLE_TRAINER")) {
                return "redirect:/trainer/dashboard";
            }
            // End: Check user's role and then redirect
        }

        return "redirect:/customer/home";
    }

    @RequestMapping("/access_denied")
    public String loginError(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.equals("")) {
            if (message.equals("authorization_error")) {
                model.addAttribute("message", "Không đủ quyền hạn để truy cập!");
            }
        }
        return "base/access_denied";
    }


    @RequestMapping(value = "/register/create_user", method = RequestMethod.POST)
    public String saveNewUsers(@ModelAttribute("new_users") User user){

        return "redirect:/login";
    }

}
