package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.ProductDtoMapper;

import java.util.List;


@Repository
public class ProductDtoDao {

    @Autowired
    JdbcTemplate jdbcTemplate;
    private String sql;

    public List<ProductDto> findAll() {
        sql = "SELECT p.product_id as p_id,\n" +
                "       p.name as p_name,\n" +
                "       p.image as p_img,\n" +
                "       p2.price as p_price,\n" +
                "       p2.price_Oprice as p_Oprice,\n" +
                "       p.added_date as p_create,\n" +
                "       p.quantity as p_quantity,\n" +
                "       u.unit_id as p_unit,\n" +
                "       u.name as p_unit_name,\n" +
                "       p.description as p_description,\n" +
                "       p.status as p_status,\n" +
                "       k.kind_id as p_kind,\n" +
                "       k.name as p_kind_name\n" +
                "FROM product p join unit u\n" +
                "         on p.unit_id = u.unit_id\n" +
                "               join kind k\n" +
                "         on p.kind_id = k.kind_id\n" +
                "                join price p2\n" +
                "         on p.product_id = p2.product_id";

        return jdbcTemplate.query(sql,new ProductDtoMapper());
    }

    public ProductDto findAnProduct(int id) {
        sql = "SELECT p.product_id as p_id,\n" +
                "    p.name as p_name,\n" +
                "    p.image as p_img,\n" +
                "    p2.price as p_price,\n" +
                "    p2.price_Oprice as p_Oprice,\n" +
                "    p.added_date as p_create,\n" +
                "    p.quantity as p_quantity,\n" +
                "    u.unit_id as p_unit,\n" +
                "    u.name as p_unit_name,\n" +
                "    p.description as p_description,\n" +
                "    p.status as p_status,\n" +
                "    k.kind_id as p_kind,\n" +
                "    k.name as p_kind_name\n" +
                "    FROM product p join unit u\n" +
                "    on p.unit_id = u.unit_id\n" +
                "    join kind k\n" +
                "    on p.kind_id = k.kind_id\n" +
                "    join price p2\n" +
                "    on p.product_id = p2.product_id WHERE p.product_id = ?";
        return jdbcTemplate.queryForObject(sql,new ProductDtoMapper(), id);
    }
}
