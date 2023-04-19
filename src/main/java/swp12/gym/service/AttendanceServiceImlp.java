package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.AttendanceDao;
import swp12.gym.model.entity.Attendance;

import java.util.List;

@Service
public class AttendanceServiceImlp implements AttendanceService{

    @Autowired
    private AttendanceDao attendanceDao;

    public void saveAttendance(List<Attendance> listAttendance) {
        attendanceDao.insertAttendance(listAttendance);
    }
}
