package swp12.gym.dto;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDtoMapper implements RowMapper<ProductDto> {
    public ProductDto mapRow(ResultSet resultSet, int i) throws SQLException {

        ProductDto productDto = new ProductDto();

        productDto.setP_id(resultSet.getInt("p_id"));
        productDto.setP_name(resultSet.getString("p_name"));
        productDto.setP_img(resultSet.getString("p_img"));
        productDto.setP_price(resultSet.getFloat("p_price"));
        productDto.setP_price_id(resultSet.getInt("p_price_id"));
        productDto.setP_Oprice(resultSet.getFloat("p_Oprice"));
        productDto.setP_create(resultSet.getString("p_create"));
        productDto.setP_quantity(resultSet.getInt("p_quantity"));
        productDto.setP_unit(resultSet.getInt("p_unit"));
        productDto.setP_unit_name(resultSet.getString("p_unit_name"));
        productDto.setP_description(resultSet.getString("p_description"));
        productDto.setP_status(resultSet.getBoolean("p_status"));
        productDto.setP_kind(resultSet.getInt("p_kind"));
        productDto.setP_kind_name(resultSet.getString("p_kind_name"));

        return productDto;
    }
}
