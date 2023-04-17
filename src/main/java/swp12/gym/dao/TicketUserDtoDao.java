package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketDtoMapper;

@Repository
public class TicketUserDtoDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    private String sql;

    public TicketDto findAnTicket(long id) {
        sql = "SELECT * FROM ticket WHERE id_t = ? AND status = 1";
        return jdbcTemplate.queryForObject(sql,new TicketDtoMapper(), id);
    }
}
