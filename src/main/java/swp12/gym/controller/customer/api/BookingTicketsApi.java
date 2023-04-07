package swp12.gym.controller.customer.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import swp12.gym.common.DataUtil;
import swp12.gym.dao.UsersDao;
import swp12.gym.service.TicketUserService;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

@RestController
public class BookingTicketsApi {

    private final String URL_API = "/customer/booking";
//    @PostMapping(value = "/ticket_user",  produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
//    public String bookingTicketsUser(){
//        //book suscess
//        //Username
//        //
//        return "true";
//    }

    @Autowired
    private UsersDao userDao;

    @Autowired
    private TicketUserService ticketUserService;

    @GetMapping(value = URL_API + "/checkEndDateTicket")
    public ResponseEntity<String> check_end_date(RedirectAttributes redirectAttributes, HttpServletRequest request, Authentication authentication){
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            System.out.println("userName: " + userName);
            long userID = userDao.findIdByUsername(userName);
            System.out.println("userID: " + userID);
//            boolean check = ticketUserService.checkTicketUser(userID);
            LocalDateTime date = ticketUserService.findEndDateTicket(userID);

            String result = null;


//            redirectAttributes.addFlashAttribute("end_date", date);
            if(date != null){
                result = new DataUtil().convertLocalDateTimeToString(date);
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }else{
//                return new ResponseEntity<String>(formattedDateTime,HttpStatus.OK);
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }
//          model.addAttribute("check_end_date", check);
//            redirectAttributes.addFlashAttribute("check_end_date", check);

//            ticketService.createPersonalTicket(id_trainer, price);

        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    //check hội viên có ticket Trainer personal hay chưa
    @GetMapping(value = URL_API + "/checkEndDateTicketTrainerPersonal")
    public ResponseEntity<String> check_end_date_ticket_trainer_personal(RedirectAttributes redirectAttributes, HttpServletRequest request, Authentication authentication){
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            long userID = userDao.findIdByUsername(userName);
            LocalDateTime date = ticketUserService.findEndDateTicketTrainerPersonal(userID);

            String result = null;
            if(date != null){
                result = new DataUtil().convertLocalDateTimeToString(date);
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }else{
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

    }


    //check hội viên có ticket class hay chưa
    @GetMapping(value = URL_API + "/checkEndDateTicketClass")
    public ResponseEntity<String> check_end_date_ticket_class(RedirectAttributes redirectAttributes, HttpServletRequest request, Authentication authentication){
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            System.out.println("userName: " + userName);
            long userID = userDao.findIdByUsername(userName);
            System.out.println("userID: " + userID);

            LocalDateTime date = ticketUserService.findEndDateTicketClass(userID);

            String result = null;
            if(date != null){
                result = new DataUtil().convertLocalDateTimeToString(date);
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }else{
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

    }

}
