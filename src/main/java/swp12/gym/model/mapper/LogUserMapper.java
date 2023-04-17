package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.LogUser;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LogUserMapper implements RowMapper<LogUser> {
    public LogUser mapRow(ResultSet resultSet, int i) throws SQLException {

        LogUser logUser = new LogUser();
        logUser.setU_id(resultSet.getInt("user_id"));
        logUser.setType_log(resultSet.getInt("type_log"));
        logUser.setContent(resultSet.getString("content"));
        logUser.setDate_time_create(resultSet.getInt("time"));

        return logUser;
    }
}
