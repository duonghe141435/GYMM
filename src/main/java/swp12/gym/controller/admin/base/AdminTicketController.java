package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.User;
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

    //Xem tất cả các vé vào cửa
    @RequestMapping(value = "/ticket-door",method = RequestMethod.GET)
    public String goTicketDoor(Model model){
        List<TicketDto> tickets = ticketService.findAllTicketDoor();

        model.addAttribute("tickets", tickets);
        return "admin/ticket/list_ticket";
    }

    @RequestMapping(value = "/ticket-trainer", method = RequestMethod.GET)
    public String goManagementTicketTrainer(Model model){
        //get all ticket trainer
        List<User> trainer = userService.findAllTrainerIdAndName();
        List<TicketDto> tickets = ticketService.findAllTicketTrainer();

        model.addAttribute("trainer", trainer);
        model.addAttribute("tickets", tickets);
        return "admin/ticket/list_ticket_trainer";
    }


    @RequestMapping(value = "/ticket-class", method = RequestMethod.GET)
    public String goManagementTicketClass(Model model){
        List<User> trainer = userService.findAllTrainerIdAndName();
        List<TicketDto> tickets = ticketService.findAllTicketClass();


        model.addAttribute("trainer", trainer);
        model.addAttribute("tickets", tickets);
        return "admin/ticket/list_ticket_class";
    }

}