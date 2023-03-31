package swp12.gym.model.mapper;

import swp12.gym.model.entity.ProductType;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductTypeMapper {

    public ProductType mapRow(ResultSet resultSet, int i) throws SQLException {
        ProductType productType = new ProductType();

        productType.setKind_id(resultSet.getInt("kind_id"));
        productType.setName(resultSet.getString("name"));
        return productType;
    }
}
