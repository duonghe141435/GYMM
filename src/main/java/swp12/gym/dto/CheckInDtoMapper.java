package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckInDtoMapper implements RowMapper<CheckInDto> {

    public CheckInDto mapRow(ResultSet resultSet, int i) throws SQLException {

        CheckInDto checkInDto = new CheckInDto();
        checkInDto.setU_img(resultSet.getString("image"));
        checkInDto.setU_email(resultSet.getString("email"));
        checkInDto.setU_full_name(resultSet.getString("name"));
        checkInDto.setU_gender(resultSet.getInt("gender"));
        checkInDto.setCurrent_time(resultSet.getString("current_time"));
        checkInDto.setStatus(resultSet.getInt("status"));
        return checkInDto;
    }
}
