package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.common.FileUtil;
import swp12.gym.dto.OrderDto;
import swp12.gym.dto.UserDto;
import swp12.gym.service.OrderService;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminEmployeeController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OrderService orderService;

    //Danh sách nhân viên
    @RequestMapping(value = "/employee/page={pagination}-status={status}", method = RequestMethod.GET)
    public String goListEmployee(@PathVariable String pagination,@PathVariable String status, Model model){
        try {
            //kiểm tra có phải là số int ko?
            int status_num = Integer.parseInt(status);
            int pagination_value = Integer.parseInt(pagination);
            int totalPages = 1;
            int count_employee = userService.getNumberEmployeeInSystem(status_num);
            if(count_employee != 0){
                totalPages = (int) Math.ceil((double) count_employee / 10);
            }
            if(pagination_value > totalPages){
                return "base/404";
            }else if(pagination_value < 1){
                return "base/404";
            }else {
                List<UserDto> users = userService.findAllEmployee(status_num, pagination_value);
                model.addAttribute("users",users);
                model.addAttribute("count", count_employee);
                model.addAttribute("status", status);
                model.addAttribute("totalPages",totalPages);
                model.addAttribute("pagination",pagination_value);

                return "admin/employee/list_employee";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "base/404";
        }
    }

    //Chi tiết tài khoản nhân viên theo Id
    @RequestMapping(value = "/employee/detail/{employee_id}", method = RequestMethod.GET)
    public String goDetailEmployee(Model model,  @PathVariable int employee_id){
        UserDto user = userService.getEmployeeById(employee_id);
        List<OrderDto> orderDtos = orderService.getAllOrderOfEmployee(employee_id);

        model.addAttribute("user",user);
        model.addAttribute("orderDtos",orderDtos);
        return "admin/employee/detail_employee";
    }

    @RequestMapping(value = "/profile-employee/{userID}",method = RequestMethod.GET)
    public String goDetailProfileEmployee(@PathVariable int userID, Model model, HttpSession s) {
        UserDto user = userService.getEmployeeById(userID);

        model.addAttribute("user",user);
        return "admin/employee/update_employee";
    }

    //Tạo mới nhân viên
    @RequestMapping(value = "/employee/new-employee", method = RequestMethod.GET)
    public String goCreateEmployee(Model model) {
        model.addAttribute("user", new UserDto());
        return "admin/employee/create_employee";
    }


    @RequestMapping(value = "/employee/save", method = RequestMethod.POST)
    public String goSaveUser(@RequestParam("file-up") CommonsMultipartFile file,
                             @ModelAttribute("user") UserDto user, HttpSession s,
                             HttpServletRequest request, Model model) {

        int id = userService.findIdByUsername(user.getU_email());
        if(id != 0){
            model.addAttribute("error", "error");
            model.addAttribute("user", new UserDto());
            return "redirect:/admin/employee/new-employee";
        }else{
            String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
            int id_u = userService.getMaxIdUserInSystem() + 1;
            user.setU_id(id_u);
            user.setU_img(u_img);
            user.setU_password(BCrypt.hashpw(user.getU_password(), BCrypt.gensalt(10)));
            userService.createUser(user);
            FileUtil.doSaveImgToService(file,s,"avatars");
            userService.createStaff(id_u);
            roleService.saveRoleForUser(id_u,2);
            return "redirect:/admin/employee/page=1-status=1";
        }
    }

    @RequestMapping(value = "/employee/update-employee", method = RequestMethod.POST)
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

        return "redirect:/admin/employee/page=1-status=1";
    }

    @RequestMapping(value = "/employee/search/{query}", method = RequestMethod.GET)
    public String goUpdateUser(@PathVariable String query,
                               Model model) {
        List<UserDto> results = userService.searchEmployee(query);
        model.addAttribute("users", results);
        return "admin/employee/search_employee";
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
