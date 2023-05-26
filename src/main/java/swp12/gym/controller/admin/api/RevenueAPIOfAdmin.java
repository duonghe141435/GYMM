package swp12.gym.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.model.entity.Revenue;
import swp12.gym.service.RevenueServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class RevenueAPIOfAdmin {

    @Autowired
    private RevenueServiceImpl revenueService;

    private final String URL_API = "/admin/revenue-management";
    private final String URL_API_2 = "/admin/revenue-product-management";

    @PostMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> viewRevenueOfMonth(HttpServletRequest request) {
        try {
            String year = request.getParameter("year");
            String month = request.getParameter("month");
            String type = request.getParameter("type");

            int month_int = Integer.parseInt(month);
            int year_int = Integer.parseInt(year);

            List<Revenue> revenue = null;

            if(month_int == 0){
                revenue = revenueService.getDetailRevenueYear(year_int);
            }else if (month_int > 0 && type.equalsIgnoreCase("day")){
                revenue = revenueService.getDetailRevenueInMonth(year_int, month_int);
            }else if(month_int > 0 && type.equalsIgnoreCase("ticket")){
                revenue = revenueService.getDetailRevenueInMonthByTicket(year_int, month_int);
            }
            return new ResponseEntity<List<Revenue>>(revenue, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = URL_API +"/{year}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> viewRevenueOfYear(@PathVariable String year) {
        try {
            int year_int = Integer.parseInt(year);
            List<Revenue> revenue = null;
            if(year_int < 0){
                revenue = null;
            }else if (year_int == 0){
                revenue = revenueService.getAllRevenueOfYear();
            }else {
                revenue = revenueService.getDetailRevenueYear(year_int);
            }

            return new ResponseEntity<List<Revenue>>(revenue, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = URL_API_2, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> viewRevenueOfMonthProduct(HttpServletRequest request) {
        try {
            String year = request.getParameter("year");
            String month = request.getParameter("month");
            String type = request.getParameter("type");

            int month_int = Integer.parseInt(month);
            int year_int = Integer.parseInt(year);

            List<Revenue> revenue = null;

            if(month_int == 0){
                revenue = revenueService.getDetailRevenueYearByProduct(year_int);
            }else if (month_int > 0 && type.equalsIgnoreCase("day")){
                revenue = revenueService.getDetailRevenueInMonthProduct(year_int, month_int);
            }else if(month_int > 0 && type.equalsIgnoreCase("ticket")){
                revenue = revenueService.getDetailRevenueInMonthByProduct(year_int, month_int);
            }
            return new ResponseEntity<List<Revenue>>(revenue, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = URL_API_2 +"/{year}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> viewRevenueOfYearProduct(@PathVariable String year) {
        try {
            int year_int = Integer.parseInt(year);
            List<Revenue> revenue = null;
            if(year_int < 0){
                revenue = null;
            }else if (year_int == 0){
                revenue = revenueService.getAllRevenueOfYearByProduct();
            }else {
                revenue = revenueService.getDetailRevenueYearByProduct(year_int);
            }

            return new ResponseEntity<List<Revenue>>(revenue, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

}
