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

    public List<Revenue> getAllRevenueOfYear(String year){
        return revenueDao.getAllRevenueOfYear(year);
    }

    public List<TicketUser> getDetailRevenueInMonth(int year, int month) {
        return revenueDao.getDetailRevenueInMonth(year,month);
    }
}
