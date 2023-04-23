package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Order;

@Service
public interface OrderService {
    int getIdOrder();

    boolean goSaveOrder(Order order);
}
