package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.OrderDao;
import swp12.gym.dto.OrderDto;
import swp12.gym.model.entity.Order;
import swp12.gym.model.entity.OrderDetail;

import java.util.List;

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

    public List<OrderDto> getAllOrderOfEmployee(int id) {
        return orderDao.getAllOrderOfEmployee(id);
    }

    public List<OrderDetail> getDetailOfAnOrder(int id) {
        return orderDao.getDetailOfAnOrder(id);
    }

    public List<Order> findAllOrderOfAnUserById(int id) {
        return orderDao.getAllOrderOfAnUserById(id);
    }
}
