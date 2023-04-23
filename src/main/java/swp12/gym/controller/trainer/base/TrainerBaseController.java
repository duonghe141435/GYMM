package swp12.gym.controller.trainer.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp12.gym.dto.ClassDto;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;
import swp12.gym.service.*;

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

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexTrainer(Model model, Authentication authentication) {

        String email = ((UserDetails) authentication.getPrincipal()).getUsername();
        List<ClassDto> class_list = classService.findClassAllOfAnTrainer(email);

        model.addAttribute("class_list", class_list);
        return "trainer/index_trainer";
    }

    @RequestMapping(value = "/class-attendance/{id}",method = RequestMethod.GET)
    public String goAttendanceOfTrainer(Model model, @PathVariable int id, Authentication authentication) {
        return "trainer/trainer_attendance";
    }

    @RequestMapping(value = "/class/{id}",method = RequestMethod.GET)
    public String goDetailClassOfTrainer(Model model, @PathVariable int id) {
        //Thông tin lớp
//        ClassDto classDto = classService.findDetailAnClass(id);
        //Danh sách hội viên
        return "trainer/class_detail";
    }

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);

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

}
