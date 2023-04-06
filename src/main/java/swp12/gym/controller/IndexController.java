package swp12.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import swp12.gym.dto.ProductDto;
import swp12.gym.service.ProductService;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
    public String loginPage(@RequestParam(required = false) String message, Model model) {

        if (message != null && !message.trim().equals("")){
            if (message.equals("session_error")) {
                model.addAttribute("message", "(*) Lỗi thông tin.<br>Vui lòng đăng nhập lại!");
            }

            if (message.equals("wrong_account")) {
                model.addAttribute("message", "Some thing wrong when you logging!");
            }

            if (message.equals("wrong_account")) {
                model.addAttribute("message", "Some thing wrong when you logging!");
            }
        }
        System.out.println("dang dang nhap");
        return "base/homepage";
//        return "base/homepage";
    }

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public String productPage(Model model) {
        List<ProductDto> productDtos = productService.findAll();
        model.addAttribute("productDtos", productDtos);
        return "customer/product";
    }

}
