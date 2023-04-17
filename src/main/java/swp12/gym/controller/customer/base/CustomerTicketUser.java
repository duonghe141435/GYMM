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
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.service.TicketService;
import swp12.gym.service.TicketUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static java.lang.Integer.parseInt;
import static java.lang.Long.parseLong;

@Controller
@RequestMapping("/CustomerUser")
public class CustomerTicketUser {

    @Autowired
    private TicketUserService ticketUserService;

    @Autowired
    private TicketUserDao ticketUserDao;

    @Autowired
    private TicketService ticketService;

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

//    @RequestMapping(value = "/saveTickerUser", method = RequestMethod.GET)
//    public String goSaveTickerUser(@RequestParam(value = "ticket_id") int ticket_id, @RequestParam(value = "end_date_ticket") String end_date_ticket, @RequestParam(value = "price") int price, @RequestParam(value = "ticket_pt_id") int ticket_pt_id,
//                                   @RequestParam(value = "end_date_ticket_personal") String end_date_ticket_personal,@RequestParam(value = "class_or_personal_id") int class_or_personal_id, Model model, Authentication authentication){
//        System.out.println("save");
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        String userName = userDetails.getUsername();
//        long userID = userDao.findIdByUsername(userName);
//        if (ticket_id != 0) {
//            ticketUserService.bookTicket(ticket_id, userID, end_date_ticket, 0);
//        }
//        if (ticket_pt_id != 0){
//            ticketUserService.bookTicket(ticket_pt_id, userID, end_date_ticket_personal, price);
//            long id = ticketUserService.findIDTicketUser();
//            ticketUserService.insertUserPersonal(userID, class_or_personal_id, id);
//        }
//        return "redirect:/customer/home";
//    }

    @RequestMapping(value = "/saveTickerUser", method = RequestMethod.POST)
    public String goSaveTickerUser(HttpServletRequest request, Authentication authentication){
        long ticket_id = parseLong(request.getParameter("_ticket_id"));
        String end_date_ticket = request.getParameter("_end_date_ticket");
        long ticket_pt_id = parseLong(request.getParameter("_ticket_pt_id"));

        int price_ticket_pt = parseInt(request.getParameter("_price_ticket_pt"));
        int personal_trainer_id = parseInt(request.getParameter("_personal_trainer_id"));
        String end_date_ticket_personal = request.getParameter("_end_date_ticket_personal");
        long ticket_class_id = parseLong(request.getParameter("_ticket_class_id"));
        int price_ticket_class = parseInt(request.getParameter("_price_ticket_class"));
        int class_id = parseInt(request.getParameter("_class_id"));


        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userName = userDetails.getUsername();
        long userID = userDao.findIdByUsername(userName);
        if (ticket_id != 0) {
            ticketUserService.bookTicket(ticket_id, userID, end_date_ticket, 0);
        }
        if (ticket_pt_id != 0){
            ticketUserService.bookTicket(ticket_pt_id, userID, end_date_ticket_personal, price_ticket_pt);
            long id = ticketUserService.findIDTicketUser();
            ticketUserService.insertUserPersonal(userID, personal_trainer_id, id);
        }
        if (ticket_class_id != 0){
            ticketUserService.bookTicket(ticket_class_id, userID, "", price_ticket_class);
            long id = ticketUserService.findIDTicketUser();
            ticketUserService.insertUserClass(userID, class_id, id);
        }
        return "redirect:/customer/home";
    }

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String findTicketsOfUser(Model model, Authentication authentication){
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String userName = userDetails.getUsername();
        int userID = userDao.findIdByUsername(userName);
        List<TicketUser> allTicketOfUser = ticketService.findTicketsOfUser(userID);
        model.addAttribute("allTicketOfUser", allTicketOfUser);
        return "customer/cart";
    }


//    @RequestMapping(value = "/saveTickerUserClass", method = RequestMethod.GET)
//    public String goSaveTickerUserClass(@RequestParam(value = "id") int id, Model model, Authentication authentication){
//
//        System.out.println("id: " + id);
//
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        String userName = userDetails.getUsername();
//        long userID = userDao.findIdByUsername(userName);
//
////        boolean check = ticketUserService.bookTicket(id, userID);
//        return "redirect:/customer/home";
//    }
}
