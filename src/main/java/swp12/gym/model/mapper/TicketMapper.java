package swp12.gym.model.mapper;

import swp12.gym.model.entity.Ticket;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketMapper implements RowMapper<Ticket> {
    public Ticket mapRow(ResultSet resultSet, int i) throws SQLException {
        Ticket ticket = new Ticket();
        ticket.setT_id(resultSet.getInt("id_t"));
        ticket.setT_name(resultSet.getString("t_name"));
        ticket.setTt_id(resultSet.getInt("tt_id"));
        ticket.setT_status(resultSet.getInt("t_status"));
        ticket.setT_price(resultSet.getInt("t_price"));
        ticket.setT_total_days(resultSet.getInt("t_day"));
        ticket.setCreate_date(resultSet.getString("t_create_date"));
        return ticket;
    }
}