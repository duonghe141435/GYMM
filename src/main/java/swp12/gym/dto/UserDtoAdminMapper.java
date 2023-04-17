package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDtoAdminMapper implements RowMapper<UserDtoAdmin> {
    public UserDtoAdmin mapRow(ResultSet resultSet, int i) throws SQLException {
//        SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
//        "users.CMND,users.status, users.DOB,r.id_r, r.code, users.phone, users.enabled, users.create_date\n" +
//                "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r;

        UserDtoAdmin userDto = new UserDtoAdmin();
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

