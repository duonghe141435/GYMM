package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.PriceDao;
import swp12.gym.model.entity.Price;

import java.util.List;

@Service
public class PriceServiceImpl implements PriceService{
    @Autowired
    private PriceDao priceDao;

    public void createAnPrice(float p_price, float p_oprice, int p_id) {
        priceDao.createAnPrice(p_price, p_oprice,p_id);
    }

    public List<Price> getPriceAnProduct(int id) {
        return priceDao.getPriceAnProduct(id);
    }

    public void updatePrice(int p_price_id) {
        priceDao.updatePrice(p_price_id);
    }
}
