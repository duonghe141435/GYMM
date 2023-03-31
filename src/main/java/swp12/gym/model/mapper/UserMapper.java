package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {
    public User mapRow(ResultSet resultSet, int i) throws SQLException {
        final User user = new User();
        user.setU_id(resultSet.getLong("id_u"));
        user.setU_email(resultSet.getString("email"));
        user.setU_full_name(resultSet.getString("name"));
        user.setU_password(resultSet.getString("password"));
        user.setU_phone_number(resultSet.getString("phone"));
        user.setU_enable(resultSet.getBoolean("enabled"));
        user.setU_gender(resultSet.getInt("gender"));
        user.setU_status(resultSet.getBoolean("status"));
        user.setU_address(resultSet.getString("address"));
        user.setU_identity_card(resultSet.getString("CMND"));
        user.setU_img(resultSet.getString("image"));
        user.setU_dob(resultSet.getString("DOB"));

        return user;
    }
}
