package swp12.gym.controller.admin.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import swp12.gym.common.DataUtil;
import swp12.gym.common.FileUtil;
import swp12.gym.dto.*;
import swp12.gym.model.entity.*;
import swp12.gym.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminBaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private LogUserService logUserService;
    @Autowired
    private DashBoardService dashBoardService;
    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private OrderService orderService;

//    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
//    public String goDashboard(Model model){
//
//        int total_of_day = dashBoardService.TotalRevenueOfDay(dataUtil.getDateNowToString());
//        int total_of_month = dashBoardService.TotalRevenueOfMonth(dataUtil.getCurrentYear(),dataUtil.getCurrentMonth());
//        int total_of_year = dashBoardService.TotalRevenueOfThisYear(dataUtil.getCurrentYear());
//        int number_user = dashBoardService.getNumberAccountNew(dataUtil.getDateNowToString());
//        // san pham
//        return "admin/dashboard";
//    }

    @RequestMapping(value = "/activity-log/page={pagination}",method = RequestMethod.GET)
    public String goActivityAdmin(Model model, Authentication authentication, @PathVariable String pagination) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());

        int pagination_value = Integer.parseInt(pagination);
        int totalPages = 1;

        int count_row = logUserService.getNumberLoguOfAnUser(id);;
        if(count_row != 0){
            totalPages = (int) Math.ceil((double) count_row / 8);
        }

        if(pagination_value > totalPages){
            return "base/404";
        }else if(pagination_value < 1){
            return "base/404";
        }else {
            List<LogUser> logUsers = logUserService.getAnLogOfAnUser(id,pagination_value);
            model.addAttribute("logUser",logUsers);
            model.addAttribute("count", count_row);
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("pagination",pagination_value);

            return "admin/activity_log";
        }
    }

    @RequestMapping(value = "/users/update-user", method = RequestMethod.POST)
    public String goUpdateUser(@ModelAttribute("user") UserDto user, HttpSession s,
                               @RequestParam("file-up") CommonsMultipartFile file) {


        int year_experience;

        if (!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null) {
            String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
            if (!u_img.equalsIgnoreCase(user.getU_img())) {
                FileUtil.doSaveImgToService(file,s,"avatars");
                user.setU_img(u_img);
            }
        }

        return "redirect:/admin/employee/page=1-status=1";
    }

    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForAdmin() {
        return "admin/change_pass";
    }


    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileAdmin(Model model, Authentication authentication) {
        UserDto user = userService.getCustomerByEmail(((UserDetails) authentication.getPrincipal()).getUsername());
        model.addAttribute("user",user);
        return "admin/profile_user";
    }

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.GET)
    public String updateCustomer(@ModelAttribute("user") UserDto user, Model model) {
        userService.updateUserProfile(user);
        return "customer/index_customer";
    }
}
