package swp12.gym.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.ProductDto;
import swp12.gym.model.entity.Product;
import swp12.gym.model.mapper.ProductMapper;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

@Repository
public class ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;
    private final LocalDate currentDate = LocalDate.now();

    public void createProduct(ProductDto product){
        try{
            sql = "INSERT INTO product (product_id, name, description, image, added_date, quantity, status, unit_id, kind_id) " +
                    "VALUES (?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,product.getP_id(),product.getP_name(), product.getP_description(),
                    product.getP_img(), currentDate, product.getP_quantity(), 1, product.getP_unit(), product.getP_kind());
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateProdcut(String img, String des, int id_k, int id_un, int id_p){
        sql = "UPDATE product SET image = ?, description = ?, kind_id = ?, unit_id = ? WHERE product_id = ?";
        jdbcTemplate.update(sql,img,des,id_k, id_un, id_p);
    }

    public Product findAnProduct(int id) {
        sql = "SELECT * FROM product WHERE product_id = ?";
        return jdbcTemplate.queryForObject(sql,new ProductMapper(),id);
    }

    public Product searchProduct(String name) {
        sql = "SELECT * FROM product WHERE name LIKE ?";
        return jdbcTemplate.queryForObject(sql,new ProductMapper(), name);
    }

    public int getNumberProductInSystem() {
        sql = "SELECT COUNT(*) as number_product FROM product";
        int number = jdbcTemplate.queryForObject(sql, new RowMapper<Integer>() {
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getInt("number_product");
            }
        });
        return number;
    }

    public void deleteProduct(int id_p) {
        sql = "UPDATE product SET status = 0 WHERE product_id = ?";
        jdbcTemplate.update(sql, id_p);
    }
}

