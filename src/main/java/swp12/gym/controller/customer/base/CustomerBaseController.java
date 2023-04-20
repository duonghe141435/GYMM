package swp12.gym.controller.customer.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Attendance;
import swp12.gym.model.entity.LogUser;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.Time;
import swp12.gym.model.entity.User;
import swp12.gym.service.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    private AttendanceService attendanceService;

    //Home user
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String indexCustomer(Model model) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        return "customer/index_customer";
    }

    @RequestMapping(value = "/show-list-personal",method = RequestMethod.GET)
    public String goListPersonal(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        List<TicketTrainerDto> allTicketTrainer = ticketService.findAllTicketTrainer();

        model.addAttribute("tickets", ticket);
        model.addAttribute("allTicketTrainer", allTicketTrainer);
        return "customer/list_personal";
    }

    @RequestMapping(value = "/show-list-class",method = RequestMethod.GET)
    public String goListClass(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        List<TicketTrainerDto> allTicketClass = ticketService.findAllTicketClassForCustomer();
        model.addAttribute("allTicketClass", allTicketClass);
        return "customer/list_class";
    }

    @RequestMapping(value = "/show-list-trainer",method = RequestMethod.GET)
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
        List<Ticket> ticket = ticketService.findAddTicketOfAnCustomer(1, id);
        model.addAttribute("ticket",ticket);
        return "customer/log/ticket_log";
    }

    @RequestMapping(value = "/booking-trainer-log",method = RequestMethod.GET)
    public String goBookingTrainerLog(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());

        List<Ticket> ticket = ticketService.findAddTicketOfAnCustomer(2, id);

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

    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityCustomer(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<LogUser> logUsers = logUserService.getAnLogOfAnUser(id);
        model.addAttribute("logUser",logUsers);
        return "customer/log/activity_log";
    }

    @RequestMapping(value = "/product-order-log",method = RequestMethod.GET)
    public String goProductOrderLog(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        return "customer/log/activity_log";
    }

    @GetMapping("/book_pt")
    public String checkoutbookpt(Authentication authentication, Model model){
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userName = userDetails.getUsername();
        int userID = userDao.findIdByUsername(userName);

        List<ClassDto> scheduleClassOfCustomer = classService.findAllScheduleClassOfAnUserById(userID);
        model.addAttribute("scheduleClassOfCustomer",scheduleClassOfCustomer);
        List<Time> times = timeService.findAll();
        model.addAttribute("times",times);
        return "customer/book_pt";
    }

    @RequestMapping(value = "/list_class_of_customer",method = RequestMethod.GET)
    public String listClassOfCustomer(Model model, Authentication authentication) {
        int id = userService.findIdByUsername(((UserDetails) authentication.getPrincipal()).getUsername());
        List<ClassDto> classDtos = classService.findAllClassOfAnUserById(id);
        model.addAttribute("classDtos",classDtos);

        return "customer/booked_class";
    }

    @RequestMapping(value = "/attendance-an-class",method = RequestMethod.GET)
    public String goAttendance(Model model) {
        List<User> list_user_of_class = userService.findAllUserOfAnClass(7);
        model.addAttribute("list_user_of_class", list_user_of_class);
        return "customer/attendance";
    }

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

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.GET)
    public String updateCustomer(@ModelAttribute("user") User user, Model model) {
        System.out.println(user.toString());
        return "customer/index_customer";
    }
}

