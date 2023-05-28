package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Order;
import swp12.gym.model.entity.Role;
import swp12.gym.model.entity.Ticket;
import swp12.gym.service.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminCustomerController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ClassService classService;

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
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("pagination",pagination_value);
            model.addAttribute("status",status);

            return "admin/user/list_user";
        }
    }

    //----------------------view detail customer----------
    @RequestMapping(value = "/customer/detail/{customer_id}/ticket/page={pagination}", method = RequestMethod.GET)
    public String goCustomerDetail(Model model, @PathVariable int customer_id,
                                   @PathVariable String pagination){

        UserDto user = userService.getEmployeeById(customer_id);
        model.addAttribute("user",user);

        int pagination_value = Integer.parseInt(pagination);
        int totalPages = 1;

        int count_row = ticketService.getNumberTicketOfAnCustomer(1, customer_id);
        if(count_row != 0){
            totalPages = (int) Math.ceil((double) count_row / 10);
        }

        if(pagination_value > totalPages){
            return "base/404";
        }else if(pagination_value < 1){
            return "base/404";
        }else {
       List<Ticket> ticket = ticketService.findAddTicketOfAnCustomer(1, customer_id,pagination_value);
            model.addAttribute("ticket",ticket);
            model.addAttribute("count", count_row);
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("pagination",pagination_value);

            return "admin/user/detail_customer";
        }
    }

    @RequestMapping(value = "/customer/detail/{customer_id}/trainer-log/page={pagination}",method = RequestMethod.GET)
    public String goBookingTrainerLog(@PathVariable int customer_id, Model model, @PathVariable String pagination) {
        UserDto user = userService.getEmployeeById(customer_id);
        model.addAttribute("user",user);

        int pagination_value = Integer.parseInt(pagination);
        int totalPages = 1;

        int count_row = ticketService.getNumberTicketOfAnCustomer(2, customer_id);
        if(count_row != 0){
            totalPages = (int) Math.ceil((double) count_row / 10);
        }

        if(pagination_value > totalPages){
            return "base/404";
        }else if(pagination_value < 1){
            return "base/404";
        }else {
            List<Ticket> ticket = ticketService.findAddTicketOfAnCustomer(2, customer_id,pagination_value);
            model.addAttribute("ticket",ticket);
            model.addAttribute("count", count_row);
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("pagination",pagination_value);

            return "admin/user/trainer_log";
        }
    }

    @RequestMapping(value = "/customer/detail/{customer_id}/class-log/page={pagination}",method = RequestMethod.GET)
    public String goBookingClassCustomer(@PathVariable int customer_id, Model model, @PathVariable String pagination) {
        UserDto user = userService.getEmployeeById(customer_id);
        model.addAttribute("user",user);


        int pagination_value = Integer.parseInt(pagination);
        int totalPages = 1;

        int count_row = classService.getNumberClassOfAnCustomer(customer_id);
        if(count_row != 0){
            totalPages = (int) Math.ceil((double) count_row / 10);
        }

        if(pagination_value > totalPages){
            return "base/404";
        }else if(pagination_value < 1){
            return "base/404";
        }else {
            List<ClassDto> classDtos = classService.findAllClassOfAnUserById(customer_id);
            model.addAttribute("classDtos",classDtos);
            model.addAttribute("count", count_row);
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("pagination",pagination_value);

            return "admin/user/class_log";
        }
    }

    @RequestMapping(value = "/customer/detail/{customer_id}/order-log/page={pagination}",method = RequestMethod.GET)
    public String goProductOrderLog(@PathVariable int customer_id, Model model, @PathVariable String pagination) {
        UserDto user = userService.getEmployeeById(customer_id);
        model.addAttribute("user",user);

        int pagination_value = Integer.parseInt(pagination);
        int totalPages = 1;

        int count_row = orderService.getNumberOrderOfAnCustomer(customer_id);
        if(count_row != 0){
            totalPages = (int) Math.ceil((double) count_row / 10);
        }

        if(pagination_value > totalPages){
            return "base/404";
        }else if(pagination_value < 1){
            return "base/404";
        }else {
            List<Order> logOrder = orderService.findAllOrderOfAnUserById(customer_id);
            model.addAttribute("logOrder",logOrder);
            model.addAttribute("count", count_row);
            model.addAttribute("totalPages",totalPages);
            model.addAttribute("pagination",pagination_value);

            return "admin/user/order_log";
        }
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