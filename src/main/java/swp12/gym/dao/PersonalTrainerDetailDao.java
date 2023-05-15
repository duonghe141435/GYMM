package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.PersonalTrainerDetail;
import swp12.gym.model.mapper.PersonalTrainerDetailMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class PersonalTrainerDetailDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<PersonalTrainerDetail> findAllPersonalOfAnUserById(int user_id){
        sql = "SELECT * FROM personal_trainer_detail WHERE personal_trainer_detail.user_id = ?";
        return jdbcTemplate.query(sql, new PersonalTrainerDetailMapper(), user_id);
    }

    public List<PersonalTrainerDetail> findAllSchedulePersonalOfAnTrainer(int user_id){
//        sql = "SELECT ptd.personal_trainer_detail_id, ptd.current_date, ptd.status, ptd.note, ptd.personal_trainer_id, ptd.time_id, ptd.user_id, tk.name\n" +
//                "FROM personal_trainer_detail ptd\n" +
//                "JOIN personal_trainer pt ON ptd.personal_trainer_id = pt.personal_trainer_id\n" +
//                "JOIN trainer t ON pt.trainer_id = t.trainer_id\n" +
//                "JOIN users u ON t.id_u = u.id_u\n" +
//                "JOIN ticket tk ON pt.ticket_id = tk.id_t\n" +
//                "WHERE u.id_u = ?";
        sql = "SELECT ptd.personal_trainer_detail_id, ptd.current_date, ptd.status, ptd.note, ptd.personal_trainer_id, ptd.time_id, ptd.user_id, tk.name,\n" +
                "(SELECT u.name FROM users u JOIN personal_trainer_detail ptd_sub ON u.id_u = ptd_sub.user_id WHERE ptd_sub.personal_trainer_detail_id = ptd.personal_trainer_detail_id) AS email\n" +
                "FROM personal_trainer_detail ptd\n" +
                "JOIN personal_trainer pt ON ptd.personal_trainer_id = pt.personal_trainer_id\n" +
                "JOIN trainer t ON pt.trainer_id = t.trainer_id\n" +
                "JOIN users u ON t.id_u = u.id_u\n" +
                "JOIN ticket tk ON pt.ticket_id = tk.id_t\n" +
                "WHERE u.id_u = ?";
        return jdbcTemplate.query(sql, new RowMapper<PersonalTrainerDetail>() {
            public PersonalTrainerDetail mapRow(ResultSet resultSet, int i) throws SQLException {
                PersonalTrainerDetail personalTrainerDetail = new PersonalTrainerDetail();
                personalTrainerDetail.setPersonal_trainer_detail_id(resultSet.getInt("personal_trainer_detail_id"));
                personalTrainerDetail.setCurrent_date(resultSet.getString("current_date"));
                personalTrainerDetail.setStatus(resultSet.getInt("status"));
                personalTrainerDetail.setNote(resultSet.getString("note"));
                personalTrainerDetail.setPersonal_trainer_id(resultSet.getInt("personal_trainer_id"));
                personalTrainerDetail.setTime_id(resultSet.getInt("time_id"));
                personalTrainerDetail.setUser_id(resultSet.getInt("user_id"));
                personalTrainerDetail.setTicket_name(resultSet.getString("name"));
                personalTrainerDetail.setU_email(resultSet.getString("email"));
                return personalTrainerDetail;
            }
        }, user_id);
    }
}
