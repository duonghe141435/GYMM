package swp12.gym.controller.admin.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TrainerDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.User;
import swp12.gym.service.ClassService;
import swp12.gym.service.TicketService;
import swp12.gym.service.TrainerService;
import swp12.gym.service.UserService;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminTicketController {

    @Autowired
    private UserService userService;
    @Autowired
    private TrainerService trainerService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ClassService classService;

    //Xem tất cả các vé vào cửa - done
    @RequestMapping(value = "/ticket/page={pagination}-type={type}",method = RequestMethod.GET)
    public String goTicketDoor(@PathVariable String pagination,@PathVariable String type, Model model){


        try {
            //kiểm tra có phải là số int ko?
            int status_num = Integer.parseInt(type);
            int pagination_value = Integer.parseInt(pagination);
            int totalPages = 1;
            int count_row = ticketService.getNumberTicketInSystemPage(status_num);
            if(count_row != 0){
                totalPages = (int) Math.ceil((double) count_row / 5);
            }
            if(pagination_value > totalPages){
                return "base/404";
            }else if(pagination_value < 1){
                return "base/404";
            }else {
                List<TicketDto> tickets = ticketService.findAllOfAdmin(pagination_value, status_num);
                model.addAttribute("tickets", tickets);
                model.addAttribute("count", count_row);
                model.addAttribute("type", type);
                model.addAttribute("totalPages",totalPages);
                model.addAttribute("pagination",pagination_value);

                return "admin/ticket/list_ticket";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "base/404";
        }
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
}
