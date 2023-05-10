package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Attendance;

import java.util.List;

@Service
public interface AttendanceService {

    String checkDateAttendanceClass(int class_id);

    void saveAttendance(List<Attendance> listAttendance);


}
