package swp12.gym.controller.admin.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.ClassDto;
import swp12.gym.model.entity.Attendance;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.Time;
import swp12.gym.model.entity.User;
import swp12.gym.service.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminClassController {

    @Autowired
    private UserService userService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ClassService classService;
    @Autowired
    private TimeService timeService;
    @Autowired
    private AttendanceService attendanceService;

    // ----------------------------------------------------------------
    @RequestMapping(value = "/class/page={pagination}-status={status}",method = RequestMethod.GET)
    public String goClassPage(@PathVariable String pagination,
                              @PathVariable String status, Model model) {

        try {
            int status_num = Integer.parseInt(status);
            int pagination_value = Integer.parseInt(pagination);
            int totalPages = 1;
            int count_row = classService.getNumberClassInSystemAdmin(status_num);
            if(count_row != 0){
                totalPages = (int) Math.ceil((double) count_row / 8);
            }
            if(pagination_value > totalPages){
                return "base/404";
            }else if(pagination_value < 1) {
                return "base/404";
            }else {
                List<ClassDto> class_list = classService.findClassAllPagination(pagination_value, status);

                model.addAttribute("count", count_row);
                model.addAttribute("status", status);
                model.addAttribute("totalPages",totalPages);
                model.addAttribute("pagination",pagination_value);
                model.addAttribute("class_list", class_list);
                return "admin/class/class_list";
            }
        }
        catch (Exception e){
            e.printStackTrace();
            return "base/404";
        }


    }

    @RequestMapping(value = "/class/new-class",method = RequestMethod.GET)
    public String createNewClass(Model model) {
        List<User> trainer = userService.findAllTrainer();
        List<Ticket> tickets = ticketService.findAllTicketClass();
        List<Time> times = timeService.findAll();

        model.addAttribute("tickets", tickets);
        model.addAttribute("trainer", trainer);
        model.addAttribute("times", times);
        return "admin/class/create_class";
    }

    @RequestMapping(value = "/detail-class/{class_id}",method = RequestMethod.GET)
    public String goDetailCLass(@PathVariable int class_id, Model model) {
        //detail class
        ClassDto detail_class = classService.findDetailAnClass(class_id);
        model.addAttribute("classDto", detail_class);
        //list user of class
        List<User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
        model.addAttribute("list_user_of_class", list_user_of_class);
        String jsonDetailClass = new Gson().toJson(detail_class);
        model.addAttribute("jsonDetailClass",jsonDetailClass);

        //list attendance of class
        List<Attendance> list_attendance = attendanceService.listAttendance(class_id);
        String jsonListAttendance = new Gson().toJson(list_attendance);
        model.addAttribute("jsonListAttendance",jsonListAttendance);
        System.out.println("list_attendance: " + list_attendance);

        return "admin/class/detail_class";
    }

    // ----------------------------------------------------------------
}
