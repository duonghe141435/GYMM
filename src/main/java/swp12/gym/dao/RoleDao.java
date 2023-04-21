package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void saveRoleForUser(int id_u, int r_id) {
        sql = "INSERT INTO users_roles (u_id, r_id) VALUES (?,?)";
        jdbcTemplate.update(sql,id_u,r_id);
    }
}
