package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserPersonalTrainerDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void insertUserPersonal(long userID, int personalTrainerID, long ticketUserID){
        try{
            sql = "INSERT INTO user_personal_trainer (user_id, personal_trainer_id, status, ticket_user_id) VALUES (?,?,?,?)";
            jdbcTemplate.update(sql, userID, personalTrainerID, 0, ticketUserID);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
