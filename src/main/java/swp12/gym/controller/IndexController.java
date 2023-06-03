package swp12.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.common.DataUtil;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.User;
import swp12.gym.service.ClassService;
import swp12.gym.service.ProductService;
import swp12.gym.service.TicketService;
import swp12.gym.service.UserService;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ClassService classService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;

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
        return "guest/homepage";
    }

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String productPage(Model model) {

        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);
        return "guest/view_product";
    }

    @RequestMapping(value = "/list-personal",method = RequestMethod.GET)
    public String goListPersonal(Model model) {
        List<Ticket> ticket = ticketService.findAll();
        List<TicketTrainerDto> allTicketTrainer = ticketService.findAllTicketTrainer();

        model.addAttribute("tickets", ticket);
        model.addAttribute("allTicketTrainer", allTicketTrainer);
        return "guest/list_personal";
    }

    @RequestMapping(value = "/list-class",method = RequestMethod.GET)
    public String goListClass(Model model) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        List<TicketTrainerDto> allTicketClass = ticketService.findAllTicketClassForCustomer();
        model.addAttribute("allTicketClass", allTicketClass);
        return "guest/list_class";
    }

    @RequestMapping(value = "/list-trainer",method = RequestMethod.GET)
    public String goListTrainer(Model model) {
        List<User> trainers = userService.findAllTrainer();
        model.addAttribute("trainers",trainers);
        return "guest/list_trainer";
    }

}
