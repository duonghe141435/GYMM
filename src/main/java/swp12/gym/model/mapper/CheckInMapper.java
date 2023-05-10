package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.CheckIn;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckInMapper implements RowMapper<CheckIn> {
    public CheckIn mapRow(ResultSet resultSet, int i) throws SQLException {

        CheckIn checkIn = new CheckIn();
        checkIn.setCheckIn_id(resultSet.getInt("checkIn_id"));
        checkIn.setCurrent_time(resultSet.getString("current_time"));
        checkIn.setStatus(resultSet.getInt("status"));
        checkIn.setUser_id(resultSet.getInt("user_id"));
        return checkIn;
    }
}
