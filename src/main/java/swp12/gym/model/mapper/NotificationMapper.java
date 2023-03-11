package swp12.gym.model.mapper;

import swp12.gym.model.entity.Notification;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NotificationMapper implements RowMapper<Notification> {
    public Notification mapRow(ResultSet resultSet, int i) throws SQLException {
        Notification notification = new Notification();

        return null;
    }
}
