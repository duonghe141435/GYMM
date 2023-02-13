package swp12.gym.controller.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @RequestMapping(value = "/kiem-tra-tai-khoan")
    public String checkingAccountDemo(@RequestParam(required = false) String message, final Model model,
                                      HttpServletRequest request, HttpSession session,
                                      Authentication authentication) {

        String userName = "- (*)Chưa đăng nhập!"; // Any default user name
        System.out.println(userName);
        if (authentication != null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            userName = userDetails.getUsername();

            System.out.println("User has authorities: " + userDetails.getAuthorities());
            System.out.println("Username: " + userDetails.getUsername());
            System.out.println("Account: " + userDetails);

            if (request.isUserInRole("ROLE_ADMIN")) {
//                session.setAttribute("role", "admin");
                return "redirect:/admin/dashboard";
            }
            if (request.isUserInRole("ROLE_OWNER")) {
//                session.setAttribute("role", "chief");
                return "redirect:/owner/dashboard";
            }

        }

        model.addAttribute("message", "wrong_account");
        return "redirect:/dang-nhap";
    }

    @RequestMapping(value = "/kiem-tra-tai-khoan-ton-tai", method = RequestMethod.POST)
    public String checkingAccountExsit(@RequestParam("username") String username, final Model model) {
        System.out.println("get here" + " " + username);
        model.addAttribute("message", "account_esxit");
        return "redirect:/quen-mat-khau";
    }

    @RequestMapping("/access_denied")
    public String loginError(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.trim().equals("")) {
            if (message.equals("authorization_error")) {
                model.addAttribute("message", "(*) Không đủ quyền hạn để truy cập!");
            }
        }
        return "security/access_denied";
    }


    @RequestMapping(value = "owner/dashboard", method = RequestMethod.GET)
    public String goDashboardOwner() {
        return "owner/dashboard_owner";
    }

    @RequestMapping(value = "/dashboard-employee", method = RequestMethod.GET)
    public String goDashboardEmployee() {
        return "employee/dashboard_employee";
    }

    @RequestMapping(value = "/dashboard-hlv", method = RequestMethod.GET)
    public String goDashboardHLV() {
        return "hlv/dashboard_hlv";
    }

    @RequestMapping(value = "/dashboard-customer", method = RequestMethod.GET)
    public String goDashboardCustomer() {
        return "customer/dashboard_customer";
    }
}


