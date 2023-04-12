package swp12.gym.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDtoDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public UserDto findAnUserByEmail(String username) {
        try {
            sql = "SELECT users.id_u,users.name,users.username, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND,users.status, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.username = ?;";
            return jdbcTemplate.queryForObject(sql, new UserDtoMapper(), username);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
