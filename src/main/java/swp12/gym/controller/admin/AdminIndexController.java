package swp12.gym.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.model.Entity.Tickets;
import swp12.gym.model.Entity.Users;
import swp12.gym.service.TicketService;
import swp12.gym.service.UserService;

import java.util.List;

@Controller
@Secured("ROLE_ADMIN")
public class AdminIndexController {

    @Autowired
    private UserService userService;
    private TicketService ticketService;

    //manage_acccount
    @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
    public String goDashboardAdmin(Model model) {

        List<Users> users = userService.findAllUsers();
        if(users.isEmpty()){
            return "admin/dashboard_admin";
        }
        model.addAttribute("arr",userService.findAllUsers());
        return "admin/dashboard_admin";
    }

    //manage_acccount
    @RequestMapping(value = "/admin/dashboard/user", method = RequestMethod.GET)
    public String getAllUserForAdmin(Model model) {

        List<Users> users = userService.findAllUsers();
        if(users.isEmpty()){
            return "admin/dashboard_admin";
        }
        model.addAttribute("arr",userService.findAllUsers());
        return "admin/dashboard_admin";
    }

    //manage_Tickets
    @RequestMapping(value = "/admin/dashboard/tickets", method = RequestMethod.GET)
    public String getAllTicketForAdmin(Model model) {

//        List<Tickets> tickets = ticketService.findAllTicketIsActive();
//        if(tickets.isEmpty()){
//            System.out.println("den day");
//            return "base/errorspage";
//        }
//        model.addAttribute("arr",ticketService.findAllTicketIsActive());
        return "admin/management_ticket_admin";
    }

//    @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
//    public String goDashboardAdmin1(Model model) {
//
//        List<Users> users = userService.findAllUsers();
//        if(users.isEmpty()){
//            return "admin/dashboard_admin";
//        }
//        model.addAttribute("arr",userService.findAllUsers());
//        return "admin/dashboard_admin";
//    }
}
