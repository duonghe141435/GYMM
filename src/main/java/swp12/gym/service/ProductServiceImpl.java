package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.ProductDao;
import swp12.gym.dao.ProductDtoDao;
import swp12.gym.dto.ProductDto;
import swp12.gym.model.entity.OrderDetail;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductDao productDao;

    @Autowired
    private ProductDtoDao productDtoDao;
    public List<ProductDto> findAll() {
        return productDtoDao.findAll();
    }

    public int getNumberProductInSystem() {
        return productDtoDao.getNumberProductInSystem();
    }

    public void createProduct(ProductDto productDto) {
        productDtoDao.createProduct(productDto);
    }

    public ProductDto findAnProduct(int id) {
        return null;
    }

    public void updateProduct(String p_img, String p_description, int p_kind, int p_unit, int p_id) {

    }

    public List<ProductDto> searchProduct(String query) {
        return productDtoDao.searchProduct(query);
    }

    public void updateQuantityProduct(List<OrderDetail> orderDetail) {
        productDao.updateQuantityProdcut(orderDetail);
    }
}
