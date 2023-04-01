package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Role;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;
import swp12.gym.utils.ProcessFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/dashboard/users")
public class AdminUserController {

    private final int IS_ACTIVE = 1;
    private final int IS_NOT_ACTIVE = 1;

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;


    @RequestMapping(method = RequestMethod.GET)
    public String goListUser(Model model) {
        List<UserDto> users = userService.findAll();

        model.addAttribute("users", users);
        return "admin/user/list_user";
    }

    @RequestMapping(value = "/new-user", method = RequestMethod.GET)
    public String goCreateUser(Model model) {
        List<Role> roles = roleService.findAll();

        model.addAttribute("roles", roles);
        model.addAttribute("user", new UserDto());
        return "admin/user/create_user";
    }

    @RequestMapping(value = "/new-users/save", method = RequestMethod.POST)
    public String goSaveUser(@RequestParam("file-up") CommonsMultipartFile file,
                             @ModelAttribute("user") UserDto user, HttpSession s, HttpServletRequest request) {

        int year_experience;
        String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
        int id_u = userService.getNumberUserInSystem() + 1;
        user.setU_id(id_u);
        user.setU_img(u_img);

        user.setU_password(BCrypt.hashpw(user.getU_password(), BCrypt.gensalt(10)));

        userService.createUser(user);
        ProcessFile.doSaveImgToService(file,s,"avatars");
        if (user.getR_id() == 3) {
            year_experience = Integer.parseInt(request.getParameter("extra-info"));
            userService.createTrainer(id_u, year_experience);
        } else if (user.getR_id() == 2) {
            userService.createStaff(id_u);
        }
        roleService.saveRoleForUser(id_u, user.getR_id());
        return "redirect:/admin/dashboard/users";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String goViewUser(@PathVariable int id, Model model) {
        UserDto userDto = userService.findAnUserById(id);
        if (userDto.getR_id() == 3) {

        }
        List<Role> roles = roleService.findAll();

        model.addAttribute("roles", roles);
        model.addAttribute("user", userDto);
        return "admin/user/update_user";
    }

    @RequestMapping(value = "/update-user", method = RequestMethod.POST)
    public String goUpdateUser(@RequestParam("file-up") CommonsMultipartFile file,
                               @ModelAttribute("user") UserDto user, HttpSession s, HttpServletRequest request) {

        int year_experience;

        if (!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null) {
            String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
            if (!u_img.equalsIgnoreCase(user.getU_img())) {
            ProcessFile.doSaveImgToService(file,s,"avatars");
                user.setU_img(u_img);
            }
        }
        userService.updateUser(user);
        roleService.updateRoleForUser(user.getU_id(), user.getR_id());

        if (user.getR_id() == 3) {
            //kiểm tra xem người dùng này có phải là trainer không
            year_experience = Integer.parseInt(request.getParameter("extra-info"));
            if (userService.isExistsTrainer(user.getU_id())) {
                userService.updateExperienceTrainer(user.getU_id(), year_experience);
            } else {
                userService.deleteStaff(user.getU_id());
                userService.createTrainer(user.getU_id(), year_experience);
            }

        } else if (user.getR_id() == 2) {
            //kiểm tra xem người dùng này có phải là nhân viên hay không
            if (userService.isExistsStaff(user.getU_id())) {
                userService.deleteTrainer(user.getU_id());
                userService.createStaff(user.getU_id());
            }

        }
        return "redirect:/admin/dashboard/users";
    }
}