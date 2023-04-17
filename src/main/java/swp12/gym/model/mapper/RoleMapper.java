package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.Role;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper implements RowMapper<Role> {
    public Role mapRow(ResultSet resultSet, int i) throws SQLException {
        Role role = new Role();
        role.setR_id(resultSet.getInt("id_r"));
        role.setR_code(resultSet.getString("code"));
        role.setR_description(resultSet.getString("description"));
        return role;
    }
}
