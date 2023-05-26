package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.RevenueDao;
import swp12.gym.model.entity.Revenue;
import swp12.gym.model.entity.TicketUser;

import java.util.List;

@Service
public class RevenueServiceImpl {

    @Autowired
    private RevenueDao revenueDao;

    public List<Integer> getAllYearRevenue(){
        return revenueDao.getAllYearRevenue();
    }

    public List<Revenue> getAllRevenueOfYear(){
        return revenueDao.getAllRevenueOfYear();
    }

    public List<Revenue> getDetailRevenueInMonth(int year, int month) {
        return revenueDao.getDetailRevenueInMonth(year,month);
    }

    public List<Revenue> getDetailRevenueYear(int year_int) {
        return revenueDao.getDetailRevenueYear(year_int);
    }

    public List<Revenue> getDetailRevenueInMonthByTicket(int year_int, int month_int) {
        return revenueDao.getDetailRevenueInMonthByTicket(year_int, month_int);
    }

    public List<Revenue> getAllRevenueOfYearByProduct() {
        return revenueDao.getAllRevenueOfYearByProduct();
    }

    public List<Revenue> getDetailRevenueYearByProduct(int year_int) {
        return revenueDao.getDetailRevenueYearByProduct(year_int);
    }

    public List<Revenue> getDetailRevenueInMonthProduct(int year_int, int month_int) {
        return revenueDao.getDetailRevenueInMonthProduct(year_int, month_int);
    }

    public List<Revenue> getDetailRevenueInMonthByProduct(int year_int, int month_int) {
        return revenueDao.getDetailRevenueInMonthByProduct(year_int,month_int);
    }


//    public int getAllRevenueTicketOfYear(int currentYear) {
//        return revenueDao.getAllRevenueTicketOfYear(currentYear);
//    }
}
