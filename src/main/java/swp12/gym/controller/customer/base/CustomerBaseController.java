package swp12.gym.controller.customer.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.common.DataUtil;
import swp12.gym.common.FileUtil;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.*;
import swp12.gym.model.entity.*;
import swp12.gym.service.*;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerBaseController {

    @Autowired
    private TimeService timeService;
    @Autowired
    private UserService userService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ClassService classService;
    @Autowired
    private LogUserService logUserService;
    @Autowired
    private UsersDao userDao;
    @Autowired
    private TicketUserService ticketUserService;
    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private PersonalTrainerDetailService personalTrainerDetailService;
    @Autowired
    private OrderService orderService;

    @Autowired
    private CheckInService checkInService;
    @Autowired
    private DataUtil dataUtil;

    @PostConstruct
    public void changeStatusClass() {
        //kiểm tra class có hôm này có lớp start vào ngày này hay không
        classService.updateStatusClassForStartDate();
        classService.updateStatusClassForEndDate();
    }


    //Home user
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String indexCustomer(Model model) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        return "customer/index_customer";
    }

    @RequestMapping(value = "/list-personal",method = RequestMethod.GET)
    public String goListPersonal(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        List<TicketTrainerDto> allTicketTrainer = ticketService.findAllTicketTrainer();

        model.addAttribute("tickets", ticket);
        model.addAttribute("allTicketTrainer", allTicketTrainer);
        return "customer/list_personal";
    }

    @RequestMapping(value = "/list-class",method = RequestMethod.GET)
    public String goListClass(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        List<TicketTrainerDto> allTicketClass = ticketService.findAllTicketClassForCustomer();
        model.addAttribute("allTicketClass", allTicketClass);
        return "customer/list_class";
    }

    @RequestMapping(value = "/list-trainer",method = RequestMethod.GET)
    public String goListTrainer(Model model, HttpSession s) {
        List<User> trainers = userService.findAllTrainer();
        model.addAttribute("trainers",trainers);
        return "customer/list_trainer";
    }

    //----------------------------------------------
    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);

        return "customer/view_product";
    }

    //----------------------------------------------
    @RequestMapping(value = "/booking-ticket-log",method = RequestMethod.GET)
    public String goBookingTicketLog(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<Ticket> ticket = ticketService.findTicketOfAnCustomer(1, id);
        model.addAttribute("ticket",ticket);
        return "customer/log/ticket_log";
    }

    @RequestMapping(value = "/booking-trainer-log",method = RequestMethod.GET)
    public String goBookingTrainerLog(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<Ticket> ticket = ticketService.findTicketOfAnCustomer(2, id);
        model.addAttribute("ticket",ticket);
        return "customer/log/trainer_log";
    }

    @RequestMapping(value = "/booking-class-log",method = RequestMethod.GET)
    public String goBookingClassCustomer(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<ClassDto> classDtos = classService.findAllClassOfAnUserById(id);
        model.addAttribute("classDtos",classDtos);
        return "customer/log/class_log";
    }

    @RequestMapping(value = "/activity-log/page={pagination}",method = RequestMethod.GET)
    public String goActivityCustomer(Model model, Authentication authentication, @PathVariable String pagination) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        int pagination_value = Integer.parseInt(pagination);
        int totalPages = 1;
        int count_row = logUserService.getNumberLoguOfAnUser(id);;

        if(count_row != 0){
            totalPages = (int) Math.ceil((double) count_row / 10);
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

            return "customer/log/activity_log";
        }
    }

    @RequestMapping(value = "/product-order-log",method = RequestMethod.GET)
    public String goProductOrderLog(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<Order> logOrder = orderService.findAllOrderOfAnUserById(id);
        model.addAttribute("logOrder",logOrder);
        return "customer/log/order_log";
    }

    @GetMapping(value = "detail-order/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<OrderDetail>> createProductType(@PathVariable int id) {
        try {
            List<OrderDetail> orderDetail = orderService.getDetailOfAnOrder(id);
            return new ResponseEntity<List<OrderDetail>>(orderDetail, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<List<OrderDetail>>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/book-pt")
    public String checkoutbookpt(Authentication authentication, Model model){
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        int userID = userDao.findIdByUsername(userDetails.getUsername());

        //lấy xem lịch của class
        List<ClassDto> scheduleClassOfCustomer = classService.findAllScheduleClassOfAnUserById(userID);
        String jsonData = new Gson().toJson(scheduleClassOfCustomer); // chuyển đổi sang chuỗi JSON
        model.addAttribute("jsonData",jsonData);

        //lấy check lịch personal trainer
        List<PersonalTrainerDetail> schedulePersonalTrainer = personalTrainerDetailService.findPersonalTrainerDetail(userID);
        String jsonPersonalDetail = new Gson().toJson(schedulePersonalTrainer);
        model.addAttribute("jsonPersonalDetail",jsonPersonalDetail);


        //lấy set text lên lịch thuê pt cá nhân
        List<TicketUserDto> ticketUserOfSchedulePersonal = ticketUserService.findTicketUserOfSchedulePersonal(userID);
        String jsonSchedulePersonal = new Gson().toJson(ticketUserOfSchedulePersonal);
        model.addAttribute("jsonSchedulePersonal",jsonSchedulePersonal);

        List<Time> times = timeService.findAll();
        model.addAttribute("times",times);
        return "customer/book_pt";
    }

    @RequestMapping(value = "/list-class-of-you",method = RequestMethod.GET)
    public String listClassOfCustomer(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<ClassDto> classDtos = classService.findAllClassOfAnUserById(id);
        model.addAttribute("classDtos",classDtos);

        return "customer/booked_class";
    }

//    @RequestMapping(value = "/attendance-an-class",method = RequestMethod.GET)
//    public String goAttendance(Model model) {
//        List<User> list_user_of_class = userService.findAllUserOfAnClass(7);
//        model.addAttribute("list_user_of_class", list_user_of_class);
//        return "customer/attendance";
//    }

    @RequestMapping(value = "/show_list_customer",method = RequestMethod.GET)
    public String showListCustomerOfAnClass(@RequestParam(value = "class_id") int class_id, Model model) {
        List<User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
        model.addAttribute("list_user_of_class", list_user_of_class);
        return "customer/list_user_of_class";
    }


    //----------------------------------------------
    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileCustomer(Model model, HttpSession s) {
        UserDto user = userService.getCustomerByEmail(s.getAttribute("display_email").toString());
        model.addAttribute("user",user);
        return "customer/profile_user";
    }

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.POST)
    public String updateCustomer(@ModelAttribute("user") UserDto user, HttpSession s,
                                 @RequestParam("file-up") CommonsMultipartFile file)
    {
        System.out.println(file.getOriginalFilename());
        if (!file.getOriginalFilename().equals("") && file.getOriginalFilename() != null) {
            String u_img = "/assets/img/avatars/" + file.getOriginalFilename();
            if (!u_img.equalsIgnoreCase(user.getU_img())) {
                FileUtil.doSaveImgToService(file,s,"avatars");
                user.setU_img(u_img);
            }
        }

        userService.updateUserProfile(user);
        return  "redirect:/customer/home";
    }

    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForCustomer() {
            return "customer/change_pass";
    }

    @RequestMapping(value = "/checkIn",method = RequestMethod.POST)
    public ResponseEntity<String> insertCheckIn(Authentication authentication) {
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            int userID = userDao.findIdByUsername(userName);
            String result = checkInService.checkIn(userID);
            if (result.equals("YES")){
                checkInService.insertCheckIn(userID, 1);
                return new ResponseEntity<String>("YES", HttpStatus.OK);
            }else if (result.equals("NO")){
                checkInService.insertCheckIn(userID, 0);
                return new ResponseEntity<String>("NO", HttpStatus.OK);
            }else {
                checkInService.insertCheckIn(userID, -1);
                return new ResponseEntity<String>("NULL", HttpStatus.OK);
            }
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "/check-personal-trainer",method = RequestMethod.GET)
    public ResponseEntity<TicketUserDto> checkPersonalTrainer(HttpServletRequest request, Authentication authentication) {
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            int userID = userDao.findIdByUsername(userName);

            String dateConvert = request.getParameter("_dateConvert");
            String result = personalTrainerDetailService.checkPersonalTrainerDetail(userID, dateConvert);

            if (result.equals("0")){
                TicketUserDto ticketUserDto = ticketUserService.findAnTicketUserDto(userID, dateConvert);
                return new ResponseEntity<TicketUserDto>(ticketUserDto, HttpStatus.OK);
            }else {
                return new ResponseEntity<TicketUserDto>(HttpStatus.NO_CONTENT);
            }
        }catch (Exception e){
            return new ResponseEntity<TicketUserDto>(HttpStatus.BAD_REQUEST);
        }
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


        return "customer/schedule_trainer";
    }
}

