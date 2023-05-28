package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.Price;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PriceMapper implements RowMapper<Price> {
    public Price mapRow(ResultSet resultSet, int i) throws SQLException {
        Price price = new Price();
        price.setPri_id(resultSet.getInt("price_id"));
        price.setPri_sale(resultSet.getInt("price_sale"));
        price.setPri_oprice(resultSet.getInt("price_Oprice"));
        price.setPri_start_date(resultSet.getString("start_date"));
        price.setPri_end_date(resultSet.getString("end_date"));
        price.setPri_status(resultSet.getBoolean("status"));
        price.setProduct_id(resultSet.getInt("product_id"));
        return price;
    }
}
