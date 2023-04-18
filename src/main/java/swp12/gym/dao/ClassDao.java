package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.ClassDto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ClassDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void insertUserClass(long userID, int class_id, long ticketUserID){
        try{
            sql = "INSERT INTO user_class (user_id, class_id, status, ticket_user_id) VALUES (?,?,?,?)";
            jdbcTemplate.update(sql, userID, class_id, 0, ticketUserID);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<ClassDto> findAllClass() {
        sql = "SELECT c.class_id as class_id, c.name AS c_name, c.create_date AS c_create_date, c.time_id as c_time_id, c.state as c_status,\n" +
                "       c.start_date as c_start_date, c.end_date as c_end_date, c.max_menber as max_member, c.price as c_price, c.trainer_id as c_trainer_id,\n" +
                "       u.name as c_trainer_name, c.ticket_id as c_ticket_id, tm.start_time, tm.end_time, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees\n" +
                "FROM class c\n" +
                "       JOIN ticket tk ON c.ticket_id = tk.id_t\n" +
                "       JOIN trainer tn ON c.trainer_id = tn.trainer_id\n" +
                "       JOIN users u ON tn.id_u = u.id_u\n" +
                "       JOIN time tm ON c.time_id = tm.id_time\n" +
                "       LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                "GROUP BY c.ticket_id, uc.class_id, c.max_menber";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();

                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_time_id(resultSet.getInt("c_time_id"));
                classDto.setC_status(resultSet.getInt("c_status"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setMax_member(resultSet.getInt("max_member"));
                classDto.setC_price(resultSet.getInt("c_price"));
                classDto.setC_trainer_id(resultSet.getInt("c_trainer_id"));
                classDto.setC_trainer_name(resultSet.getString("c_trainer_name"));
                classDto.setC_ticket_id(resultSet.getInt("c_ticket_id"));
                classDto.setStart_time(resultSet.getString("start_time"));
                classDto.setEnd_time(resultSet.getString("end_time"));
                classDto.setTotal_attendees(resultSet.getInt("total_attendees"));
                classDto.setC_create_date(resultSet.getString("c_create_date"));

                return classDto;
            }
        });
    }

    public List<ClassDto> findAllClassOfAnUserById(int user_id){
        sql = "SELECT c.class_id as class_id, c.name as c_name, u.value_cost as c_price, u.date_payment as c_create_date," +
                "u.payment_status as c_status, c.start_date as c_start_date, c.end_date as c_end_date FROM user_class\n" +
                "join ticket_user u on user_class.ticket_user_id = u.ticket_user_id\n" +
                "join class c on user_class.class_id = c.class_id\n" +
                "WHERE user_class.user_id = ?";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();

                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_status(resultSet.getInt("c_status"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setC_price(resultSet.getInt("c_price"));
                classDto.setC_create_date(resultSet.getString("c_create_date"));

                return classDto;
            }
        }, user_id);
    }

    public List<ClassDto> findAllScheduleClassOfAnUserById(int user_id){
        sql = "SELECT c.class_id as class_id, c.name as c_name, c.start_date as c_start_date, c.end_date as c_end_date, c.time_id as c_time_id, tm.start_time, tm.end_time\n" +
                "FROM class c\n" +
                "join user_class uc on uc.class_id = c.class_id\n" +
                "JOIN `time` tm ON c.time_id = tm.id_time\n" +
                "WHERE uc.user_id = ?";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();
                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setC_time_id(resultSet.getInt("c_time_id"));
                classDto.setStart_time(resultSet.getString("start_time"));
                classDto.setEnd_time(resultSet.getString("end_time"));
                return classDto;
            }
        }, user_id);
    }

    public List<ClassDto> findAllClassOfAnTicket(int id) {
        sql = "SELECT c.class_id as class_id, c.name AS c_name, c.create_date AS c_create_date, c.time_id as c_time_id, c.state as c_status,\n" +
                "       c.start_date as c_start_date, c.end_date as c_end_date, c.max_menber as max_member, c.price as c_price, c.trainer_id as c_trainer_id,\n" +
                "       u.name as c_trainer_name, c.ticket_id as c_ticket_id, tm.start_time, tm.end_time, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees\n" +
                "FROM class c\n" +
                "       JOIN ticket tk ON c.ticket_id = tk.id_t\n" +
                "       JOIN trainer tn ON c.trainer_id = tn.trainer_id\n" +
                "       JOIN users u ON tn.id_u = u.id_u\n" +
                "       JOIN time tm ON c.time_id = tm.id_time\n" +
                "       LEFT JOIN user_class uc ON c.class_id = uc.class_id WHERE ticket_id = ? \n" +
                "GROUP BY c.ticket_id, uc.class_id, c.max_menber";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_status(resultSet.getInt("c_status"));
                classDto.setC_price(resultSet.getInt("c_price"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setMax_member(resultSet.getInt("max_member"));
                classDto.setTotal_attendees(resultSet.getInt("total_attendees"));
                return classDto;
            }
        }, id);
    }
}
