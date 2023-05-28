package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.dto.OrderDto;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoAdmin;
import swp12.gym.model.entity.LogUser;
import swp12.gym.model.entity.Role;
import swp12.gym.model.entity.Ticket;
import swp12.gym.service.OrderService;
import swp12.gym.service.RoleService;
import swp12.gym.service.TicketService;
import swp12.gym.service.UserService;
import swp12.gym.common.FileUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private TicketService ticketService;

    @RequestMapping(value = "/customer/page={pagination}-status={status}", method = RequestMethod.GET)
    public String goListCustomer(@PathVariable String pagination,@PathVariable String status, Model model){

        int status_num = Integer.parseInt(status);
        int pagination_value = Integer.parseInt(pagination);
        int totalPages = 1;
        int count_employee = userService.getNumberUserInSystem(status_num);
        if(count_employee != 0){
            totalPages = (int) Math.ceil((double) count_employee / 10);
        }
        if(pagination_value > totalPages){
            return "base/404";
        }else if(pagination_value < 1){
            return "base/404";
        }else {
            List<UserDto> users = userService.findAllCustomer(status_num, pagination_value);
            model.addAttribute("users",users);
            model.addAttribute("count", count_employee);
            model.addAttribute("status", status);
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("pagination",pagination_value);
            model.addAttribute("status",status);

            return "admin/user/list_user";
        }
    }

    //----------------------view detail customer----------
    @RequestMapping(value = "/customer/detail/{customer_id}", method = RequestMethod.GET)
    public String goCustomerDetail(Model model, @PathVariable int customer_id){

        UserDto user = userService.getEmployeeById(customer_id);
        model.addAttribute("user",user);

        List<Ticket> ticket = ticketService.findAddTicketOfAnCustomer(1, customer_id);
        model.addAttribute("ticket",ticket);
        return "admin/user/detail_customer";
    }

    @RequestMapping(value = "/users/new-user", method = RequestMethod.GET)
    public String goCreateUser(Model model) {
        List<Role> roles = roleService.findAll();

        model.addAttribute("roles", roles);
        model.addAttribute("user", new UserDto());
        return "admin/user/create_user";
    }




    @RequestMapping(value = "/profile-customer/{userID}",method = RequestMethod.GET)
    public String goDetailProfileCustomer(Model model,  @PathVariable int userID){
        UserDto user = userService.getEmployeeById(userID);
        model.addAttribute("user",user);
        return "admin/user/update_customer";
    }




}