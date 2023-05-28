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
    private TicketService ticketService;
    @Autowired
    private ClassService classService;
    @Autowired
    private TrainerService trainerService;
    @Autowired
    private TimeService timeService;
    @Autowired
    private LogUserService logUserService;
    @Autowired
    private AttendanceService attendanceService;
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
        userService.updateUser(user);
//        roleService.updateRoleForUser(user.getU_id(), user.getR_id());

        if (user.getR_id() == 3) {
            //kiểm tra xem người dùng này có phải là trainer không
//            year_experience = Integer.parseInt(request.getParameter("extra-info"));
//            if (userService.isExistsTrainer(user.getU_id())) {
//                userService.updateExperienceTrainer(user.getU_id(), year_experience);
//            } else {
//                userService.deleteStaff(user.getU_id());
//                userService.createTrainer(user.getU_id(), year_experience);
//            }
            return "redirect:/admin/trainer";

        } else if (user.getR_id() == 2) {
//            //kiểm tra xem người dùng này có phải là nhân viên hay không
//            if (userService.isExistsStaff(user.getU_id())) {
//                userService.deleteTrainer(user.getU_id());
//                userService.createStaff(user.getU_id());
//            }

            return "redirect:/admin/employee";

        } else if (user.getR_id() == 4) {
            //kiểm tra xem người dùng này có phải là nhân viên hay không
//            if (userService.isExistsStaff(user.getU_id())) {
//                userService.deleteTrainer(user.getU_id());
//                userService.createStaff(user.getU_id());
//            }

            return "redirect:/admin/customer";

        }
        return "redirect:/admin/dashboard";
    }

    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForAdmin() {
        return "admin/change_pass";
    }

    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityAdmin(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<LogUser> logUsers = logUserService.getAnLogOfAnUser(id);
        model.addAttribute("logUser",logUsers);
        return "admin/activity_log";
    }

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileAdmin(Model model, Authentication authentication) {
        UserDto user = userService.getCustomerByEmail(((UserDetails) authentication.getPrincipal()).getUsername());
        model.addAttribute("user",user);
        return "admin/profile_user";
    }

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.GET)
    public String updateCustomer(@ModelAttribute("user") User user, Model model) {
        System.out.println(user.toString());
        return "customer/index_customer";
    }


    //Xem tất cả các vé vào cửa - done
    @RequestMapping(value = "/ticket",method = RequestMethod.GET)
    public String goTicketDoor(Model model){
        int count = ticketService.getNumberTicketInSystem();
        List<User> trainer = userService.findAllTrainer();
        List<TicketDto> tickets = ticketService.findAllOfAdmin();
        List<ClassDto> classDtos = classService.findAllClassNoneTicket();

        model.addAttribute("trainer", trainer);
        model.addAttribute("count", count);
        model.addAttribute("tickets", tickets);

        return "admin/ticket/list_ticket";
    }

    @RequestMapping(value = "/ticket-detail/{id}", method = RequestMethod.GET)
    public ModelAndView goDetailTicket(@PathVariable int id)
    {
        ModelAndView view = new ModelAndView("admin/ticket/detail_ticket");

        int number_order = ticketService.getTotalNumberOrderOfTicket(id);;
        int number_order_today = ticketService.getTotalNumberOrderOfTicketToday(id);
        List<Map<Integer, Integer>> data = null;
        Ticket ticket = ticketService.findAnTicket(id);
        data = ticketService.getDataOfAnTicket(id);

        if(ticket.getTt_id() == 2){
            List<TrainerDto> dtoList = trainerService.findAllTrainerByTicket(id);
            view.addObject("dtoList",dtoList);
        }
        if(ticket.getTt_id() == 3){
            List<ClassDto> classDtos = classService.findAllClassOfAnTicket(id);
            view.addObject("classDtos",classDtos);
        }

        String jsonData = new Gson().toJson(data); // chuyển đổi sang chuỗi JSON

        view.addObject("chartData",jsonData);
        view.addObject("number_order_today",number_order_today);
        view.addObject("number_order",number_order);
        view.addObject("ticket",ticket);

        return view;
    }

    // ----------------------------------------------------------------
    @RequestMapping(value = "/class",method = RequestMethod.GET)
    public String goClassPage(Model model) {
        List<ClassDto> class_list = classService.findClassAll();
        model.addAttribute("class_list", class_list);
        return "admin/class/class_list";
    }

    @RequestMapping(value = "/class/new-class",method = RequestMethod.GET)
    public String createNewClass(Model model) {
        List<User> trainer = userService.findAllTrainer();
        List<Ticket> tickets = ticketService.findAllTicketClass();
        List<Time> times = timeService.findAll();

        model.addAttribute("tickets", tickets);
        model.addAttribute("trainer", trainer);
        model.addAttribute("times", times);
        return "admin/class/create_class";
    }

    @RequestMapping(value = "/detail-class/{class_id}",method = RequestMethod.GET)
    public String goDetailCLass(@PathVariable int class_id, Model model) {
        //detail class
        ClassDto detail_class = classService.findDetailAnClass(class_id);
        model.addAttribute("classDto", detail_class);
        //list user of class
        List<User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
        model.addAttribute("list_user_of_class", list_user_of_class);
        String jsonDetailClass = new Gson().toJson(detail_class);
        model.addAttribute("jsonDetailClass",jsonDetailClass);

        //list attendance of class
        List<Attendance> list_attendance = attendanceService.listAttendance(class_id);
        String jsonListAttendance = new Gson().toJson(list_attendance);
        model.addAttribute("jsonListAttendance",jsonListAttendance);
        System.out.println("list_attendance: " + list_attendance);

        return "admin/class/detail_class";
    }

    // ----------------------------------------------------------------

    @RequestMapping(value = "/booking-trainer-log/{userID}",method = RequestMethod.GET)
    public String goBookingTrainerLog(@PathVariable int userID, Model model, Authentication authentication) {
        UserDto user = userService.getEmployeeById(userID);

        model.addAttribute("title", "khách hàng");
        model.addAttribute("urls","customer");
        model.addAttribute("user",user);

        List<Ticket> ticket = ticketService.findAddTicketOfAnCustomer(2, userID);
        model.addAttribute("ticket",ticket);
        return "admin/user/trainer_log";
    }

    @RequestMapping(value = "/booking-class-log/{userID}",method = RequestMethod.GET)
    public String goBookingClassCustomer(@PathVariable int userID, Model model, Authentication authentication) {
        UserDto user = userService.getEmployeeById(userID);

        model.addAttribute("title", "khách hàng");
        model.addAttribute("urls","customer");
        model.addAttribute("user",user);

        List<ClassDto> classDtos = classService.findAllClassOfAnUserById(userID);
        model.addAttribute("classDtos",classDtos);
        return "admin/user/class_log";
    }

    @RequestMapping(value = "/product-order-log/{userID}",method = RequestMethod.GET)
    public String goProductOrderLog(@PathVariable int userID, Model model, Authentication authentication) {
        UserDto user = userService.getEmployeeById(userID);

        model.addAttribute("title", "khách hàng");
        model.addAttribute("urls","customer");
        model.addAttribute("user",user);

        List<Order> logOrder = orderService.findAllOrderOfAnUserById(userID);
        model.addAttribute("logOrder",logOrder);
        return "admin/user/order_log";
    }
}
