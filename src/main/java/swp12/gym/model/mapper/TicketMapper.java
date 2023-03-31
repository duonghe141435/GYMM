package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.Ticket;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketMapper implements RowMapper<Ticket> {
    public Ticket mapRow(ResultSet resultSet, int i) throws SQLException {
        Ticket ticket = new Ticket();
        ticket.setT_id(resultSet.getInt("id_t"));
        ticket.setT_name(resultSet.getString("name"));
        ticket.setTt_id(resultSet.getInt("tt_id"));
        ticket.setT_status(resultSet.getInt("status"));
        ticket.setT_price(resultSet.getInt("price"));
        ticket.setT_total_days(resultSet.getInt("total_days"));
        ticket.setCreate_date(resultSet.getString("create_date"));
        return ticket;
    }
}
