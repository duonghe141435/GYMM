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
        return productDtoDao.findAnProduct(id);
    }

    public void updateProduct(ProductDto productDto, String u_img) {
        productDao.updateProduct(productDto, u_img);
    }

    public List<ProductDto> searchProduct(String query) {
        return productDtoDao.searchProduct(query);
    }

    public void updateQuantityProduct(List<OrderDetail> orderDetail) {
        productDao.updateQuantityProdcut(orderDetail);
    }

    public int getNumberProductInSystemAdmin(int status_num) {
        return productDtoDao.getNumberProductInSystemAdmin(status_num);
    }

    public List<ProductDto> findListProduct(int pagination_value, int status_num) {
        return productDtoDao.findListProduct(pagination_value, status_num);
    }

    public List<ProductDto> searchProductAdmin(String query) {
        return productDtoDao.searchProductAdmin(query);
    }

    public void deleteProductForAdmin(String id) {
        productDtoDao.deleteProductForAdmin(id);
    }

    public void restoreProductForAdmin(String id) {
        productDtoDao.restoreProductForAdmin(id);
    }


}
