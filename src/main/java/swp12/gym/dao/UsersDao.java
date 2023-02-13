package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.model.Entity.Users;
import swp12.gym.model.Mapper.UserMapper;

import java.util.List;

@Repository
public class UsersDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<Users> findAllUsers() {
        sql = "SELECT * FROM users";
        return jdbcTemplate.query(sql, new UserMapper());
    }

    public Integer getNumberUserInSystem() {
        sql = "SELECT COUNT(*) FROM users WHERE enabled = 1";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public Users findById(long id) {
        sql = "SELECT * FROM users WHERE id_u = ?;";
        return jdbcTemplate.queryForObject(sql, new UserMapper(), id);
    }

    public void saveUser(Users user) {
        sql = "INSERT INTO users (id_u,name,email,password,enabled) VALUES (?,?,?,?,?)";
        jdbcTemplate.update(sql, user.getId(), user.getUsername(), user.getEmail(),
                user.getPassword(), user.getEnable());
    }
}
