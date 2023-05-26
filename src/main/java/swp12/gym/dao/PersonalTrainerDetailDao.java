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

    public String checkPersonalTrainerDetail(int userID, String date) {
        try{
            sql = "SELECT EXISTS (\n" +
                    "    SELECT 1\n" +
                    "    FROM personal_trainer_detail ptd\n" +
                    "    WHERE ptd.current_date = ? AND ptd.user_id = ?\n" +
                    ") AS isExpired;";

            String isExpired = jdbcTemplate.queryForObject(sql, String.class, date, userID);
            return isExpired;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void insertPersonalTrainerDetail(List<String> date, int status, int personal_trainer_id, int time_id, int userID){
        try{
//            sql = "INSERT INTO personal_trainer_detail (`current_date`, status, personal_trainer_id, time_id, user_id) VALUES (?,?,?,?,?)";
//            jdbcTemplate.update(sql, date, status, personal_trainer_id, time_id, userID);

            StringBuffer sql = new StringBuffer("INSERT INTO personal_trainer_detail (`current_date`, status, personal_trainer_id, time_id, user_id) VALUES");
            for (String item : date) {
                sql.append("(" + "'" + item + "'" + "," + status + "," + personal_trainer_id + "," + time_id + "," + userID + ")");
                sql.append(",");
            }
            String sqlRs = sql.substring(0, sql.length()-1);
            System.out.println("database sql: " + sqlRs);
            jdbcTemplate.update(sqlRs);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int checkPersonalTrainerDetailForBookSchedule(int userID, List<String> date) {
        try{
            StringBuffer sql = new StringBuffer("SELECT COUNT(*) AS count FROM personal_trainer_detail ptd WHERE ptd.user_id = 4 AND (");
            for (String item : date) {
                sql.append("ptd.current_date = '" + item + "' OR ");
            }
            sql.delete(sql.length() - 4, sql.length());
            sql.append(")");
            String sqlRs = sql.toString();
            int number = jdbcTemplate.queryForObject(sqlRs, Integer.class);
            return number;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
