package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoMapper;
import swp12.gym.model.entity.User;
import swp12.gym.model.mapper.UserMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UsersDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    //Lay tat ca nguoi dung
    public List<UserDto> findAll() {
        sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                "users.CMND,users.status, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r;";
        return jdbcTemplate.query(sql, new UserDtoMapper());
    }

    public Integer getNumberUserInSystem() {
        sql = "SELECT COUNT(*) FROM users WHERE enabled = 1";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public User findById(long id){
        sql = "SELECT * FROM users WHERE id_u = ?;";
        return jdbcTemplate.queryForObject(sql, new UserMapper(),id);
    }

    public void createUser(UserDto userDto) {
        try{
            sql = "INSERT INTO users (id_u, name, email, password, enabled, gender, phone, address, image, CMND, status, create_date, DOB) " +
                    "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
            jdbcTemplate.update(sql, userDto.getU_id(), userDto.getU_full_name(),userDto.getU_email(), userDto.getU_password(),
                    1, userDto.getU_gender(), userDto.getU_phone_number(), userDto.getU_address(), userDto.getU_img(),
                    userDto.getU_identity_card(), 1,userDto.getU_dob() ,userDto.getU_dob());
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public void createCustomer(User user) {
        try{
            final String hash_pass = BCrypt.hashpw(user.getU_password(),BCrypt.gensalt(10));
            sql = "INSERT INTO users (name, email, password, enabled) " +
                    "VALUES (?,?,?,?);";
            jdbcTemplate.update(sql, user.getU_full_name(),user.getU_email(),hash_pass,1);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public User getNameAndImgByEmail(String email) {
        try{
            sql = "SELECT name, image FROM users WHERE email = ?";
            return jdbcTemplate.queryForObject(sql, new RowMapper<User>() {
                public User mapRow(ResultSet resultSet, int i) throws SQLException {
                    User user = new User();
                    user.setU_full_name(resultSet.getString("name"));
                    user.setU_img(resultSet.getString("image"));
                    return user;
                }
            }, email);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
