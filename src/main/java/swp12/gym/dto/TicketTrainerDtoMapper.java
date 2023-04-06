package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketTrainerDtoMapper implements RowMapper<TicketTrainerDto> {
    public TicketTrainerDto mapRow(ResultSet resultSet, int i) throws SQLException {

        TicketTrainerDto ticketTrainerDto = new TicketTrainerDto();

        ticketTrainerDto.setT_id(resultSet.getInt("t_id"));
        ticketTrainerDto.setT_name(resultSet.getString("t_name"));
        ticketTrainerDto.setTt_id(resultSet.getInt("tt_id"));
        ticketTrainerDto.setT_total_days(resultSet.getInt("t_day"));
        ticketTrainerDto.setT_status(resultSet.getInt("t_status"));
        ticketTrainerDto.setCreate_date(resultSet.getString("t_create_date"));
        ticketTrainerDto.setT_price_max(resultSet.getInt("max_price"));
        ticketTrainerDto.setT_price_min(resultSet.getInt("min_price"));

        return ticketTrainerDto;
    }
}