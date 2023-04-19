package swp12.gym.controller.trainer.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp12.gym.service.*;





@Controller
@RequestMapping("/trainer")
public class TrainerBaseController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String indexCustomer(Model model) {

        return "trainer/index_trainer";
    }

//    @RequestMapping(value = "/attendance-an-class/{class_id}",method = RequestMethod.GET)
//    public String goAttendance(@PathVariable int class_id, Model model) {
//        List<swp12.gym.model.entity.User> list_user_of_class = userService.findAllUserOfAnClass(class_id);
//        model.addAttribute("list_user_of_class", list_user_of_class);
//        System.out.println(list_user_of_class);
//
//        return "customer/index_customer";
//    }

    @RequestMapping(value = "/attendance-an-class",method = RequestMethod.GET)
    public String goAttendance(Model model) {
//        List<swp12.gym.model.entity.User> list_user_of_class = userService.findAllUserOfAnClass(7);
//        model.addAttribute("list_user_of_class", list_user_of_class);
//        System.out.println(list_user_of_class);
        System.out.println("test");

        return "customer/attendance";
    }


}
