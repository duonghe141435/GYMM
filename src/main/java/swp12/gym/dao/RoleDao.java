package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.Role;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class RoleDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void saveRoleForUser(int id_u, int r_id) {
        sql = "INSERT INTO users_roles (u_id, r_id) VALUES (?,?)";
        jdbcTemplate.update(sql,id_u,r_id);
    }

    public List<Role> findAll(){
        sql = "SELECT * FROM roles WHERE id_r <> 1;";
        return jdbcTemplate.query(sql, new RowMapper<Role>() {
            public Role mapRow(ResultSet resultSet, int i) throws SQLException {
                Role role = new Role();
                role.setR_id(resultSet.getInt("id_r"));
                role.setR_code(resultSet.getString("code"));
                role.setR_description(resultSet.getString("description"));
                return role;
            }
        });
    }
}
