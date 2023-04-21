package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.PersonalTrainerDetail;
import swp12.gym.model.mapper.PersonalTrainerDetailMapper;

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
}
