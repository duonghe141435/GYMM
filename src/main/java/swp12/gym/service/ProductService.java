package swp12.gym.service;

import swp12.gym.dto.ProductDto;
import swp12.gym.model.entity.Product;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {

    //===============One Object===============//

    //Get an tickets
    public Product findAnProduct(int id);

    //Create an tickets
    public void createProduct(Product product);

    //Update an tickets
    public void updateProduct(Product product);

    //Delete an Product(Lock Product)
    public void deleteProduct(int id_p);

    //===============Many Object===============//

    //Get all tickets
    public List<ProductDto> findAll();

    //Get all tickets for something
    public List<Product> findAllForAttribute();

    //Create many tickets for ...
    public void createManyProducts();

    //Delete many tickets for ...
    public int deleteManyProducts();
}
