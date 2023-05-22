package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.CheckInDto;
import swp12.gym.dto.CheckInDtoMapper;
import swp12.gym.model.entity.CheckIn;
import swp12.gym.model.mapper.CheckInMapper;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class CheckInDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    private final LocalDateTime currentDate = LocalDateTime.now();

    public String checkInByUser(int userID) {
        try{
            sql = "SELECT \n" +
                    "\tCASE \n" +
                    "        WHEN MAX(tu.end_date) IS NULL THEN 'null'\n" +
                    "        WHEN NOW() < MAX(tu.end_date) THEN 'YES'\n" +
                    "    ELSE 'NO'\n" +
                    "  END AS is_expired\n" +
                    "FROM ticket_user tu\n" +
                    "JOIN ticket t ON tu.ticket_id = t.id_t\n" +
                    "WHERE t.tt_id = 1 AND tu.id_u = ?";
            String isExpired = jdbcTemplate.queryForObject(sql, String.class, userID);
            return isExpired;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void insertCheckInByUser(int userID, int status){
        try{
            sql = "INSERT INTO checkin (`current_time`, status, user_id) VALUES (?,?,?)";
            jdbcTemplate.update(sql, currentDate, status, userID);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<CheckInDto> findAllCheckIn() {
        try {
            sql = "SELECT u.image, u.email, u.name, u.gender, c.current_time, c.status\n" +
                    "                    FROM checkin c\n" +
                    "                    JOIN users u ON c.user_id = u.id_u\n" +
                    "                    WHERE DATE(c.current_time) = CURDATE()\n" +
                    "                    ORDER BY c.checkIn_id DESC;";
            return jdbcTemplate.query(sql, new CheckInDtoMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
