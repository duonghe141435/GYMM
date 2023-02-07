package swp12.gym.Model.Mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.Model.Entity.Users;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper  implements RowMapper<Users> {
    public Users mapRow(ResultSet resultSet, int i) throws SQLException {
        final Users user = new Users();
        user.setId(resultSet.getInt("u_id"));
        user.setEmail(resultSet.getString("email"));
        user.setUsername(resultSet.getString("name"));
        user.setPassword(resultSet.getString("password"));
        user.setEnable(resultSet.getInt("enable"));
        return user;
    }
}
