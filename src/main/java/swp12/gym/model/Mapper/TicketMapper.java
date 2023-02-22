package swp12.gym.model.Mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.Entity.Tickets;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketMapper implements RowMapper<Tickets> {
    public Tickets mapRow(ResultSet rs, int i) throws SQLException {
        Tickets tickets = new Tickets();
        tickets.setId(rs.getLong("ticket_id"));
        tickets.setName_ticket(rs.getString("type"));
        tickets.setPrice(rs.getFloat("price"));
        tickets.setTotal_days(rs.getInt("total_days"));
        tickets.setStatus(rs.getInt("status") == 1 ? true:false);
        return tickets;
    }
}
