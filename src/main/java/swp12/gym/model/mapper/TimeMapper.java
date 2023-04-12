package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.Time;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TimeMapper implements RowMapper<Time> {
    public Time mapRow(ResultSet resultSet, int i) throws SQLException {

        Time time = new Time();
        time.setId_time(resultSet.getInt("id_time"));
        time.setStart_time(resultSet.getString("start_time"));
        time.setEnd_time(resultSet.getString("end_time"));

        return time;
    }
}

