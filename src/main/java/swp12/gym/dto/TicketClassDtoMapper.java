package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketClassDtoMapper implements RowMapper<TicketClassDto> {
    public TicketClassDto mapRow(ResultSet resultSet, int i) throws SQLException {

        TicketClassDto ticketClassDto = new TicketClassDto();

        ticketClassDto.setT_id(resultSet.getInt("id_t"));
        ticketClassDto.setT_name(resultSet.getString("t_name"));
        ticketClassDto.setT_total_days(resultSet.getInt("total_days"));
        ticketClassDto.setT_price_min(resultSet.getInt("min_price"));
        ticketClassDto.setT_price_max(resultSet.getInt("max_price"));
        ticketClassDto.setMin_member(resultSet.getInt("min_member"));
        ticketClassDto.setMax_member(resultSet.getInt("max_menber"));
        ticketClassDto.setCreate_date(resultSet.getString("create_date"));
        ticketClassDto.setT_status(resultSet.getInt("status"));

        return ticketClassDto;
    }
}
