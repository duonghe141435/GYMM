package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.Attendance;
import swp12.gym.model.mapper.AttendanceMapper;


import java.time.LocalDate;
import java.util.List;

@Repository
public class AttendanceDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;
    private final LocalDate currentDate = LocalDate.now();

    public String checkDateAttendanceClass(int class_id) {
        try{
            sql = "";
            String isExpired = jdbcTemplate.queryForObject(sql, String.class, class_id);
            return isExpired;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void insertAttendance(List<Attendance> listAttendance){
        try{
//            sql = "";
//            jdbcTemplate.update(sql, );
//            sql = "INSERT INTO attendance (attendance.attendance_date, attendance.class_id, attendance.status, attendance.user_id) VALUES (?,?,?,?)";
            StringBuffer sql = new StringBuffer("INSERT INTO attendance (attendance.attendance_date, attendance.class_id, attendance.status, attendance.user_id) VALUES");
            for (Attendance attendance: listAttendance) {
                sql.append("(" + "'" + currentDate + "'" + "," + attendance.getClass_id() + "," + attendance.getStatus() + "," + attendance.getUser_id() + ")");
                sql.append(",");
            }
            String sqlRs = sql.substring(0, sql.length()-1);
            System.out.println("database sql: " + sqlRs);
            jdbcTemplate.update(sqlRs);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Attendance> listAttendance(int class_id) {
        try {
            sql = "SELECT * \n" +
                    "FROM attendance a\n" +
                    "WHERE a.class_id = ?";
            return jdbcTemplate.query(sql, new AttendanceMapper(), class_id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
