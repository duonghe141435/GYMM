package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.Time;
import swp12.gym.model.mapper.TimeMapper;

import java.util.List;

@Repository
public class TimeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;


    public List<Time> findAll() {
        try {
            sql = "SELECT * FROM time";
            return jdbcTemplate.query(sql, new TimeMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}