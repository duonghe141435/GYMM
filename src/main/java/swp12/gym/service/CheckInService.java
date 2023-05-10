package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.CheckInDto;
import swp12.gym.model.entity.CheckIn;

import java.util.List;

@Service
public interface CheckInService {

    String checkIn(int userID);

    void insertCheckIn(int userID, int status);

    List<CheckInDto> findAllCheckIn();
}
