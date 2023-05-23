package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.ProductDao;
import swp12.gym.model.entity.Unit;

import java.util.List;

@Service
public class UnitServiceImpl implements UnitService{

    @Autowired
    private ProductDao productDao;
    public List<Unit> findAll() {
        return productDao.findAll();
    }

    public int getTotalItemInSystem() {
        return productDao.getNumberUnitInSystem();
    }

    public void createUnit(int id, String type) {
        productDao.createUnit(id, type);
    }
}
