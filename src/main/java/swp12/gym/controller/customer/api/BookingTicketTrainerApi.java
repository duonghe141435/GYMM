package swp12.gym.controller.customer.api;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;
import swp12.gym.service.PersonalTrainerDetailService;
import swp12.gym.service.TrainerService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;

@RestController
public class BookingTicketTrainerApi {
    private final String URL_API = "/customer/BookingTicketTrainer";

    @Autowired
    private TrainerService trainerService;
    @Autowired
    private UsersDao userDao;
    @Autowired
    private PersonalTrainerDetailService personalTrainerDetailService;

    @RequestMapping(value = URL_API, method = RequestMethod.GET)
    public ResponseEntity<List<UserDto>> find_Trainer_Ticket_Personal(@RequestParam(value = "ids") int ticket_id){
        try{
            List<UserDto> trainerPersonal = trainerService.findAllTrainerPersonal(ticket_id);
            return new ResponseEntity<List<UserDto>>(trainerPersonal, HttpStatus.OK);
//            redirectAttributes.addFlashAttribute("trainerPersonal", trainerPersonal);
//            return new ResponseEntity<String>( "1", HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<UserDto>>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = URL_API + "/bookSchedule", method = RequestMethod.POST)
    public ResponseEntity<String> bookSchedule(HttpServletRequest request, Authentication authentication){
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            int userID = userDao.findIdByUsername(userName);

            int personal_trainer_id = parseInt(request.getParameter("_personal_trainer_id"));
            int time_id = parseInt(request.getParameter("_time_id"));

            Gson gson = new Gson();
            String list = request.getParameter("_date_book_schedule");
            JsonElement jsonElement = gson.fromJson(list, JsonElement.class);
            JsonArray jsonArray = jsonElement.getAsJsonArray();

            List<String> date = new ArrayList<String>();
            for (JsonElement elem : jsonArray) {
                date.add(elem.getAsString());
            }
            int count = personalTrainerDetailService.checkPersonalTrainerDetailForBookSchedule(userID, date);
            if (count == 0){
                personalTrainerDetailService.insertPersonalTrainerDetail(date, 1, personal_trainer_id, time_id, userID);
                return new ResponseEntity<String>("",HttpStatus.OK);
            }else {
                return new ResponseEntity<String>(""+count,HttpStatus.OK);
            }
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}
