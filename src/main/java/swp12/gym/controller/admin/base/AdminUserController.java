package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.dto.OrderDto;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoAdmin;
import swp12.gym.model.entity.Role;
import swp12.gym.service.OrderService;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;
import swp12.gym.common.FileUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OrderService orderService;


    @RequestMapping(value = "/users/new-user", method = RequestMethod.GET)
    public String goCreateUser(Model model) {
        List<Role> roles = roleService.findAll();

        model.addAttribute("roles", roles);
        model.addAttribute("user", new UserDto());
        return "admin/user/create_user";
    }




}