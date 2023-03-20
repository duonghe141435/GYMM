package swp12.gym.controller.admin.base;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketType;
import swp12.gym.model.entity.User;
import swp12.gym.service.ProductService;
import swp12.gym.service.TicketService;
import swp12.gym.service.TicketTypeService;
import swp12.gym.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminBaseController {

    @Autowired
    private TicketService ticketService;
    @Autowired
    private TicketTypeService ticketTypeService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;


    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/users",method = RequestMethod.GET)
    public String goDashbroashUser(Model model){
        List<User> users = userService.findAll();
        model.addAttribute("users",users);
        return "admin/user/list_user";
    }

    @RequestMapping(value = "/tickets",method = RequestMethod.GET)
    public String goDashbroashTicket(Model model){

        List<TicketDto> tickets = ticketService.findAll();
        List<TicketType> ticketTypes = ticketTypeService.findAll();

        model.addAttribute("tickets", tickets);
        model.addAttribute("ticketTypes", ticketTypes);
        return "admin/ticket/list_ticket";
    }


    @RequestMapping(value = "/products",method = RequestMethod.GET)
    public String goDashbroashProdcut(Model model){
        List<ProductDto> productDtos = productService.findAll();

        model.addAttribute("productDtos", productDtos);
        return "admin/product/list_product";
    }


}
