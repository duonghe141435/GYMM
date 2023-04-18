package swp12.gym.controller.admin.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.Time;
import swp12.gym.model.entity.User;
import swp12.gym.service.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminBaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TimeService timeService;
    @Autowired
    private ClassService classService;
    @Autowired
    private TrainerService trainerService;


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
    public ModelAndView goDetailTicket(@PathVariable int id)
    {
        ModelAndView view = new ModelAndView("admin/ticket/detail_ticket");


        int number_order = ticketService.getTotalNumberOrderOfTicket(id);;
        int number_order_today = ticketService.getTotalNumberOrderOfTicketToday(id);
        List<Map<Integer, Integer>> data = null;
        Ticket ticket = ticketService.findAnTicket(id);
        data = ticketService.getDataOfAnTicket(id);

        if(ticket.getTt_id() == 2){
            List<TrainerDto> dtoList = trainerService.findAllTrainerByTicket(id);
            view.addObject("dtoList",dtoList);
        }
        if(ticket.getTt_id() == 3){
            List<ClassDto> classDtos = classService.findAllClassOfAnTicket(id);
            view.addObject("classDtos",classDtos);
        }

        String jsonData = new Gson().toJson(data); // chuyển đổi sang chuỗi JSON

        view.addObject("chartData",jsonData);
        view.addObject("number_order_today",number_order_today);
        view.addObject("number_order",number_order);
        view.addObject("ticket",ticket);
        return view;
    }

    @RequestMapping(value = "/products/save",method = RequestMethod.GET)
    public String addProduct(Model model){
        return "admin/product/list_product";
    }


    // ----------------------------------------------------------------
    @RequestMapping(value = "/class",method = RequestMethod.GET)
    public String goCLassPage(Model model) {
        List<ClassDto> class_list = classService.findAll();

        model.addAttribute("class_list", class_list);
        return "admin/class/class_list";
    }

    @RequestMapping(value = "/detail-class/{class_id}",method = RequestMethod.GET)
    public String goDetailCLass(@PathVariable int class_id, Model model) {
        List<ClassDto> detail_class = classService.findDetailAnClass(class_id);
        model.addAttribute("detail_class", detail_class);
        List<User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
        model.addAttribute("list_user_of_class", list_user_of_class);
        return "";
    }
}
