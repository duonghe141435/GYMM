package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.Role;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleMapper implements RowMapper<Role> {
    public Role mapRow(ResultSet resultSet, int i) throws SQLException {
        return null;
    }
}
