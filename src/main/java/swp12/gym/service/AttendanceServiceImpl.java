package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.common.DataUtil;
import swp12.gym.dao.AttendanceDao;
import swp12.gym.dao.ClassDao;
import swp12.gym.dto.ClassDto;
import swp12.gym.model.entity.Attendance;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class AttendanceServiceImpl implements AttendanceService{

    @Autowired
    private AttendanceDao attendanceDao;

    @Autowired
    private ClassDao classDao;

    private final LocalDateTime currentDate = LocalDateTime.now();

    public String checkDateAttendanceClass(int class_id) {
        String result = "";
        ClassDto classDto = classDao.findDetailAnClass(class_id);
        System.out.println("classDto: " + classDto);

        LocalDateTime start_date = new DataUtil().convertStringDateToLocalDateTime(classDto.getC_start_date());
        LocalDateTime end_date = new DataUtil().convertStringDateToLocalDateTime(classDto.getC_end_date());

        // Để tìm hôm nay là thứ mấy trong tuần, sẽ được tính từ 2 đến 8, 2 là t2, 8 là chủ nhật
        DayOfWeek dayOfWeek = currentDate.getDayOfWeek();
        int dayOfWeekValue = dayOfWeek.getValue() + 1;
        System.out.println("dayOfWeekValue: " + dayOfWeekValue);
        if (currentDate.isAfter(start_date) && currentDate.isBefore(end_date) && classDto.getC_status() == 1){
            if (classDto.getMonday() == 1 && dayOfWeekValue == 2){
                result = "YES";
            }else if (classDto.getTuesday() == 1 && dayOfWeekValue == 3){
                result = "YES";
            }else if (classDto.getWednesday() == 1 && dayOfWeekValue == 4){
                result = "YES";
            }else if (classDto.getThursday() == 1 && dayOfWeekValue == 5){
                result = "YES";
            }else if (classDto.getFriday() == 1 && dayOfWeekValue == 6){
                result = "YES";
            }else if (classDto.getSaturday() == 1 && dayOfWeekValue == 7){
                result = "YES";
            }else if (classDto.getSunday() == 1 && dayOfWeekValue == 8){
                result = "YES";
            }else {
                result = "NO";
            }
        }else{
            result = "False";
        }
        return result;
//        return attendanceDao.checkDateAttendanceClass(class_id);
    }

    public void saveAttendance(List<Attendance> listAttendance) {
        attendanceDao.insertAttendance(listAttendance);
    }
}
