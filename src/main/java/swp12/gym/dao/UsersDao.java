package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
                "users.CMND,users.status, users.DOB,r.id_r, users.phone, users.enabled, users.create_date, r.description\n" +
                "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r;";
        return jdbcTemplate.query(sql, new UserDtoMapper());
    }

    public int findIdByUsername(String username) {
        try{
            sql = "SELECT id_u FROM users WHERE email = ?";
            return jdbcTemplate.queryForObject(sql,Integer.class,username);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public List<User> findAllTrainer() {
        try{
            sql = "SELECT t.trainer_id, name, email, gender, phone, address, image, DOB FROM users JOIN trainer t on users.id_u = t.id_u";
            return jdbcTemplate.query(sql, new RowMapper<User>() {
                public User mapRow(ResultSet resultSet, int i) throws SQLException {
                    User user = new User();
                    user.setU_id(resultSet.getInt("trainer_id"));
                    user.setU_full_name(resultSet.getString("name"));
                    user.setU_email(resultSet.getString("email"));
                    user.setU_gender(resultSet.getInt("gender"));
                    user.setU_phone_number(resultSet.getString("phone"));
                    user.setU_address(resultSet.getString("address"));
                    user.setU_img(resultSet.getString("image"));
                    user.setU_dob(resultSet.getString("DOB"));
                    return user;
                }
            });
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<UserDto> findAllTrainerPersonal(int ticket_id) {
        try{
            sql = "SELECT t.trainer_id, name, t.Year_of_experience, pt.price, pt.personal_trainer_id FROM users JOIN trainer t on users.id_u = t.id_u JOIN personal_trainer pt ON t.trainer_id = pt.trainer_id  AND pt.status = 1 AND pt.ticket_id = ?";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
                public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    UserDto userDto = new UserDto();
                    userDto.setU_id(resultSet.getInt("trainer_id"));
                    userDto.setU_full_name(resultSet.getString("name"));
                    userDto.setT_experience(resultSet.getInt("Year_of_experience"));
                    userDto.setTp_price(resultSet.getInt("price"));
                    userDto.setTp_id(resultSet.getInt("personal_trainer_id"));
                    return userDto;
                }
            }, ticket_id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<User> findAllTrainerIdAndName() {
        try{
            sql = "SELECT id_u, name FROM users JOIN users_roles ON users.id_u = users_roles.u_id " +
                    "WHERE users.enabled = 1 AND users_roles.r_id = 3";
            return jdbcTemplate.query(sql, new RowMapper<User>() {
                public User mapRow(ResultSet resultSet, int i) throws SQLException {
                    User user = new User();
                    user.setU_id(resultSet.getInt("id_u"));
                    user.setU_full_name(resultSet.getString("name"));
                    return user;
                }
            });
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<UserDto> findAllEmployee() {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE r.id_r = 2;";
            return jdbcTemplate.query(sql, new UserDtoMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<UserDto> findAllCustomer() {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE r.id_r = 4;";
            return jdbcTemplate.query(sql, new UserDtoMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
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

    public void createStaff(int id_u) {
        try{
            sql = "INSERT INTO staff(id_u) VALUES (?)";
            jdbcTemplate.update(sql,id_u);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void deleteStaff(int u_id) {
        try{
            sql = "DELETE FROM staff WHERE id_u = ?";
            jdbcTemplate.update(sql,u_id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int isExistsStaff(int u_id) {
        try{
            sql = "SELECT COUNT(*) as number_staff FROM staff WHERE id_u = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class, u_id);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
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
