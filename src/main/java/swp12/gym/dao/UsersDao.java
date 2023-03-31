package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.User;
import swp12.gym.model.mapper.UserMapper;

import java.util.List;

@Repository
public class UsersDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<User> getCommentOfACourseById(int id) {
        String sql = "SELECT * FROM users";
        return jdbcTemplate.query(sql, new UserMapper(), id);
    }
}
