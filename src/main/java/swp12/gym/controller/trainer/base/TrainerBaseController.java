package swp12.gym.controller.trainer.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp12.gym.dto.ClassDto;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Attendance;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.User;
import swp12.gym.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/trainer")
public class TrainerBaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private ClassService classService;
    @Autowired
    private TrainerService trainerService;
    @Autowired
    private ProductService productService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private AttendanceService attendanceService;

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String homeTrainer(Model model, Authentication authentication) {

        String email = ((UserDetails) authentication.getPrincipal()).getUsername();
//        List<ClassDto> class_list = classService.findClassAllOfAnTrainer(email);

        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);

//        model.addAttribute("class_list", class_list);
        return "trainer/index_trainer";
    }

    @RequestMapping(value = "/show-list-personal",method = RequestMethod.GET)
    public String goListPersonal(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        List<TicketTrainerDto> allTicketTrainer = ticketService.findAllTicketTrainer();

        model.addAttribute("tickets", ticket);
        model.addAttribute("allTicketTrainer", allTicketTrainer);
        return "trainer/list_personal";
    }

    @RequestMapping(value = "/show-list-class",method = RequestMethod.GET)
    public String goListClass(Model model, HttpSession s) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        List<TicketTrainerDto> allTicketClass = ticketService.findAllTicketClassForCustomer();
        model.addAttribute("allTicketClass", allTicketClass);
        return "trainer/list_class";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexTrainer(Model model, Authentication authentication) {

//        String email = ((UserDetails) authentication.getPrincipal()).getUsername();
//        List<ClassDto> class_list = classService.findClassAllOfAnTrainer(email);
//        model.addAttribute("class_list", class_list);
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);


        return "trainer/index_trainer";
    }

    @RequestMapping(value = "/manage_class",method = RequestMethod.GET)
    public String goManageClass(Model model, Authentication authentication) {

        String email = ((UserDetails) authentication.getPrincipal()).getUsername();
        List<ClassDto> class_list = classService.findClassAllOfAnTrainer(email);
        model.addAttribute("class_list", class_list);
        return "trainer/manage_class";
    }

    @RequestMapping(value = "/class-attendance/{id}",method = RequestMethod.GET)
    public String goAttendanceOfTrainer(Model model, @PathVariable int id, Authentication authentication) {
        return "trainer/trainer_attendance";
    }

    @RequestMapping(value = "/class/{id}",method = RequestMethod.GET)
    public String goDetailClassOfTrainer(Model model, @PathVariable int id) {
        //Thông tin lớp
        ClassDto classDto = classService.findDetailAnClass(id);
        model.addAttribute("classDto", classDto);
        //Danh sách hội viên
        List<User> list_user_of_class = userService.findAllUserOfAnClass(id);
        model.addAttribute("list_user_of_class", list_user_of_class);

        String jsonDetailClass = new Gson().toJson(classDto);
        model.addAttribute("jsonDetailClass",jsonDetailClass);

        //list attendance of class
        List<Attendance> list_attendance = attendanceService.listAttendance(id);

        String jsonListAttendance = new Gson().toJson(list_attendance);
        model.addAttribute("jsonListAttendance",jsonListAttendance);
        System.out.println("list_attendance: " + list_attendance);

        return "trainer/class_detail";
    }

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);
        System.out.println("productDtos: " + productDtos);
        return "trainer/view_product";
    }

//    @RequestMapping(value = "/attendance-an-class/{class_id}",method = RequestMethod.GET)
//    public String goAttendance(@PathVariable int class_id, Model model) {
//        List<swp12.gym.model.entity.User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
//        model.addAttribute("list_user_of_class", list_user_of_class);
//        System.out.println(list_user_of_class);
//
//        return "customer/index_customer";
//    }

    @RequestMapping(value = "/attendance-an-class/{class_id}",method = RequestMethod.GET)
    public String goAttendance(@PathVariable int class_id, Model model) {
        List<User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
        model.addAttribute("list_user_of_class", list_user_of_class);
        return "trainer/trainer_attendance";
    }

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileCustomer(Model model, HttpSession s) {
        UserDto user = userService.getCustomerByEmail(s.getAttribute("display_email").toString());
        model.addAttribute("user",user);
        return "trainer/profile_user";
    }

    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForTrainer() {
        return "trainer/change_pass";
    }

    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityOfTrainer() {
        return "trainer/change_pass";
    }

    @RequestMapping(value = "/checkAttendance",method = RequestMethod.GET)
    public ResponseEntity<String> checkDateAttendanceClass(HttpServletRequest request) {
        try{
            System.out.println("Class id: " + request.getParameter("_classID"));
            int class_id = Integer.parseInt(request.getParameter("_classID"));
//            ClassDto classDto = classService.findDetailAnClass(class_id);
            String results = attendanceService.checkDateAttendanceClass(class_id);
            return new ResponseEntity<String>(results, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

}
