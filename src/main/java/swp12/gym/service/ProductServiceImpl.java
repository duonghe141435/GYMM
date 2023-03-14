package swp12.gym.service;

import swp12.gym.dao.ProductDao;
import swp12.gym.dao.ProductDtoDao;
import swp12.gym.dto.ProductDto;
import swp12.gym.model.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductDao productDao;

    @Autowired
    private ProductDtoDao productDtoDao;

    public Product findAnProduct(int id) {
        return productDao.findAnProduct(id);
    }

    public void createProduct(Product product) {

    }

    public void updateProduct(Product product) {
        productDao.updateProdcut(product);
    }

    public void deleteProduct(int id_p) {

    }

    public List<ProductDto> findAll() {
        return productDtoDao.findAll();
    }

    public List<Product> findAllForAttribute() {
        return null;
    }

    public void createManyProducts() {

    }

    public int deleteManyProducts() {
        return 0;
    }
}
