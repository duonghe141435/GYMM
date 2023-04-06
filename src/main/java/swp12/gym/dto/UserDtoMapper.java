package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDtoMapper implements RowMapper<UserDto> {
    public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {

        UserDto userDto = new UserDto();

        userDto.setU_id(resultSet.getInt("id_u"));
        userDto.setU_full_name(resultSet.getString("name"));
        userDto.setU_email(resultSet.getString("email"));
        userDto.setU_password(resultSet.getString("password"));
        userDto.setU_gender(resultSet.getInt("gender"));
        userDto.setU_address(resultSet.getString("address"));
        userDto.setU_img(resultSet.getString("image"));
        userDto.setU_enable(resultSet.getInt("enabled"));
        userDto.setR_id(resultSet.getInt("id_r"));
        userDto.setU_identity_card(resultSet.getString("CMND"));
        userDto.setU_dob(resultSet.getString("DOB"));
        userDto.setU_phone_number(resultSet.getString("phone"));
        userDto.setU_create_date(resultSet.getString("create_date"));

        return userDto;
    }
}
