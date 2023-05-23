package swp12.gym.dao;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.common.DataUtil;
import swp12.gym.model.entity.Price;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class PriceDao {

    @Autowired
    DataUtil dataUtil;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void updatePrice(int id_price) {
        sql = "UPDATE price SET end_date = ?, status = 0 WHERE price_id = ?";
        jdbcTemplate.update(sql, dataUtil.getDateNowToString(), id_price);
    }

    public void createAnPrice(float p_price, float p_oprice, int p_id) {
        sql = "INSERT INTO price (price_sale, price_Oprice, start_date, end_date, product_id, status) " +
                "VALUES (?,?,?,?,?,?)";
        jdbcTemplate.update(sql, p_price, p_oprice, dataUtil.getDateNowToString(), null, p_id, 1);
    }

    public List<Price> getPriceAnProduct(int p_id) {
        sql = "SELECT * FROM price WHERE product_id = ?";
        return jdbcTemplate.query(sql, new RowMapper<Price>() {
            public Price mapRow(ResultSet resultSet, int i) throws SQLException {
                Price price = new Price();
                price.setPri_id(resultSet.getInt("price_id"));
                price.setPri_value(resultSet.getInt("price"));
                price.setPri_start_date(resultSet.getString("start_date"));
                price.setPri_end_date(resultSet.getString("end_date"));
                price.setPri_status(resultSet.getBoolean("status"));
                return price;
            }
        }, p_id);
    }
}

