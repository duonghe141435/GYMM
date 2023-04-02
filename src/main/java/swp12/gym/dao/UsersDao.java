package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoMapper;
import swp12.gym.model.entity.User;

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
                "users.CMND,users.status, users.DOB,r.id_r, users.phone, users.enabled, users.create_date, r.description\n" +
                "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r;";
        return jdbcTemplate.query(sql, new UserDtoMapper());
    }

    public UserDto findAnUserById(int id) {
        sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                "users.CMND,users.status, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.id_u = ?;";
        return jdbcTemplate.queryForObject(sql, new UserDtoMapper(), id);
    }

    public UserDto findAnUserByEmail(String username) {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND,users.status, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.email = ?;";
            return jdbcTemplate.queryForObject(sql, new UserDtoMapper(), username);
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void createUser(UserDto userDto) {
        try{
            sql = "INSERT INTO users (id_u, name, email, password, enabled, gender, phone, address, image, CMND, " +
                    "status, create_date, DOB) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
            jdbcTemplate.update(sql, userDto.getU_id(), userDto.getU_full_name(),userDto.getU_email(), userDto.getU_password(),
                    1, userDto.getU_gender(), userDto.getU_phone_number(), userDto.getU_address(), userDto.getU_img(),
                    userDto.getU_identity_card(), 1,userDto.getU_dob() ,userDto.getU_dob());
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }


    public User getNameAndImgByEmail(String userName) {
        try{
            sql = "SELECT name, image FROM users WHERE email = ?";
            return jdbcTemplate.queryForObject(sql, new RowMapper<User>() {
                public User mapRow(ResultSet resultSet, int i) throws SQLException {
                    User user = new User();
                    user.setU_full_name(resultSet.getString("name"));
                    user.setU_img(resultSet.getString("image"));
                    return user;
                }
            }, userName);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void createTrainer(int id_u, int year_experience) {
        try{
            sql = "INSERT INTO trainer(id_u, Year_of_experience) VALUES(?,?)";
            jdbcTemplate.update(sql,id_u, year_experience);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public int isExistsTrainer(int u_id) {
        try {
            sql = "SELECT COUNT(*) as number_trainer FROM trainer WHERE id_u = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class, u_id);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public void updateExperienceTrainer(int u_id, int year_experience) {
        try {
            sql = "UPDATE trainer SET Year_of_experience = ? WHERE id_u = ?";
            jdbcTemplate.update(sql,year_experience, u_id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void deleteTrainer(int u_id) {
        try {
            sql = "DELETE FROM trainer WHERE id_u = ?";
            jdbcTemplate.update(sql,u_id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
