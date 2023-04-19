package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Attendance;

import java.util.List;

@Service
public interface AttendanceService {
    void saveAttendance(List<Attendance> listAttendance);
}
