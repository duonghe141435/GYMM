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

        return null;
    }
}
