package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketDtoMapper implements RowMapper<TicketDto> {
    public TicketDto mapRow(ResultSet resultSet, int i) throws SQLException {

        TicketDto ticket = new TicketDto();

        ticket.setT_id(resultSet.getInt("ticket_id"));
        ticket.setTt_id(resultSet.getInt("ticket_type"));
        ticket.setT_name(resultSet.getString("ticket_name"));
        ticket.setT_total_days(resultSet.getInt("ticket_day"));
        ticket.setMin_member(resultSet.getString("min_menber"));
        ticket.setMax_member(resultSet.getString("max_menber"));
        ticket.setT_price(resultSet.getInt("ticket_price"));
        ticket.setClass_price_min(resultSet.getInt("class_price_min"));
        ticket.setClass_price_max(resultSet.getInt("class_price_max"));
        ticket.setTrainer_price_min(resultSet.getInt("trainer_price_min"));
        ticket.setTrainer_price_max(resultSet.getInt("trainer_price_max"));
        ticket.setT_status(resultSet.getInt("ticket_status"));
        ticket.setCreate_date(resultSet.getString("ticket_create"));

        return ticket;
    }
}