package swp12.gym.controller.trainer.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import swp12.gym.dao.UsersDao;
import swp12.gym.dto.*;
import swp12.gym.model.entity.*;
import swp12.gym.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/trainer")
public class TrainerBaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private ClassService classService;
    @Autowired
    private UsersDao userDao;
    @Autowired
    private TrainerService trainerService;
    @Autowired
    private ProductService productService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private PersonalTrainerDetailService personalTrainerDetailService;
    @Autowired
    private TicketUserService ticketUserService;
    @Autowired
    private TimeService timeService;
    @Autowired
    private LogUserService logUserService;



    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String homeTrainer(Model model, Authentication authentication) {

        String email = ((UserDetails) authentication.getPrincipal()).getUsername();
//        List<ClassDto> class_list = classService.findClassAllOfAnTrainer(email);

        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);

//        model.addAttribute("class_list", class_list);
        return "trainer/index_trainer";
    }

    @RequestMapping(value = "/show-list-personal",method = RequestMethod.GET)
    public String goListPersonal(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        List<TicketTrainerDto> allTicketTrainer = ticketService.findAllTicketTrainer();

        model.addAttribute("tickets", ticket);
        model.addAttribute("allTicketTrainer", allTicketTrainer);
        return "trainer/list_personal";
    }

    @RequestMapping(value = "/show-list-class",method = RequestMethod.GET)
    public String goListClass(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        List<TicketTrainerDto> allTicketClass = ticketService.findAllTicketClassForCustomer();
        model.addAttribute("allTicketClass", allTicketClass);
        return "trainer/list_class";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexTrainer(Model model, Authentication authentication) {

//        String email = ((UserDetails) authentication.getPrincipal()).getUsername();
//        List<ClassDto> class_list = classService.findClassAllOfAnTrainer(email);
//        model.addAttribute("class_list", class_list);
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);


        return "trainer/index_trainer";
    }

    @RequestMapping(value = "/manage_class",method = RequestMethod.GET)
    public String goManageClass(Model model, Authentication authentication) {

        String email = ((UserDetails) authentication.getPrincipal()).getUsername();
        List<ClassDto> class_list = classService.findClassAllOfAnTrainer(email);
        model.addAttribute("class_list", class_list);

        List<ClassDto> listClassesForTheDay = classService.findAllClassesForTheDayOfAnTrainer(email);
        model.addAttribute("listClassesForTheDay", listClassesForTheDay);
        return "trainer/manage_class";
    }

    @RequestMapping(value = "/class-attendance/{id}",method = RequestMethod.GET)
    public String goAttendanceOfTrainer(Model model, @PathVariable int id, Authentication authentication) {
        return "trainer/trainer_attendance";
    }

    @RequestMapping(value = "/class/{id}",method = RequestMethod.GET)
    public String goDetailClassOfTrainer(Model model, @PathVariable int id) {
        //Thông tin lớp
        ClassDto classDto = classService.findDetailAnClass(id);
        model.addAttribute("classDto", classDto);
        //Danh sách hội viên
        List<User> list_user_of_class = userService.findAllUserOfAnClass(id);
        model.addAttribute("list_user_of_class", list_user_of_class);

        String jsonDetailClass = new Gson().toJson(classDto);
        model.addAttribute("jsonDetailClass",jsonDetailClass);

        //list attendance of class
        List<Attendance> list_attendance = attendanceService.listAttendance(id);

        String jsonListAttendance = new Gson().toJson(list_attendance);
        model.addAttribute("jsonListAttendance",jsonListAttendance);
        System.out.println("list_attendance: " + list_attendance);

        return "trainer/class_detail";
    }

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);
        System.out.println("productDtos: " + productDtos);
        return "trainer/view_product";
    }

//    @RequestMapping(value = "/attendance-an-class/{class_id}",method = RequestMethod.GET)
//    public String goAttendance(@PathVariable int class_id, Model model) {
//        List<swp12.gym.model.entity.User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
//        model.addAttribute("list_user_of_class", list_user_of_class);
//        System.out.println(list_user_of_class);
//
//        return "customer/index_customer";
//    }

    @RequestMapping(value = "/attendance-an-class/{class_id}",method = RequestMethod.GET)
    public String goAttendance(@PathVariable int class_id, Model model) {
        List<User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
        model.addAttribute("list_user_of_class", list_user_of_class);
        model.addAttribute("classID", class_id);
        return "trainer/trainer_attendance";
    }

    @RequestMapping(value = "/update-attendance-an-class/{class_id}",method = RequestMethod.GET)
    public String goUpdateAttendance(@PathVariable int class_id, Model model) {
        List<User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
        model.addAttribute("list_user_of_class", list_user_of_class);
        model.addAttribute("classID", class_id);

        List<Attendance> list_attendance_user_of_class = userService.findAllAttendaneUserOfAnClass(class_id);
        model.addAttribute("list_attendance_user_of_class", list_attendance_user_of_class);
        return "trainer/update_attendance";
    }

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileCustomer(Model model, HttpSession s) {
        UserDto user = userService.getCustomerByEmail(s.getAttribute("display_email").toString());
        model.addAttribute("user",user);
        return "trainer/profile_user";
    }

    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForTrainer() {
        return "trainer/change_pass";
    }

    @RequestMapping(value = "/activity-log/page={pagination}",method = RequestMethod.GET)
    public String goActivityOfTrainer(Model model, Authentication authentication, @PathVariable String pagination) {
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
            List<LogUser> logUsers = logUserService.getAnLogOfAnUser(id, pagination_value);
            model.addAttribute("logUser", logUsers);
            model.addAttribute("count", count_row);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("pagination", pagination_value);
            return "trainer/activity_log";
        }
    }

    @RequestMapping(value = "/checkAttendance",method = RequestMethod.GET)
    public ResponseEntity<String> checkDateAttendanceClass(HttpServletRequest request) {
        try{
            System.out.println("Class id: " + request.getParameter("_classID"));
            int class_id = Integer.parseInt(request.getParameter("_classID"));
//            ClassDto classDto = classService.findDetailAnClass(class_id);
            String results = attendanceService.checkDateAttendanceClass(class_id);
            return new ResponseEntity<String>(results, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/schedule",method = RequestMethod.GET)
    public String checkoutteachingSchedule(Authentication authentication, Model model){
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        int userID = userDao.findIdByUsername(userDetails.getUsername());

        //lấy xem lịch của class
        List<ClassDto> scheduleClassOfCustomer = classService.findAllScheduleClassOfAnTrainer(userID);
        String jsonData = new Gson().toJson(scheduleClassOfCustomer); // chuyển đổi sang chuỗi JSON
        model.addAttribute("jsonData",jsonData);

        //lấy check lịch personal trainer
        List<PersonalTrainerDetail> schedulePersonalTrainer = personalTrainerDetailService.findAllSchedulePersonalOfAnTrainer(userID);
        System.out.println("schedulePersonalTrainer: " + schedulePersonalTrainer);
        String jsonPersonalDetail = new Gson().toJson(schedulePersonalTrainer);
        model.addAttribute("jsonPersonalDetail",jsonPersonalDetail);


        //lấy set text lên lịch thuê pt cá nhân
//        List<TicketUserDto> ticketUserOfSchedulePersonal = ticketUserService.findTicketUserOfSchedulePersonal(userID);
//        String jsonSchedulePersonal = new Gson().toJson(ticketUserOfSchedulePersonal);
//        model.addAttribute("jsonSchedulePersonal",jsonSchedulePersonal);
        List<Time> times = timeService.findAll();
        model.addAttribute("times",times);

        return "trainer/teaching_schedule";
    }

    @RequestMapping(value = "/view-schedule-trainer", method = RequestMethod.GET)
    public String goViewDetailAnClass(@RequestParam(value = "trainer_id") int trainer_id, Model model){
        int userID = userDao.findUserIdByTrainerID(trainer_id);

        //lấy xem lịch của class
        List<ClassDto> scheduleClassOfCustomer = classService.findAllScheduleClassOfAnTrainer(userID);
        String jsonData = new Gson().toJson(scheduleClassOfCustomer); // chuyển đổi sang chuỗi JSON
        model.addAttribute("jsonData",jsonData);

        //lấy check lịch personal trainer
        List<PersonalTrainerDetail> schedulePersonalTrainer = personalTrainerDetailService.findAllSchedulePersonalOfAnTrainer(userID);
        String jsonPersonalDetail = new Gson().toJson(schedulePersonalTrainer);
        model.addAttribute("jsonPersonalDetail",jsonPersonalDetail);

        List<Time> times = timeService.findAll();
        model.addAttribute("times",times);

        return "trainer/teaching_schedule";
    }

    @RequestMapping(value = "find-personal-trainer", method = RequestMethod.GET)
    public ResponseEntity<List<UserDto>> find_Trainer_Ticket_Personal(@RequestParam(value = "ids") int ticket_id){
        try{
            List<UserDto> trainerPersonal = trainerService.findAllTrainerPersonal(ticket_id);

            return new ResponseEntity<List<UserDto>>(trainerPersonal, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<UserDto>>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "find-class", method = RequestMethod.GET)
    public ResponseEntity<List<ClassDto>> find_Class_Ticket_Class(@RequestParam(value = "ids") int ticket_id){
        try{
            List<ClassDto> ticket_class = classService.findAllClassOfAnTicketClass(ticket_id);
            return new ResponseEntity<List<ClassDto>>(ticket_class, HttpStatus.OK);
//            return new ResponseEntity<List<ClassDto>>(ticket_class, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<ClassDto>>(HttpStatus.BAD_REQUEST);
        }
    }
}
