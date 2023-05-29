package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ProductDto;
import swp12.gym.model.entity.OrderDetail;

import java.util.List;

@Service
public interface ProductService {
    List<ProductDto> findAll();

    int getNumberProductInSystem();

    void createProduct(ProductDto productDto);

    ProductDto findAnProduct(int id);

    void updateProduct(ProductDto productDto, String u_img);

    List<ProductDto> searchProduct(String query);

    void updateQuantityProduct(List<OrderDetail> orderDetail);

    int getNumberProductInSystemAdmin(int status_num);

    List<ProductDto> findListProduct(int pagination_value, int status_num);

    List<ProductDto> searchProductAdmin(String query);
}
