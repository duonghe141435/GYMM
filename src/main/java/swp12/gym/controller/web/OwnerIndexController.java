package swp12.gym.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OwnerIndexController {

    //Quan ly bao cao - bao cao nhan vien -> quan ly cham cong, quan ly PT, lich su tac dong, bao cao thong ke lop hop cua huan luan vien
    //Setting -> thiet lap nhan vien, quan ly nhan vien, quan ly dich vu - gia san pham, tao goi dich vu, quan ly su kien(discount, sale),
    // quan ly kho hang - nhap hang, tra hang, bao cao hong mat san pham

    @RequestMapping(value = "/owner/dashboard", method = RequestMethod.GET)
    public String goDashboardOwner(){
        return "admin/dashboard_admin";
    }


}
