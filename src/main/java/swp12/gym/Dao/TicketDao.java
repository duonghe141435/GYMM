package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.model.Entity.Tickets;
import swp12.gym.model.Mapper.TicketMapper;

import java.util.List;

@Repository
public class TicketDao {

    @Autowired
    JdbcTemplate jdbcTemplate;
    String sql;

    public List<Tickets> findAllTicketIsActive() {
        sql = "SELECT * FROM ticket WHERE status = 1";
        return jdbcTemplate.query(sql, new TicketMapper());
    }

    public void createTicket(Tickets ticket) {
        sql = "INSERT INTO ticket VALUES (?,?,?,?,?,?)";
        jdbcTemplate.update(sql,ticket.getId(),ticket.getName_ticket(),
                ticket.getPrice(), ticket.getNote(),ticket.getTotal_days(),
                1);
    }

    public Tickets findById(long id) {
        sql = "SELECT * FROM ticket WHERE ticket_id = ? AND  status = 1";
        return jdbcTemplate.queryForObject(sql,new TicketMapper(),id);
    }

    public Tickets findByName(String name) {
        sql = "SELECT * FROM ticket WHERE type = ? AND  status = 1";
        return jdbcTemplate.queryForObject(sql,new TicketMapper(),name);
    }

    public void updateTicket(Tickets ticket) {
        sql = "UPDATE ticket SET type = ?, price = ?, note = ?, total_days = ?";
        jdbcTemplate.update(sql,ticket.getName_ticket(), ticket.getPrice(), ticket.getNote(),
                ticket.getTotal_days());
    }

    public void deleteTicket(long id) {
        sql = "DELETE FROM ticket WHERE ticket_id = ?";
        jdbcTemplate.update(sql,id);
    }
}
