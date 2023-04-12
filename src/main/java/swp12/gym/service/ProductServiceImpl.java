package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ProductDto;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{
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
