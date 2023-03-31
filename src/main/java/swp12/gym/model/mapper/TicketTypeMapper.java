package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.TicketType;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketTypeMapper implements RowMapper<TicketType> {
    public TicketType mapRow(ResultSet resultSet, int i) throws SQLException {
        TicketType ticketType = new TicketType();
        ticketType.setTt_id(resultSet.getInt("tt_id"));
        ticketType.setName(resultSet.getString("name"));
        ticketType.setCreate_date(resultSet.getString("create_date"));
        ticketType.setStatus(resultSet.getInt("status"));
        return ticketType;
    }
}