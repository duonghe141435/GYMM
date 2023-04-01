package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StaffDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void createStaff(int id_u) {
        sql = "INSERT INTO staff(id_u) VALUES (?)";
        jdbcTemplate.update(sql,id_u);
    }

    public void deleteStaff(int u_id) {
        sql = "DELETE FROM staff WHERE id_u = ?";
        jdbcTemplate.update(sql,u_id);
    }

    public int checkStaff(int u_id) {
        sql = "SELECT COUNT(*) as number_staff FROM staff WHERE id_u = ?";
        return jdbcTemplate.queryForObject(sql, Integer.class, u_id);
    }
}
