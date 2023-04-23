package swp12.gym.controller.employee.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;
import swp12.gym.service.OrderService;
import swp12.gym.service.ProductService;
import swp12.gym.service.UserService;

import java.util.List;


@Controller
@RequestMapping("/employee")
public class EmployeeBaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    //done
    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForEmployee() {
        return "employee/change_pass";
    }

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexEmployee(Model model) {
        //man index employee se la man ban hang
        //Ngoai ra employee con co DK khach hang tai quay
        return "employee/index_employee";
    }

    @RequestMapping(value = "/notify",method = RequestMethod.GET)
    public String goShowAllNotify() {
        return "employee/notify";
    }




    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityAdmin() {
        return "employee/change_pass";
    }

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileEmployee(Model model, Authentication authentication) {
        UserDto user = userService.getUserByEmail(((UserDetails) authentication.getPrincipal()).getUsername());
        model.addAttribute("user",user);
        return "employee/profile_user";
    }

    @RequestMapping(value = "/your-profile/update",method = RequestMethod.GET)
    public String updateEmployee(@ModelAttribute("user") User user, Model model) {
        System.out.println(user.toString());
        return "employee/index_employee";
    }

    @RequestMapping(value = "/order-product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);
        List<UserDto> customers = userService.findAllCustomer();
        //${customers.u_id} là user_ID
        List<User> trainers = userService.findAllTrainer();
        //${trainers.u_enable} là user_ID
        String jsonCustomer = new Gson().toJson(customers);
        String jsonTrainer = new Gson().toJson(trainers);
        model.addAttribute("jsonCustomer",jsonCustomer);
        model.addAttribute("jsonTrainer",jsonTrainer);
        int order_id = orderService.getIdOrder();
        System.out.println("order_id" + order_id);


        return "employee/order-product";
    }
}
