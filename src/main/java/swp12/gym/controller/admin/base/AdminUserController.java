package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoAdmin;
import swp12.gym.model.entity.Role;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;
import swp12.gym.common.FileUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminUserController {

    private final int IS_ACTIVE = 1;
    private final int IS_NOT_ACTIVE = 1;

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/users/new-user", method = RequestMethod.GET)
    public String goCreateUser(Model model) {
        List<Role> roles = roleService.findAll();

        model.addAttribute("roles", roles);
        model.addAttribute("user", new UserDto());
        return "admin/user/create_user";
    }

    @RequestMapping(value = "/users/save", method = RequestMethod.POST)
    public String goSaveUser(@RequestParam("file-up") CommonsMultipartFile file,
                             @ModelAttribute("user") UserDto user, HttpSession s, HttpServletRequest request) {

        int year_experience;
        String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
        int id_u = userService.getNumberUserInSystem() + 1;
        user.setU_id(id_u);
        user.setU_img(u_img);

        user.setU_password(BCrypt.hashpw(user.getU_password(), BCrypt.gensalt(10)));

        userService.createUser(user);
        FileUtil.doSaveImgToService(file,s,"avatars");
        if (user.getR_id() == 3) {
            year_experience = Integer.parseInt(request.getParameter("extra-info"));
            userService.createTrainer(id_u, year_experience);
        } else if (user.getR_id() == 2) {
            userService.createStaff(id_u);
        }
        roleService.saveRoleForUser(id_u, user.getR_id());
        return "redirect:/admin/dashboard/users";
    }


}