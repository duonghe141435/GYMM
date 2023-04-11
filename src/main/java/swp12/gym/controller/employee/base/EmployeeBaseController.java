package swp12.gym.controller.employee.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;
import swp12.gym.service.UserService;


@Controller
@RequestMapping("/employee")
public class EmployeeBaseController {

    @Autowired
    private UserService userService;
    //done
    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForEmployee() {
        return "employee/change_pass";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexEmployee(Model model) {
        //man index employee se la man ban hang
        //Ngoai ra employee con co DK khach hang tai quay
        return "employee/index_employee";
    }

    @RequestMapping(value = "/notify",method = RequestMethod.GET)
    public String goShowAllNotify() {
        return "employee/notify";
    }




    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityAdmin() {
        return "employee/change_pass";
    }

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileEmployee(Model model, Authentication authentication) {
        UserDto user = userService.getUserByEmail(((UserDetails) authentication.getPrincipal()).getUsername());
        model.addAttribute("user",user);
        return "employee/profile_user";
    }

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.GET)
    public String updateEmployee(@ModelAttribute("user") User user, Model model) {
        System.out.println(user.toString());
        return "employee/index_employee";
    }
}
