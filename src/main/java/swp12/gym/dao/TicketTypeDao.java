package swp12.gym.dao;

import swp12.gym.model.entity.TicketType;
import swp12.gym.model.mapper.TicketTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TicketTypeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<TicketType> findAllTickets(){
        sql = "SELECT * FROM ticket_type WHERE status = 1";
        return jdbcTemplate.query(sql, new TicketTypeMapper());
    }

    public void createNewTicketType(TicketType tt){
        sql = "INSERT INTO ticket_type (tt_id, name, create_date, status) VALUES (?,?,?,?)";
        jdbcTemplate.update(sql, tt.getTt_id(), tt.getName(), tt.getCreate_date(), tt.getStatus());
    }
}
