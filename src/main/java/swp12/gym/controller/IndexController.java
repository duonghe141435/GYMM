package swp12.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import swp12.gym.common.DataUtil;
import swp12.gym.model.entity.Ticket;
import swp12.gym.service.ClassService;
import swp12.gym.service.TicketService;

import javax.annotation.PostConstruct;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private ClassService classService;

    @PostConstruct
    public void Test() {
        System.out.println("Kiểm tra ngày hiện tại");
        System.out.println(dataUtil.getDateNowToString());
        //kiểm tra class có hôm này có lớp start vào ngày này hay không
        classService.updateStatusClassForStartDate(dataUtil.getDateNowToString());
        classService.updateStatusClassForEndDate(dataUtil.getDateNowToString());
    }

    //Home user
    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String indexCustomer(Model model) {
        List<Ticket> ticket = ticketService.findAll();
        model.addAttribute("tickets", ticket);
        return "customer/index_customer";
    }

}
