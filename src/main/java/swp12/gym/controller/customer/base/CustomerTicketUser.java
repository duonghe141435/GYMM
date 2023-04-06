package swp12.gym.controller.customer.base;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import swp12.gym.dao.TicketUserDao;
import swp12.gym.dao.UsersDao;
import swp12.gym.service.TicketUserService;

@Controller
@RequestMapping("/CustomerUser")
public class CustomerTicketUser {

    @Autowired
    private TicketUserService ticketUserService;

    @Autowired
    private TicketUserDao ticketUserDao;

    @Autowired
    private UsersDao userDao;

//    @RequestMapping(value = "/check-ticket-user",method = RequestMethod.GET)
//    public Boolean checkTicketUser(RedirectAttributes redirectAttributes, Authentication authentication){
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        String userName = userDetails.getUsername();
//        long userID = userDao.findIdByUsername(userName);
//        boolean check = ticketUserService.checkTicketUser(userID);
////        model.addAttribute("check_end_date", check);
//        redirectAttributes.addFlashAttribute("check_end_date", check);
//
//        return "redirect:/customer/home";
//    }

    @RequestMapping(value = "/saveTickerUser", method = RequestMethod.GET)
    public String goSaveTickerUser(@RequestParam(value = "id") int id, @RequestParam(value = "date") String date, Model model, Authentication authentication){

        System.out.println("date: " + date);
        System.out.println("id: " + id);

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userName = userDetails.getUsername();
        long userID = userDao.findIdByUsername(userName);

        boolean check = ticketUserService.bookTicket(id, userID, date);
        System.out.println("check: " + check);
        return "redirect:/customer/home";
    }

    @RequestMapping(value = "/saveTickerUserClass", method = RequestMethod.GET)
    public String goSaveTickerUserClass(@RequestParam(value = "id") int id, Model model, Authentication authentication){

        System.out.println("id: " + id);

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userName = userDetails.getUsername();
        long userID = userDao.findIdByUsername(userName);

//        boolean check = ticketUserService.bookTicket(id, userID);
        return "redirect:/customer/home";
    }
}
