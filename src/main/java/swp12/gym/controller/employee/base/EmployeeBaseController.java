package swp12.gym.controller.employee.base;

import com.google.gson.Gson;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.*;
import swp12.gym.model.entity.*;
import swp12.gym.service.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/employee")
public class EmployeeBaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CheckInService checkInService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private UsersDao userDao;
    @Autowired
    private ClassService classService;
    @Autowired
    private PersonalTrainerDetailService personalTrainerDetailService;
    @Autowired
    private TimeService timeService;
    @Autowired
    private TrainerService trainerService;
    @Autowired
    private LogUserService logUserService;

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String homeTrainer(Model model, Authentication authentication) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        return "employee/index_employee";
    }

    @RequestMapping(value = "/show-list-personal",method = RequestMethod.GET)
    public String goListPersonal(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        List<TicketTrainerDto> allTicketTrainer = ticketService.findAllTicketTrainer();

        model.addAttribute("tickets", ticket);
        model.addAttribute("allTicketTrainer", allTicketTrainer);
        return "employee/list_personal";
    }

    @RequestMapping(value = "/show-list-class",method = RequestMethod.GET)
    public String goListClass(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        List<TicketTrainerDto> allTicketClass = ticketService.findAllTicketClassForCustomer();
        model.addAttribute("allTicketClass", allTicketClass);
        return "employee/list_class";
    }


    //done
    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForEmployee() {
        return "employee/change_pass";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexEmployee(Model model) {
        //man index employee se la man ban hang
        //Ngoai ra employee con co DK khach hang tai quay
//        return "employee/index_employee";
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        return "employee/index_employee";
    }

    @RequestMapping(value = "/notify",method = RequestMethod.GET)
    public String goShowAllNotify() {
        return "employee/notify";
    }


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
            List<LogUser> logUsers = logUserService.getAnLogOfAnUser(id, pagination_value);
            model.addAttribute("logUser", logUsers);
            model.addAttribute("count", count_row);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("pagination", pagination_value);
            return "employee/activity_log";
        }
    }

    @RequestMapping(value = "/product-order-log",method = RequestMethod.GET)
    public String goProductOrderLog(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<Order> logOrder = orderService.findAllOrderOfAnStaffId(id);
        model.addAttribute("logOrder",logOrder);
        return "employee/order_log";
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

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileEmployee(Model model, Authentication authentication) {
        UserDto user = userService.getUserByEmail(((UserDetails) authentication.getPrincipal()).getUsername());
        model.addAttribute("user",user);
        return "employee/profile_user";
    }

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.GET)
    public String updateEmployee(@ModelAttribute("user") User user, Model model) {
        System.out.println(user.toString());
        return "employee/index_employee";
    }

    @RequestMapping(value = "/order-product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);
        List<UserDto> customers = userService.findAllCustomerEmployee();
        //${customers.u_id} là user_ID
        List<User> trainers = userService.findAllTrainer();
        //${trainers.u_enable} là user_ID
        String jsonCustomer = new Gson().toJson(customers);
        String jsonTrainer = new Gson().toJson(trainers);
        model.addAttribute("jsonCustomer",jsonCustomer);
        model.addAttribute("jsonTrainer",jsonTrainer);
        int order_id = orderService.getIdOrder();
        String rand = RandomStringUtils.randomNumeric(4);
        if (order_id < 10){
            String code = "00" + order_id + rand;
            model.addAttribute("code",code);
        }
        if (order_id < 100 && order_id >= 10){
            String code = "0" + order_id + rand;
            model.addAttribute("code",code);
        }
        if (order_id > 100){
            String code = order_id + rand;
            model.addAttribute("code",code);
        }
        return "employee/order-product";
    }

    @RequestMapping(value = "/list-checkIn", method = RequestMethod.GET)
    public String goListEmployee(Model model){
        List<CheckInDto> allCheckIn = checkInService.findAllCheckIn();
        model.addAttribute("allCheckIn", allCheckIn);
        System.out.println("allCheckIn: " + allCheckIn);
        return "employee/list_checkIn";
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

        return "employee/schedule_trainer";
    }

    @RequestMapping(value = "find-personal-trainer", method = RequestMethod.GET)
    public ResponseEntity<List<UserDto>> find_Trainer_Ticket_Personal(@RequestParam(value = "ids") int ticket_id){
        try{
            List<UserDto> trainerPersonal = trainerService.findAllTrainerPersonal(ticket_id);
            System.out.println("trainerPersonal: " + trainerPersonal);
            return new ResponseEntity<List<UserDto>>(trainerPersonal, HttpStatus.OK);
//            redirectAttributes.addFlashAttribute("trainerPersonal", trainerPersonal);
//            return new ResponseEntity<String>( "1", HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<UserDto>>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "find-class", method = RequestMethod.GET)
    public ResponseEntity<List<ClassDto>> find_Class_Ticket_Class(@RequestParam(value = "ids") int ticket_id){
        try{
            List<ClassDto> ticket_class = classService.findAllClassOfAnTicketClass(ticket_id);
            System.out.println("ticket_class: " + ticket_class);
            return new ResponseEntity<List<ClassDto>>(ticket_class, HttpStatus.OK);
//            return new ResponseEntity<List<ClassDto>>(ticket_class, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<ClassDto>>(HttpStatus.BAD_REQUEST);
        }
    }
}

