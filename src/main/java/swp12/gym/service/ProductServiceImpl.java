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

    public List<ProductDto> findAll() {
        return null;
    }

    public int getNumberProductInSystem() {
        return 0;
    }

    public void createProduct(ProductDto productDto) {

    }

    public ProductDto findAnProduct(int id) {
        return null;
    }

    public void updateProduct(String p_img, String p_description, int p_kind, int p_unit, int p_id) {

    }
}
