package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.common.DataUtil;
import swp12.gym.dto.ProductDto;
import swp12.gym.dto.ProductDtoMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


@Repository
public class ProductDtoDao {

    @Autowired
    private DataUtil dataUtil;
    @Autowired
    JdbcTemplate jdbcTemplate;
    private String sql;

    public List<ProductDto> findAll() {
        sql = "SELECT p.product_id as p_id,\n" +
                "                p.name as p_name,\n" +
                "                p.image as p_img,\n" +
                "                p2.price_id as p_price_id,\n" +
                "                p2.price_sale as p_price,\n" +
                "                p2.price_oprice as p_Oprice,\n" +
                "                p.added_date as p_create,\n" +
                "                p.quantity as p_quantity,\n" +
                "                u.unit_id as p_unit,\n" +
                "                u.name as p_unit_name,\n" +
                "                p.description as p_description,\n" +
                "                p.status as p_status,\n" +
                "                k.kind_id as p_kind,\n" +
                "                k.name as p_kind_name\n" +
                "                FROM product p join unit u\n" +
                "                        on p.unit_id = u.unit_id\n" +
                "                               join kind k\n" +
                "                         on p.kind_id = k.kind_id\n" +
                "                                join price p2\n" +
                "                        on p.product_id = p2.product_id and p2.status = 1 and p.status = 1";

        return jdbcTemplate.query(sql,new ProductDtoMapper());
    }

    public ProductDto findAnProduct(int id) {
        sql = "SELECT p.product_id as p_id,\n" +
                "p.name as p_name,\n" +
                "p.image as p_img,\n" +
                "p2.price_id as p_price_id,\n" +
                "p2.price_sale as p_price,\n" +
                "p2.price_Oprice as p_Oprice,\n" +
                "p.added_date as p_create,\n" +
                "p.quantity as p_quantity,\n" +
                "u.unit_id as p_unit,\n" +
                "u.name as p_unit_name,\n" +
                "p.description as p_description,\n" +
                "p.status as p_status,\n" +
                "k.kind_id as p_kind,\n" +
                "k.name as p_kind_name\n" +
                "    FROM product p join unit u\n" +
                "    on p.unit_id = u.unit_id\n" +
                "    join kind k\n" +
                "    on p.kind_id = k.kind_id\n" +
                "    join price p2\n" +
                "    on p.product_id = p2.product_id and p2.status = 1 WHERE p.product_id = ?";
        return jdbcTemplate.queryForObject(sql,new ProductDtoMapper(), id);
    }

    public List<ProductDto> searchProduct(String query) {
        try {
            sql = "SELECT p.product_id as p_id,\n" +
                    "                p.name as p_name,\n" +
                    "                p.image as p_img,\n" +
                    "                p2.price_id as p_price_id,\n" +
                    "                p2.price_sale as p_price,\n" +
                    "                p2.price_Oprice as p_Oprice,\n" +
                    "                p.added_date as p_create,\n" +
                    "                p.quantity as p_quantity,\n" +
                    "                u.unit_id as p_unit,\n" +
                    "                u.name as p_unit_name,\n" +
                    "                p.description as p_description,\n" +
                    "                p.status as p_status,\n" +
                    "                k.kind_id as p_kind,\n" +
                    "                k.name as p_kind_name\n" +
                    "                FROM product p join unit u\n" +
                    "                        on p.unit_id = u.unit_id\n" +
                    "                               join kind k\n" +
                    "                         on p.kind_id = k.kind_id\n" +
                    "                                join price p2\n" +
                    "                        on p.product_id = p2.product_id and p2.status = 1 and p.status = 1 WHERE p.name LIKE '%"+query+"%';";
            return jdbcTemplate.query(sql, new ProductDtoMapper());
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void createProduct(ProductDto product){
        try{
            sql = "INSERT INTO product (product_id, name, description, image, added_date, quantity, status, unit_id, kind_id) " +
                    "VALUES (?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,product.getP_id(),product.getP_name(), product.getP_description(),
                    product.getP_img(),dataUtil.getDateNowToString() , product.getP_quantity(), 1, product.getP_unit(), product.getP_kind());
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public int getNumberProductInSystem() {
        sql = "SELECT MAX(product_id) as number_product FROM product";
        int number = jdbcTemplate.queryForObject(sql, new RowMapper<Integer>() {
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getInt("number_product");
            }
        });
        return number;
    }
}
