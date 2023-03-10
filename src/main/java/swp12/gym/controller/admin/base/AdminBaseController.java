package swp12.gym.controller.admin.base;

import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketType;
import swp12.gym.model.entity.User;
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
        List<Ticket> tickets = ticketService.findAll();
        List<TicketType> ticketTypes = ticketTypeService.findAll();
        model.addAttribute("tickets", tickets);
        model.addAttribute("ticketTypes", ticketTypes);
        model.addAttribute("ticket", new Ticket());
        return "admin/ticket/list_ticket";
    }


    @RequestMapping(value = "/tickets/create",method = RequestMethod.POST)
    public String createTicket(@ModelAttribute("ticket")Ticket ticket){
        System.out.println(ticket.toString());
        return "redirect:/admin/dashboard/tickets";
    }


    @RequestMapping(value = "/products",method = RequestMethod.GET)
    public String goDashbroashProdcut(){
        return "admin/product/list_product";
    }


}
