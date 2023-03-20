package swp12.gym.model.mapper;

import swp12.gym.model.entity.Product;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<Product> {

    public Product mapRow(ResultSet resultSet, int i) throws SQLException {

        Product product = new Product();

        product.setP_id(resultSet.getInt("product_id"));
        product.setP_name(resultSet.getString("name"));
        product.setP_create_date(resultSet.getString("added_date"));
        product.setP_img(resultSet.getString("image"));
        product.setP_quantity(resultSet.getInt("quantity"));
        product.setP_status(resultSet.getBoolean("status"));
        product.setP_description(resultSet.getString("description"));
        product.setP_unit_id(resultSet.getInt("unit_id"));
        product.setP_kind_id(resultSet.getInt("kind_id"));
        product.setP_price(resultSet.getInt("price"));
        product.setP_price_original(resultSet.getInt("price_original"));
        product.setEnable(resultSet.getBoolean("enable"));

        return product;
    }
}
