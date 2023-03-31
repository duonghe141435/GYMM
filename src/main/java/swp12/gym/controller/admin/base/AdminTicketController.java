package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketType;
import swp12.gym.service.TicketService;
import swp12.gym.service.TicketTypeService;
import swp12.gym.service.TimeService;
import swp12.gym.service.UserService;

import java.util.List;

public class AdminTicketController {
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TicketTypeService ticketTypeService;
    @Autowired
    private TimeService timeService;
    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String goDashbroashTicket(Model model){
        //get all ticket
        List<TicketDto> tickets = ticketService.findAll();

        model.addAttribute("tickets", tickets);
        return "admin/ticket/list_ticket";
    }

    //Tao ve moi
    @RequestMapping(value = "/new-ticket",method = RequestMethod.GET)
    public String goCreateTicket(Model model){
        List<TicketType> ticketTypes = ticketTypeService.findAll();

        model.addAttribute("ticketTypes", ticketTypes);
        model.addAttribute("ticket", new Ticket());
        return "admin/ticket/create_ticket";
    }


    //Luu ve moi vao database
    @RequestMapping(value = "/new-ticket/save",method = RequestMethod.POST)
    public String goSaveTicket(@ModelAttribute("ticket") Ticket ticket){
        int id_t = ticketService.getNumberTicketInSystem();
        ticketService.createTicket(ticket);
        return "redirect:/admin/dashboard/tickets";
    }
}
