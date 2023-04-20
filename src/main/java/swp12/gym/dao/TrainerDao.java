package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrainerDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;
}
