package swp12.gym.dao;

import swp12.gym.model.entity.Product;
import swp12.gym.model.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void createProduct(Product product){
        sql = "INSERT INTO product (name, description, image, price, price_original, added_date, quantity, status, unit_id) " +
                "VALUES (?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql,product.getP_name(), product.getP_description(), product.getP_price(), product.getP_price_original(),
                product.getP_create_date(), product.getP_quantity(), product.isP_status(), product.getP_unit_id());
    }

    public void updateProdcut(Product product){
        sql = "UPDATE product SET id = ? WHERE product_id = ?";
        jdbcTemplate.update(sql, product.getP_id(),product.getP_id());
    }

    public Product findAnProduct(int id) {
        sql = "SELECT * FROM product WHERE product_id = ?";
        return jdbcTemplate.queryForObject(sql,new ProductMapper(),id);
    }
}
