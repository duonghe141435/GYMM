package swp12.gym.dao;

import swp12.gym.model.entity.User;
import swp12.gym.model.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    //Lay tat ca nguoi dung
    public List<User> findAllUsers() {
        sql = "SELECT * FROM users WHERE enabled = 1";
        return jdbcTemplate.query(sql, new UserMapper());
    }

    //Lay tong so nguoi dung trong he thong
    public Integer getNumberUserInSystem() {
        sql = "SELECT COUNT(*) FROM users";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    // Lay id nguoi dung bang email
    public Integer getIdUserForEmail(String email) {
        sql = "SELECT COUNT(*) FROM users";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public User findById(long id) {
        sql = "SELECT * FROM users WHERE id_u = ?;";
        return jdbcTemplate.queryForObject(sql, new UserMapper(), id);
    }

    public void saveUser(User user) {
        sql = "INSERT INTO users (id_u,name,email,password,phone,enabled) VALUES (?,?,?,?,?,?)";
        jdbcTemplate.update(sql, user.getU_id(), user.getU_full_name(), user.getU_email(),
                user.getU_password(), user.getU_phone_number() ,user.isU_status());
    }

    public void changeLockUser(int status, int u_id){
        sql = "UPDATE users SET status = ? WHERE id_u = ?";
        jdbcTemplate.update(sql, status,u_id);
    }
}
