package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.OrderDao;
import swp12.gym.model.entity.Order;

@Service
public class OrderServiceImpl implements OrderService{
//    OrderDao orderDao = new OrderDao();

    @Autowired
    OrderDao orderDao;

    public int getIdOrder() {
        return orderDao.getIdOrder();
    }

    public boolean goSaveOrder(Order order) {
        orderDao.insertAnOrder(order);
        return false;
    }
}
