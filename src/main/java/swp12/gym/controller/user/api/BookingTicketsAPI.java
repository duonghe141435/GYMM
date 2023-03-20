package swp12.gym.controller.user.api;

import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/user/booking")
public class BookingTicketsAPI {

    @PostMapping(value = "/ticket_user",  produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public String bookingTicketsUser(){
        //book suscess
        //Username
        //
        return "true";
    }
}
