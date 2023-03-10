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
        sql = "INSERT INTO product (name, title, image, price, original_price, create_date, quantity, status, unit_id) " +
                "VALUES (?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql,product.getP_name(), product.getP_title(), product.getP_price(), product.getP_price_original(),
                product.getP_create_date(), product.getP_quantity(), product.isP_status(), product.getP_unit_id());
    }

    public void updateProdcut(Product product){
        sql = "UPDATE product SET id = ? WHERE id = ?";
        jdbcTemplate.update(sql, product.getP_id(),product.getP_id());
    }


    public List<Product> getListProductDemo(){
       List<Product> products = new ArrayList<Product>();
       products.add(new Product(1,"Nuoc tang luc sting","Sting","10/01/2000","demo_img",1,
               10,10000,12000,true));
        products.add(new Product(2,"Nuoc tang luc number one","Sting","10/01/2000","demo_img",1,
                10,10000,12000,true));
        products.add(new Product(3,"Nuoc tang luc rong do","Sting","10/01/2000","demo_img",1,
                10,10000,12000,true));
        products.add(new Product(4,"Nuoc tang luc one one","Sting","10/01/2000","demo_img",1,
                10,10000,12000,true));
        products.add(new Product(5,"Nuoc tang luc demo","Sting","10/01/2000","demo_img",1,
                10,10000,12000,true));
       return products;
    }


    public Product findAnProduct(int id) {
        sql = "SELECT * FROM product WHERE id = ?";
        return jdbcTemplate.queryForObject(sql,new ProductMapper(),id);
    }
}
