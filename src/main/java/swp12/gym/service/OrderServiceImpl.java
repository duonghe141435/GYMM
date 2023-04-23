package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService{
    OrderDao orderDao = new OrderDao();

    public int getIdOrder() {
        return orderDao.getIdOrder();
    }
}
