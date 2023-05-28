package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.common.FileUtil;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.UserDto;
import swp12.gym.service.ClassService;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminTrainerController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private ClassService classService;

    //Danh sách huấn luyện viên
    @RequestMapping(value = "/trainer/page={pagination}-status={status}", method = RequestMethod.GET)
    public String goListEmployee(@PathVariable String pagination,@PathVariable String status, Model model){
        try {
            //kiểm tra có phải là số int ko?
            int status_num = Integer.parseInt(status);
            int pagination_value = Integer.parseInt(pagination);

            int totalPages = 1;
            int count_employee = userService.getNumberTrainerInSystem(status_num);
            if(count_employee != 0){
                totalPages = (int) Math.ceil((double) count_employee / 10);
            }
            if(pagination_value > totalPages){
                return "base/404";
            }else if(pagination_value < 1){
                return "base/404";
            }else {
                List<UserDto> users = userService.findAllTrainer(status_num, pagination_value);
                model.addAttribute("users",users);
                model.addAttribute("count", count_employee);
                model.addAttribute("status", status);
                model.addAttribute("totalPages",totalPages);
                model.addAttribute("pagination",pagination_value);
                model.addAttribute("status",status);

                return "admin/trainer/list_trainer";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "base/404";
        }
    }

    //Chi tiết tài khoản nhân viên theo Id
    @RequestMapping(value = "/trainer/detail/{trainer_id}", method = RequestMethod.GET)
    public String goDetailEmployee(Model model,  @PathVariable int trainer_id){
        UserDto user = userService.getEmployeeById(trainer_id);
        List<ClassDto> classDtos = classService.findClassAllOfAnTrainer(user.getU_email());

        model.addAttribute("user",user);
        model.addAttribute("classDtos",classDtos);

        return "admin/trainer/detail_trainer";
    }

    @RequestMapping(value = "/profile-trainer/{userID}",method = RequestMethod.GET)
    public String goDetailProfileTrainer(@PathVariable int userID, Model model, HttpSession s) {
        UserDto user = userService.getEmployeeById(userID);

        model.addAttribute("user",user);
        return "admin/trainer/update_trainer";
    }

    //Tạo mới huấn luyện viên
    @RequestMapping(value = "/trainer/new-trainer", method = RequestMethod.GET)
    public String goCreateTrainer(Model model) {
        model.addAttribute("user", new UserDto());
        return "admin/trainer/create_trainer";
    }


    @RequestMapping(value = "/trainer/save", method = RequestMethod.POST)
    public String goSaveUser(@RequestParam("file-up") CommonsMultipartFile file,
                             @ModelAttribute("user") UserDto user, HttpSession s,
                             HttpServletRequest request, Model model) {

        int id = userService.findIdByUsername(user.getU_email());
        int year_experience;
        if(id != 0){
            model.addAttribute("error", "error");
            model.addAttribute("user", new UserDto());
            return "redirect:/admin/trainer/new-trainer";
        }else{
            String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
            int id_u = userService.getMaxIdUserInSystem() + 1;
            user.setU_id(id_u);
            user.setU_img(u_img);
            user.setU_password(BCrypt.hashpw(user.getU_password(), BCrypt.gensalt(10)));
            userService.createUser(user);
            FileUtil.doSaveImgToService(file,s,"avatars");
            year_experience = Integer.parseInt(request.getParameter("extra-info"));
            userService.createTrainer(id_u, year_experience);
            roleService.saveRoleForUser(id_u,3);
            return "redirect:/admin/trainer/page=1-status=1";
        }
    }

    @RequestMapping(value = "/trainer/update-trainer", method = RequestMethod.POST)
    public String goUpdateUser(@ModelAttribute("user") UserDto user, HttpSession s,
                               @RequestParam("file-up") CommonsMultipartFile file) {


        if (!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null) {
            String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
            if (!u_img.equalsIgnoreCase(user.getU_img())) {
                FileUtil.doSaveImgToService(file,s,"avatars");
                user.setU_img(u_img);
            }
        }
        userService.updateUser(user);

        return "redirect:/admin/trainer/page=1-status=1";
    }

    @RequestMapping(value = "/trainer/search/{query}", method = RequestMethod.GET)
    public String goUpdateUser(@PathVariable String query,
                               Model model) {
        List<UserDto> results = userService.searchTrainer(query);
        model.addAttribute("users", results);
        return "admin/trainer/search_trainer";
//        int pagination_value = Integer.parseInt(id);
//
//        int totalPages = 1;
//        if(results.size() != 0){
//            totalPages = (int) Math.ceil((double) results.size() / 10);
//        }
//
//        if(pagination_value > totalPages){
//            return "base/404";
//        }else if(pagination_value < 1){
//            return "base/404";
//        }else {
//
//            List<UserDto> users = userService.findAllEmployee(status_num, pagination_value);
//            model.addAttribute("users",users);
//            model.addAttribute("count", count_employee);
//            model.addAttribute("status", status);
//            model.addAttribute("totalPages",totalPages);
//            model.addAttribute("pagination",pagination_value);
//            model.addAttribute("status",status);
//
//            return "admin/employee/list_employee";
//        }
//        model.addAttribute("totalPages",totalPages);



    }



}
