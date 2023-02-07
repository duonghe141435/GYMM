package swp12.gym.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.Model.Entity.Users;
import swp12.gym.Model.Mapper.UserMapper;

import java.util.List;

@Repository
public class UsersDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Users> getCommentOfACourseById(int id) {
        String sql = "SELECT * FROM users";
        return jdbcTemplate.query(sql, new UserMapper(), id);
    }
}
