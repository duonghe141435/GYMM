package swp12.gym.controller.customer.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.Time;
import swp12.gym.model.entity.User;
import swp12.gym.service.ProductService;
import swp12.gym.service.TicketService;
import swp12.gym.service.TimeService;
import swp12.gym.service.UserService;

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

    //Home user
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String indexCustomer(Model model) {
        List<Ticket> ticket = ticketService.findAll();
        //        List<Ticket> ticket = ticketService.findAllGymTicket();
        model.addAttribute("tickets", ticket);

        List<TicketTrainerDto> allTicketTrainer = ticketService.findAllTicketTrainer();
        model.addAttribute("allTicketTrainer", allTicketTrainer);

        List<TicketTrainerDto> allTicketClass = ticketService.findAllTicketClassForCustomer();
        model.addAttribute("allTicketClass", allTicketClass);

        List<User> trainers = userService.findAllTrainer();
        model.addAttribute("trainers",trainers);

        List<Time> times = timeService.findAll();
        model.addAttribute("times",times);

        return "customer/index_customer";
    }


    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileCustomer(Model model, HttpSession s) {

        UserDto user = userService.getUserByEmail(s.getAttribute("display_email").toString());

        model.addAttribute("user",user);
        return "base/profile_user";
    }

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.GET)
    public String updateCustomer(@ModelAttribute("user") User user, Model model) {
        System.out.println(user.toString());
        return "customer/index_customer";
    }

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);
        return "customer/view_product";
    }
}

