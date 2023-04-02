package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDao {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;
}
