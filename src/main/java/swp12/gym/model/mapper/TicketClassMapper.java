package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.ClassTrainer;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketClassMapper implements RowMapper<ClassTrainer> {
    public ClassTrainer mapRow(ResultSet resultSet, int i) throws SQLException {

        ClassTrainer classTrainer = new ClassTrainer();

        classTrainer.setClass_id(resultSet.getInt("class_id"));
        classTrainer.setClass_name(resultSet.getString("name"));
        classTrainer.setTicket_id(resultSet.getInt("ticket_id"));
        classTrainer.setMax_member(resultSet.getInt("max_menber"));
        classTrainer.setClass_price(resultSet.getInt("price"));
        classTrainer.setTrainer_id(resultSet.getInt("trainer_id"));
        classTrainer.setTime_id(resultSet.getInt("time_id"));
        classTrainer.setClass_state(resultSet.getInt("state"));
        classTrainer.setEnd_date(resultSet.getString("end_date"));
        classTrainer.setStart_date(resultSet.getString("start_date"));


        return classTrainer;
    }
}
