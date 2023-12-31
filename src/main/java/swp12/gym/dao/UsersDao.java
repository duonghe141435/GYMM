package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.common.DataUtil;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoAdmin;
import swp12.gym.dto.UserDtoAdminMapper;
import swp12.gym.dto.UserDtoMapper;
import swp12.gym.model.entity.Attendance;
import swp12.gym.model.entity.User;
import swp12.gym.model.mapper.AttendanceMapper;
import swp12.gym.model.mapper.UserMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class UsersDao {

    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;
    ;

    public List<UserDtoAdmin> findAllOfAdmin() {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r;";
            return jdbcTemplate.query(sql, new UserDtoAdminMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    //Lay tat ca nguoi dung
    public List<UserDto> findAll() {
        sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date, r.description\n" +
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

    public int findUserIdByTrainerID(int trainerID) {
        try{
            sql = "SELECT id_u FROM trainer WHERE trainer_id = ?";
            return jdbcTemplate.queryForObject(sql,Integer.class,trainerID);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public List<User> findAllTrainer() {
        try{
            sql = "SELECT t.trainer_id, name, email, gender, phone, address, image, DOB, users.id_u FROM users JOIN trainer t on users.id_u = t.id_u";
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
                    user.setU_enable(resultSet.getInt("id_u"));
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

    public List<UserDto> findAllCustomer(int status, int pagination) {
        pagination = pagination*10 - 10;
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE r.id_r = 4 AND enabled = ? LIMIT ?,10;";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
                public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    UserDto userDto = new UserDto();
                    userDto.setU_id(resultSet.getInt("id_u"));
                    userDto.setU_full_name(resultSet.getString("name"));
                    userDto.setU_email(resultSet.getString("email"));
                    userDto.setU_img(resultSet.getString("image"));
                    userDto.setU_enable(resultSet.getInt("enabled"));
                    userDto.setU_dob(resultSet.getString("DOB"));
                    userDto.setU_phone_number(resultSet.getString("phone"));
                    userDto.setU_create_date(resultSet.getString("create_date"));
                    return userDto;
                }
            }, status, pagination);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<UserDto> findAllTrainerForAdmin() {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date, t.Year_of_experience\n" +
                    "FROM users \n" +
                    "join users_roles u on users.id_u = u.u_id \n" +
                    "join roles r on u.r_id = r.id_r \n" +
                    "JOIN trainer t ON users.id_u = t.id_u\n" +
                    "WHERE r.id_r = 3;";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
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
                    userDto.setT_experience(resultSet.getInt("Year_of_experience"));
                    return userDto;
                }
            });
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public UserDto findAnUserById(int id) {
        sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                "users.CMND,users, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.id_u = ?;";
        return jdbcTemplate.queryForObject(sql, new UserDtoMapper(), id);
    }

    public UserDto findAnUserByEmail(String username) {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.email = ?;";
            return jdbcTemplate.queryForObject(sql, new RowMapper<UserDto>() {
                public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    UserDto userDto = new UserDto();
                    userDto.setU_id(resultSet.getInt("id_u"));
                    userDto.setU_full_name(resultSet.getString("name"));
                    userDto.setU_email(resultSet.getString("email"));
                    userDto.setU_img(resultSet.getString("image"));
                    userDto.setR_id(resultSet.getInt("id_r"));
                    return userDto;
                }
            }, username);
        }catch (Exception e) {
            return null;
        }
    }

    public void createUser(UserDto userDto) {
        try{
            sql = "INSERT INTO users (id_u, name, email, password, enabled, gender, phone, address, image, CMND, create_date, DOB) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
            jdbcTemplate.update(sql, userDto.getU_id(), userDto.getU_full_name(),userDto.getU_email(), userDto.getU_password(),
                    1, userDto.getU_gender(), userDto.getU_phone_number(), userDto.getU_address(), userDto.getU_img(),
                    userDto.getU_identity_card(),dataUtil.getDateNowToString(),userDto.getU_dob());
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public User getNameAndImgByEmail(String userName) {
        try{
            sql = "SELECT id_u, name, image FROM users WHERE email = ?";
            return jdbcTemplate.queryForObject(sql, new RowMapper<User>() {
                public User mapRow(ResultSet resultSet, int i) throws SQLException {
                    User user = new User();
                    user.setU_id(Long.valueOf(resultSet.getInt("id_u")));
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

    public String getPasswordOfUser(String username) {
        try {
            sql = "SELECT password FROM users WHERE email = ?";
            return jdbcTemplate.queryForObject(sql, String.class, username);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public int getStatusOfUser(String username) {
        try {
            sql = "SELECT enabled FROM users WHERE email = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class, username);
        }catch (Exception e){
            e.printStackTrace();
            return -99;
        }
    }

    public void updatePasswordOfUser(String username, String pass) {
        try{
            sql = "UPDATE users SET password = ? WHERE email = ?";
            jdbcTemplate.update(sql, pass, username);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    //Lay tong so nguoi dung trong he thong
    public void saveCustomerForGoogle(int ids, String email, String picture, int enable) {
        try{
            sql = "INSERT INTO users (id_u, name, email, enabled,create_date) VALUES (?,?,?,?,?);";
            jdbcTemplate.update(sql, ids, email,email, 1, dataUtil.getDateNowToString());
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<User> findAllUserOfAnClass(int class_id) {
        try{
            sql = "SELECT u.id_u, u.email, u.name, u.password, u.phone, u.enabled, u.gender, u.address, u.CMND, u.image, u.DOB\n" +
                    "FROM users u\n" +
                    "JOIN user_class uc ON u.id_u = uc.user_id\n" +
                    "WHERE uc.class_id = ? AND uc.status = 1";
            return jdbcTemplate.query(sql, new UserMapper(), class_id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<Attendance> findAllAttendaneUserOfAnClass(int class_id) {
        try{
            sql = "SELECT * FROM attendance a WHERE a.class_id = ? AND a.attendance_date = DATE(NOW())";
            return jdbcTemplate.query(sql, new AttendanceMapper(), class_id);
        }catch (Exception e){
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

    public int createNewUser(User user) {
        sql = "INSERT INTO users (id_u,name, email,password, enabled, create_date) VALUES (?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, user.getU_id(), user.getU_full_name(), user.getU_email(), user.getU_password(), 0, dataUtil.getDateNowToString());
    }

    public void updateStatusUser(int id_u) {
        sql = "UPDATE users SET enabled = 1 WHERE id_u = ?";
        jdbcTemplate.update(sql,id_u);
    }

    public Integer getNumberUserInSystem(int status_num) {
        try{
            sql = "SELECT COUNT(*) FROM users join users_roles u on users.id_u = u.u_id WHERE r_id = 4 AND enabled = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class, status_num);
        }catch (Exception e){
            return 0;
        }
    }

    //Admin Employee
    // Đã sửa hiển thị tài khoản theo trạng thái
    public int getNumberEmployeeInSystem(int status) {
        try{
            sql = "SELECT COUNT(*) FROM users join users_roles u on users.id_u = u.u_id WHERE r_id = 2 AND enabled = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class, status);
        }catch (Exception e){
            return 0;
        }
    }

    public List<UserDto> findAllEmployee(int status, int pagination) {
        pagination = pagination*10 - 10;
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE r.id_r = 2 AND enabled = ? LIMIT ?,10;";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
                public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    UserDto userDto = new UserDto();
                    userDto.setU_id(resultSet.getInt("id_u"));
                    userDto.setU_full_name(resultSet.getString("name"));
                    userDto.setU_email(resultSet.getString("email"));
                    userDto.setU_img(resultSet.getString("image"));
                    userDto.setU_enable(resultSet.getInt("enabled"));
                    userDto.setU_dob(resultSet.getString("DOB"));
                    userDto.setU_phone_number(resultSet.getString("phone"));
                    userDto.setU_create_date(resultSet.getString("create_date"));
                    return userDto;
                }
            }, status, pagination);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public UserDto getEmployeeById(int employee_id) {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.password, users.gender, users.address, users.image,\n" +
                    "users.enabled, users.CMND, users.DOB,r.id_r, users.phone, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE users.id_u = ?;";
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
                    userDto.setR_id(resultSet.getInt("id_r"));
                    userDto.setU_identity_card(resultSet.getString("CMND"));
                    userDto.setU_dob(resultSet.getString("DOB"));
                    userDto.setU_phone_number(resultSet.getString("phone"));
                    userDto.setU_create_date(resultSet.getString("create_date"));
                    return userDto;
                }
            }, employee_id);
        }catch (Exception e) {
            return null;
        }
    }

    public List<UserDto> searchUser(String query) {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender,  users.image,\n" +
                    "users.DOB, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = 2 WHERE users.email LIKE '"+query+"%';";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
                public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {

                    UserDto userDto = new UserDto();
                    userDto.setU_id(resultSet.getInt("id_u"));
                    userDto.setU_full_name(resultSet.getString("name"));
                    userDto.setU_email(resultSet.getString("email"));
                    userDto.setU_img(resultSet.getString("image"));
                    userDto.setU_enable(resultSet.getInt("enabled"));
                    userDto.setU_dob(resultSet.getString("DOB"));
                    userDto.setU_phone_number(resultSet.getString("phone"));
                    userDto.setU_create_date(resultSet.getString("create_date"));

                    return userDto;
                }
            });
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<UserDto> searchEmployee(String query) {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender,  users.image,\n" +
                    "users.DOB, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id WHERE u.r_id = 2 AND users.email LIKE '%"+query+"%';";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
                public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {

                    UserDto userDto = new UserDto();
                    userDto.setU_id(resultSet.getInt("id_u"));
                    userDto.setU_full_name(resultSet.getString("name"));
                    userDto.setU_email(resultSet.getString("email"));
                    userDto.setU_img(resultSet.getString("image"));
                    userDto.setU_enable(resultSet.getInt("enabled"));
                    userDto.setU_dob(resultSet.getString("DOB"));
                    userDto.setU_phone_number(resultSet.getString("phone"));
                    userDto.setU_create_date(resultSet.getString("create_date"));

                    return userDto;
                }
            });
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int deleteAnUser(int id) {
        try {
            sql = "UPDATE users SET enabled = -1 WHERE id_u = ?";
            return jdbcTemplate.update(sql, id);
        }catch (Exception e) {
            return 0;
        }
    }

    public int getNumberTrainerInSystem(int status) {
        try{
            sql = "SELECT COUNT(*) FROM users join users_roles u on users.id_u = u.u_id WHERE r_id = 3 AND enabled = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class, status);
        }catch (Exception e){
            return 0;
        }
    }

    public List<UserDto> findAllTrainer(int status, int pagination) {
        pagination = pagination*10 - 10;
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE r.id_r = 3 AND enabled = ? LIMIT ?,10;";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
                public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    UserDto userDto = new UserDto();
                    userDto.setU_id(resultSet.getInt("id_u"));
                    userDto.setU_full_name(resultSet.getString("name"));
                    userDto.setU_email(resultSet.getString("email"));
                    userDto.setU_img(resultSet.getString("image"));
                    userDto.setU_enable(resultSet.getInt("enabled"));
                    userDto.setU_dob(resultSet.getString("DOB"));
                    userDto.setU_phone_number(resultSet.getString("phone"));
                    userDto.setU_create_date(resultSet.getString("create_date"));
                    return userDto;
                }
            }, status, pagination);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void updateUser(UserDto user) {
        try{
            sql = "UPDATE users SET name = ?, gender = ?, phone = ?, address = ?, CMND = ?, DOB = ? WHERE id_u = ?";
            jdbcTemplate.update(sql, user.getU_full_name(),user.getU_gender(), user.getU_phone_number(),
                    user.getU_address(), user.getU_identity_card(),user.getU_dob(),user.getU_id());
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateUserProfile(UserDto user) {
        try{
            sql = "UPDATE users SET name = ?, gender = ?, phone = ?, address = ?, CMND = ?, DOB = ?, image = ? WHERE id_u = ?";
            jdbcTemplate.update(sql, user.getU_full_name(),user.getU_gender(), user.getU_phone_number(),
                    user.getU_address(), user.getU_identity_card(),user.getU_dob(),user.getU_img(),user.getU_id());
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<UserDto> searchTrainer(String query) {
        try{
        sql = "SELECT users.id_u,users.name,users.email, users.gender,  users.image,\n" +
                "users.DOB, users.phone, users.enabled, users.create_date\n" +
                "FROM users join users_roles u on users.id_u = u.u_id WHERE u.r_id = 3 AND users.email LIKE '%"+query+"%';";
        return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
            public UserDto mapRow(ResultSet resultSet, int i) throws SQLException {

                UserDto userDto = new UserDto();
                userDto.setU_id(resultSet.getInt("id_u"));
                userDto.setU_full_name(resultSet.getString("name"));
                userDto.setU_email(resultSet.getString("email"));
                userDto.setU_img(resultSet.getString("image"));
                userDto.setU_enable(resultSet.getInt("enabled"));
                userDto.setU_dob(resultSet.getString("DOB"));
                userDto.setU_phone_number(resultSet.getString("phone"));
                userDto.setU_create_date(resultSet.getString("create_date"));

                return userDto;
            }
        });
    }catch (Exception e) {
        e.printStackTrace();
        return null;
    }
    }

    public int restoreAnUser(int id) {
        try {
            sql = "UPDATE users SET enabled = 1 WHERE id_u = ?";
            return jdbcTemplate.update(sql, id);
        }catch (Exception e) {
            return 0;
        }
    }

    public int getMaxIdUserInSystem() {
        try{
            sql = "SELECT MAX(id_u) FROM users";
            return jdbcTemplate.queryForObject(sql, Integer.class);
        }catch (Exception e){
            return 0;
        }
    }

    public List<UserDto> findAllCustomerEmployee() {
        try {
            sql = "SELECT users.id_u,users.name,users.email, users.gender, users.password, users.address, users.image,\n" +
                    "users.CMND, users.DOB,r.id_r, users.phone, users.enabled, users.create_date\n" +
                    "FROM users join users_roles u on users.id_u = u.u_id join roles r on u.r_id = r.id_r WHERE r.id_r = 4;";
            return jdbcTemplate.query(sql, new RowMapper<UserDto>() {
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
            });
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
