package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public int getIdOrder() {
        try{
            sql = "SELECT order_id FROM `order` GROUP BY order_id DESC";
            int number = jdbcTemplate.queryForObject(sql, Integer.class);
            return number;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
