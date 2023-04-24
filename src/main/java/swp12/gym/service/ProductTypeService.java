package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.ProductType;

import java.util.List;

@Service
public interface ProductTypeService {
    List<ProductType> findAll();

    int getMaxIdKindInSystem();

    void createProductType(int id, String type);
}
