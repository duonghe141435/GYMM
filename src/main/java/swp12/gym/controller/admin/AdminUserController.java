package swp12.gym.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.dto.UserDto;
import swp12.gym.service.RoleService;
import swp12.gym.service.StaffService;
import swp12.gym.service.TrainerService;
import swp12.gym.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/dashboard/users")
public class AdminUserController {

    @Autowired
    private UserService userService;
    @Autowired
    private TrainerService trainerService;
    @Autowired
    private StaffService staffService;
    @Autowired
    private RoleService roleService;

    @RequestMapping(method = RequestMethod.GET)
    public String goListUser(Model model){
        List<UserDto> users = userService.findAll();

        model.addAttribute("users",users);
        return "admin/user/list_user";
    }

    @RequestMapping(value = "/new-users/save",method = RequestMethod.POST)
    public String goSaveUser(@RequestParam("file-up") CommonsMultipartFile file,
                             @ModelAttribute("user") UserDto user, HttpSession s, HttpServletRequest request){

        int year_experience;
        String u_img = "/assets/img/avatars/"+file.getOriginalFilename();
        int id_u = userService.getNumberUserInSystem() + 1;
        user.setU_id(id_u);
        user.setU_img(u_img);

        user.setU_password(BCrypt.hashpw(user.getU_password(),BCrypt.gensalt(10)));

        userService.createUser(user);
//        UtilsFunctions.doSaveFileToService(file,s,"avatars");
        if(user.getR_id() == 3){
            year_experience = Integer.parseInt(request.getParameter("extra-info"));
            trainerService.createNewTrainer(id_u,year_experience);
        } else if(user.getR_id() == 2){
            staffService.createNewStaff(id_u);
        }
        roleService.saveRoleForUser(id_u, user.getR_id());
        return "redirect:/admin/dashboard/users";
    }
}
