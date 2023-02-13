package swp12.gym.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.model.Entity.Users;
import swp12.gym.service.UserService;

import java.util.List;

@Controller
public class AdminIndexController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
    public String goDashboardAdmin(Model model) {

        List<Users> users = userService.findAllUsers();
        if(users.isEmpty()){
            return "admin/dashboard_admin";
        }
        model.addAttribute("arr",userService.findAllUsers());
        return "admin/dashboard_admin";
    }
}
