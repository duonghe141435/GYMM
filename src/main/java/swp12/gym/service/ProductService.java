package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ProductDto;

import java.util.List;

@Service
public interface ProductService {
    List<ProductDto> findAll();

    int getNumberProductInSystem();

    void createProduct(ProductDto productDto);

    ProductDto findAnProduct(int id);

    void updateProduct(String p_img, String p_description, int p_kind, int p_unit, int p_id);

    List<ProductDto> searchProduct(String query);
}
