package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.ProductDto;
import swp12.gym.model.entity.OrderDetail;
import swp12.gym.model.entity.Product;
import swp12.gym.model.entity.Unit;
import swp12.gym.model.mapper.ProductMapper;
import swp12.gym.model.mapper.UnitMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

@Repository
public class ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<Unit> findAll(){
        sql = "SELECT * FROM unit WHERE status = 1";
        return jdbcTemplate.query(sql, new UnitMapper());
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
        sql = "SELECT MAX(product_id) as number_product FROM product";
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

    public void updateQuantityProdcut(List<OrderDetail> orderDetail){
        StringBuffer sql = new StringBuffer("UPDATE product SET quantity = quantity - \n" +
                "CASE product_id \n");
        for (OrderDetail listOrderDetail: orderDetail) {
            sql.append("WHEN " + listOrderDetail.getProduct_id() + " THEN " + listOrderDetail.getQuantity() + "\n");
        }
        sql.append("END" + "\n");
        sql.append("WHERE product_id IN (" );
        for (OrderDetail orderDetails: orderDetail) {
            sql.append(orderDetails.getProduct_id() + ",");
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(");");
        String sqlRs = sql.substring(0, sql.length());
        jdbcTemplate.update(sqlRs);
    }

    public void updateProduct(ProductDto productDto, String u_img){
        sql = "UPDATE product \n" +
                "SET name = ?, \n" +
                "    image = ?, \n" +
                "    quantity = ?, \n" +
                "    description = ?, \n" +
                "    unit_id = ?, \n" +
                "    kind_id = ? \n" +
                "WHERE product_id = ?;";
        jdbcTemplate.update(sql, productDto.getP_name(), u_img, productDto.getP_quantity(), productDto.getP_description(), productDto.getP_unit(), productDto.getP_kind(), productDto.getP_id());
    }

    public void createUnit(int id, String type) {
        sql = "INSERT INTO unit(unit_id, name, status) VALUES (?,?,1)";
        jdbcTemplate.update(sql,id,type);
    }

    public int getNumberUnitInSystem() {
        sql = "SELECT MAX(unit_id) FROM unit";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }
}

