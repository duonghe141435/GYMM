package swp12.gym.controller.user.base;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserBaseController {

    //Home user
    @RequestMapping(value = "/user",method = RequestMethod.GET)
    public String index_user() {
        return "user/index_user";
    }

    @RequestMapping(value = "/booking_tickets", method = RequestMethod.GET)
    public String bookingTickets() {
        return "index";
    }

    @RequestMapping(value = "/booking_trainer", method = RequestMethod.GET)
    public String bookingTicketTrainer(){
        return "index";
    }

}