package swp12.gym.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketType;
import swp12.gym.service.TicketService;
import swp12.gym.service.TicketTypeService;
import swp12.gym.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminTicketController {
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TicketTypeService ticketTypeService;


    //Xem tất cả các vé vào cửa
    @RequestMapping(value = "/ticket-door",method = RequestMethod.GET)
    public String goTicketDoor(Model model){
        List<TicketDto> tickets = ticketService.findAllTicketDoor();

        model.addAttribute("tickets", tickets);
        return "admin/ticket/list_ticket_door";
    }
}
