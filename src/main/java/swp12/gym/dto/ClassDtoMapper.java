package swp12.gym.dto;

//import javax.swing.tree.RowMapper;
import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClassDtoMapper implements RowMapper<ClassDto> {

    public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {

        ClassDto classDto = new ClassDto();

        classDto.setClass_id(resultSet.getInt("class_id"));
        classDto.setC_name(resultSet.getString("c_name"));
        classDto.setC_create_date(resultSet.getString("c_create_date"));
        classDto.setClass_id(resultSet.getInt("class_id"));
        classDto.setC_time_id(resultSet.getInt("c_time_id") );
        classDto.setC_status(resultSet.getInt("c_status"));
//        Timestamp start_date = resultSet.getTimestamp("c_start_date");
//        LocalDateTime localDateTime = start_date.toLocalDateTime();
        classDto.setC_start_date(resultSet.getString("c_start_date"));
//        Timestamp end_date = resultSet.getTimestamp("c_end_date");
//        LocalDateTime localEndDate = end_date.toLocalDateTime();
        classDto.setC_end_date(resultSet.getString("c_end_date"));
        classDto.setMax_member(resultSet.getInt("max_member"));
        classDto.setC_price(resultSet.getInt("c_price"));
        classDto.setC_trainer_id(resultSet.getInt("c_trainer_id"));
        classDto.setC_trainer_name(resultSet.getString("c_trainer_name"));
        classDto.setC_ticket_id(resultSet.getInt("c_ticket_id"));
        classDto.setStart_time(resultSet.getString("start_time"));
        classDto.setEnd_time(resultSet.getString("end_time"));
        classDto.setTotal_attendees(resultSet.getInt("total_attendees"));

        return classDto;
    }
}
