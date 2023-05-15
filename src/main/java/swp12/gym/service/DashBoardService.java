package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.DashBoardDao;

@Service
public class DashBoardService {
    @Autowired
    private DashBoardDao dashBoardDao;

    public int TotalRevenueOfMonth(int year, int month) {
        return dashBoardDao.TotalRevenueOfMonth(year, month);
    }

    public int TotalRevenueOfThisYear(int year) {
        return dashBoardDao.TotalRevenueOfThisYear(year);
    }

    public int TotalRevenueOfDay(String date) {
        return dashBoardDao.TotalRevenueOfDay(date);
    }

    public int getNumberAccountNew(String date){
        return dashBoardDao.getNumberAccountNew(date);
    }

//    public int AllProduct() {
//    }
}
