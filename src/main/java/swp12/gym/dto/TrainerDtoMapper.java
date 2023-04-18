package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TrainerDtoMapper implements RowMapper<TrainerDto>{
    public TrainerDto mapRow(ResultSet resultSet, int i) throws SQLException {
        //SELECT t.trainer_id, u.name, u.enabled FROM trainer t join users u on t.id_u = u.id_u
        TrainerDto trainerDto = new TrainerDto();

        trainerDto.setId_trainer(resultSet.getInt("trainer_id"));
        trainerDto.setName_trainer(resultSet.getString("name"));
        trainerDto.setStatus_trainer(resultSet.getInt("enabled"));

        return trainerDto;
    }
}