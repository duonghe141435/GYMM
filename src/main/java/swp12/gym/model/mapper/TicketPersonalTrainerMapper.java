package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.TicketPersonalTrainer;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketPersonalTrainerMapper implements RowMapper<TicketPersonalTrainer> {
        public TicketPersonalTrainer mapRow(ResultSet resultSet, int i) throws SQLException {
            return null;
        }
    }
