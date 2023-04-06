package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.TicketClassDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.User;
import swp12.gym.service.TicketService;
import swp12.gym.service.UserService;

import java.sql.Time;
import java.util.List;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminTicketController {
    @Autowired
    private TicketService ticketService;
    @Autowired
    private UserService userService;

    //Xem tất cả các vé vào cửa - done
    @RequestMapping(value = "/ticket-door",method = RequestMethod.GET)
    public String goTicketDoor(Model model){
        List<Ticket> tickets = ticketService.findAllTicketDoor();
        model.addAttribute("tickets", tickets);
        return "admin/ticket/ticket_door/list_ticket_door";
    }


    @RequestMapping(value = "/ticket-trainer", method = RequestMethod.GET)
    public String goManagementTicketTrainer(Model model){
        //get all ticket trainer
        List<User> trainer = userService.findAllTrainer();
        List<TicketTrainerDto> tickets = ticketService.findAllTicketTrainer();

        model.addAttribute("trainer", trainer);
        model.addAttribute("tickets", tickets);
        return "admin/ticket/ticket_trainer/list_ticket_trainer";
    }


    @RequestMapping(value = "/ticket-class", method = RequestMethod.GET)
    public String goManagementTicketClass(Model model){
        List<User> trainer = userService.findAllTrainer();
        List<Time> times = ticketService.findAllTime();
        List<TicketClassDto> tickets = ticketService.findAllTicketClass();

        model.addAttribute("times", times);
        model.addAttribute("trainer", trainer);
        model.addAttribute("tickets", tickets);
        return "admin/ticket/ticket_class/list_ticket_class";
    }

    @RequestMapping(value = "/ticket-detail/{id}", method = RequestMethod.GET)
    public String goDetailTicket(@PathVariable int id, Model model){
        return "admin/ticket/detail_ticket";
    }

}
