package swp12.gym.controller.customer.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;
import swp12.gym.service.TrainerService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class BookingTicketTrainerApi {
    private final String URL_API = "/customer/BookingTicketTrainer";

    @Autowired
    private TrainerService trainerService;

    @RequestMapping(value = URL_API, method = RequestMethod.GET)
    public ResponseEntity<List<UserDto>> find_Trainer_Ticket_Personal(@RequestParam(value = "ids") int ticket_id){
        try{
            System.out.println("API" + ticket_id);
            List<UserDto> trainerPersonal = trainerService.findAllTrainerPersonal(ticket_id);
            return new ResponseEntity<List<UserDto>>(trainerPersonal, HttpStatus.OK);
//            redirectAttributes.addFlashAttribute("trainerPersonal", trainerPersonal);
//            return new ResponseEntity<String>( "1", HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<UserDto>>(HttpStatus.BAD_REQUEST);
        }
    }
}
