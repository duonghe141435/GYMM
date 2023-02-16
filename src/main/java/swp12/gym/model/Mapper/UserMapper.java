package swp12.gym.model.Mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.Entity.Users;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper  implements RowMapper<Users> {
    public Users mapRow(ResultSet resultSet, int i) throws SQLException {
        final Users user = new Users();
        user.setId(resultSet.getInt("id_u"));
        user.setEmail(resultSet.getString("email"));
        user.setUsername(resultSet.getString("name"));
        user.setPassword(resultSet.getString("password"));
        user.setEnable(resultSet.getInt("enabled"));
        return user;
    }
}
