package swp12.gym.dto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UserDtoDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public UserDto findAnUserByEmail(String username) {
        try {
            sql = "SELECT users.id_u,users.name,users.username, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND,users.status, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.username = ?;";
            return jdbcTemplate.queryForObject(sql, new UserDtoMapper(), username);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public UserDto findAnCustomerByEmail(String username) {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.password, users.gender, users.address, users.image,\n" +
                    " users.enabled, users.CMND, users.DOB,r.id_r, users.phone, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.email = ?;";
            return jdbcTemplate.queryForObject(sql, new RowMapper<UserDto>() {
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
                    userDto.setU_identity_card(resultSet.getString("CMND"));
                    userDto.setU_dob(resultSet.getString("DOB"));
                    userDto.setR_id(resultSet.getInt("id_r"));
                    userDto.setU_phone_number(resultSet.getString("phone"));
                    userDto.setU_create_date(resultSet.getString("create_date"));
                    return userDto;
                }
            }, username);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
