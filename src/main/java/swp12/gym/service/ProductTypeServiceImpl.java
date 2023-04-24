package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.ProductTypeDao;
import swp12.gym.model.entity.ProductType;

import java.util.List;

@Service
public class ProductTypeServiceImpl implements ProductTypeService{

    @Autowired
    private ProductTypeDao productTypeDao;

    public List<ProductType> findAll() {
        return productTypeDao.findAll();
    }

    public int getMaxIdKindInSystem() {
        return productTypeDao.getMaxIdKindInSystem();
    }

    public void createProductType(int id, String type) {
        productTypeDao.createAnProductType(id,type);
    }
}
