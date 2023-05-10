package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.ProductType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ProductTypeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<ProductType> findAll() {
        sql = "SELECT * FROM kind";
        return jdbcTemplate.query(sql, new RowMapper<ProductType>() {
            public ProductType mapRow(ResultSet resultSet, int i) throws SQLException {
                ProductType productType = new ProductType();

                productType.setKind_id(resultSet.getInt("kind_id"));
                productType.setName(resultSet.getString("name"));
                return productType;
            }
        });
    }


    public int getMaxIdKindInSystem() {
        sql = "SELECT MAX(kind_id) FROM kind";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public void createAnProductType(int id,String name) {
        sql = "INSERT INTO kind (kind_id,name, status) VALUES (?,?,1)";
        jdbcTemplate.update(sql,id,name);
    }
}
