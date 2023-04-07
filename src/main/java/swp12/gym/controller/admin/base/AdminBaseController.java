package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Time;
import swp12.gym.model.entity.User;
import swp12.gym.service.TicketService;
import swp12.gym.service.TimeService;
import swp12.gym.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminBaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TimeService timeService;

    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForAdmin() {
        return "layouts/change_pass";
    }

    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityAdmin() {
        return "layouts/change_pass";
    }

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileAdmin(Model model, Authentication authentication) {
        UserDto user = userService.getUserByEmail(((UserDetails) authentication.getPrincipal()).getUsername());
        model.addAttribute("user",user);
        return "base/profile_user";
    }

    //Xem tất cả các vé vào cửa - done
    @RequestMapping(value = "/ticket",method = RequestMethod.GET)
    public String goTicketDoor(Model model){
        int count = ticketService.getNumberTicketInSystem();
        List<User> trainer = userService.findAllTrainer();
        List<TicketDto> tickets = ticketService.findAllOfAdmin();
        List<Time> times = timeService.findAll();

        model.addAttribute("trainer", trainer);
        model.addAttribute("count", count);
        model.addAttribute("times", times);
        model.addAttribute("tickets", tickets);

        return "admin/ticket/list_ticket";
    }

    @RequestMapping(value = "/ticket-detail/{id}", method = RequestMethod.GET)
    public String goDetailTicket(@PathVariable int id, Model model){
        return "admin/ticket/detail_ticket";
    }

    @RequestMapping(value = "/products/save",method = RequestMethod.GET)
    public String addProduct(Model model){
        return "admin/product/list_product";
    }
}
