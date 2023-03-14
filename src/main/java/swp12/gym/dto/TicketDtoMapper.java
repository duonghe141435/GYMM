package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketDtoMapper implements RowMapper<TicketDto> {
    public TicketDto mapRow(ResultSet resultSet, int i) throws SQLException {

        TicketDto ticketDto = new TicketDto();

        ticketDto.setT_id(resultSet.getInt("t_id"));
        ticketDto.setT_name(resultSet.getString("t_name"));
        ticketDto.setTt_id(resultSet.getInt("tt_id"));
        ticketDto.setTt_name(resultSet.getString("tt_name"));
        ticketDto.setT_note(resultSet.getString("t_note"));
        ticketDto.setT_total_days(resultSet.getInt("t_day"));
        ticketDto.setT_status(resultSet.getBoolean("t_status"));
        ticketDto.setCreate_date(resultSet.getString("t_create_date"));

        return ticketDto;
    }
}
