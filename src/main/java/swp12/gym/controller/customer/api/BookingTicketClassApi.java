package swp12.gym.controller.customer.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.ClassDto;
import swp12.gym.service.TicketService;
import swp12.gym.service.TrainerService;

import java.util.List;

@RestController
public class BookingTicketClassApi {
    private final String URL_API = "/customer/BookingTicketClass";

    @Autowired
    private TrainerService trainerService;

    @Autowired
    private UsersDao userDao;

    @Autowired
    private TicketService ticketService;

    @RequestMapping(value = URL_API + "/Check_ticket_exists", method = RequestMethod.GET)
    public ResponseEntity<String> checkTicketExists(@RequestParam(value = "classID") int classID, Authentication authentication){
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            int userID = userDao.findIdByUsername(userName);
            Boolean checkExists = ticketService.checkClassExist(userID, classID);
            if (checkExists == true){
                return new ResponseEntity<String>("true", HttpStatus.OK);
            }else {
                return new ResponseEntity<String>("", HttpStatus.OK);
            }

        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = URL_API, method = RequestMethod.GET)
    public ResponseEntity<List<ClassDto>> find_Trainer_Ticket_Class(@RequestParam(value = "ids") int ticket_id){
        try{
            List<ClassDto> ticket_class = trainerService.findAllTrainerClass(ticket_id);
            return new ResponseEntity<List<ClassDto>>(ticket_class, HttpStatus.OK);
//            return new ResponseEntity<List<ClassDto>>(ticket_class, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<ClassDto>>(HttpStatus.BAD_REQUEST);
        }
    }
}
