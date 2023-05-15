package swp12.gym.controller.employee.base;

import com.google.gson.Gson;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.CheckInDto;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.CheckIn;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.User;
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




    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityAdmin() {
        return "employee/change_pass";
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
        List<UserDto> customers = userService.findAllCustomer();
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
}

