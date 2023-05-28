package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Price;

import java.util.List;

@Service
public interface PriceService {
    void createAnPrice(float p_price, float p_oprice, int p_id);

    List<Price> getPriceAnProduct(int id);

    Price getAnPriceAnProduct(int id);

    void updatePrice(int p_price_id);
}
