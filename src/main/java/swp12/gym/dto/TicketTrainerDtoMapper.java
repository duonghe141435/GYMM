package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketTrainerDtoMapper implements RowMapper<TicketTrainerDto> {
    public TicketTrainerDto mapRow(ResultSet resultSet, int i) throws SQLException {

//        SELECT t.id_t, t.tt_id, t.total_days, t.status, t.create_date,  MIN(pt.price) as min_price, MAX(pt.price) as max_price\n" +
//        "FROM ticket t join personal_trainer pt on t.id_t = pt.ticket_id WHERE t.tt_id = 2\n" +
//         "GROUP BY t.id_t,  t.tt_id, t.total_days, t.create_date

        TicketTrainerDto ticketTrainerDto = new TicketTrainerDto();
        ticketTrainerDto.setT_id(resultSet.getInt("t_id"));
        ticketTrainerDto.setT_name(resultSet.getString("t_name"));
        ticketTrainerDto.setTicket_id(resultSet.getInt("ticket_id"));
        ticketTrainerDto.setTt_id(resultSet.getInt("tt_id"));
        ticketTrainerDto.setT_total_days(resultSet.getInt("t_day"));
        ticketTrainerDto.setT_status(resultSet.getInt("t_status"));
        ticketTrainerDto.setCreate_date(resultSet.getString("t_create_date"));
        ticketTrainerDto.setT_price_max(resultSet.getInt("max_price"));
        ticketTrainerDto.setT_price_min(resultSet.getInt("min_price"));
        return ticketTrainerDto;
    }
}
