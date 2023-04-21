package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.PersonalTrainerDetail;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonalTrainerDetailMapper implements RowMapper<PersonalTrainerDetail> {
    public PersonalTrainerDetail mapRow(ResultSet resultSet, int i) throws SQLException {
        PersonalTrainerDetail personalTrainerDetail = new PersonalTrainerDetail();
        personalTrainerDetail.setPersonal_trainer_detail_id(resultSet.getInt("personal_trainer_detail_id"));
        personalTrainerDetail.setCurrent_date(resultSet.getString("current_date"));
        personalTrainerDetail.setStatus(resultSet.getInt("status"));
        personalTrainerDetail.setNote(resultSet.getString("note"));
        personalTrainerDetail.setPersonal_trainer_id(resultSet.getInt("personal_trainer_id"));
        personalTrainerDetail.setTime_id(resultSet.getInt("time_id"));
        personalTrainerDetail.setUser_id(resultSet.getInt("user_id"));
        return personalTrainerDetail;
    }
}
