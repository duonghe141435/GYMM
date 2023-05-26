package swp12.gym.controller.admin.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import swp12.gym.common.DataUtil;
import swp12.gym.common.FileUtil;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Revenue;
import swp12.gym.model.entity.Role;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.service.RevenueServiceImpl;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/revenue")
public class AdminRevenueController {

    @Autowired
    private RevenueServiceImpl revenueService;
    @Autowired
    private DataUtil dataUtil;

    // ----------------------------------------------------------------
    @RequestMapping(value = "/ticket",method = RequestMethod.GET)
    public String goViewRevenueTicket(Model model) {
        List<Integer> year = revenueService.getAllYearRevenue();
//        int total_year = revenueService.getAllRevenueTicketOfYear(dataUtil.getCurrentYear());
        List<Revenue> revenues = revenueService.getAllRevenueOfYear();
        model.addAttribute("revenues", revenues);
        model.addAttribute("year", year);
//        model.addAttribute("total_year", total_year);

        return "admin/revenue/revenue_ticket";
    }

    // ----------------------------------------------------------------
    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String goViewRevenueProduct(Model model) {
        List<Integer> year = revenueService.getAllYearRevenue();
        List<Revenue> revenues = revenueService.getAllRevenueOfYearByProduct();
        model.addAttribute("revenues", revenues);
        model.addAttribute("year", year);
        return "admin/revenue/revenue_product";
    }
}
