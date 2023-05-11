package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.Attendance;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AttendanceMapper implements RowMapper<Attendance> {
    public Attendance mapRow(ResultSet resultSet, int i) throws SQLException {

        Attendance attendance = new Attendance();
        attendance.setAttendance_date(resultSet.getString("attendance_date"));
        attendance.setStatus(resultSet.getInt("status"));
        attendance.setUser_id(resultSet.getInt("user_id"));
        attendance.setClass_id(resultSet.getInt("class_id"));
        return attendance;
    }
}
