package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.CheckInDao;
import swp12.gym.dto.CheckInDto;
import swp12.gym.model.entity.CheckIn;

import java.util.List;

@Service
public class CheckInServiceImpl implements CheckInService{

    @Autowired
    private CheckInDao checkInDao;

    public String checkIn(int userID) {
        return checkInDao.checkInByUser(userID);
    }

    public void insertCheckIn(int userID, int status) {
        checkInDao.insertCheckInByUser(userID, status);
    }

    public List<CheckInDto> findAllCheckIn() {
        return checkInDao.findAllCheckIn();
    }
}
