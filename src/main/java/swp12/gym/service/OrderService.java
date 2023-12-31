package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.OrderDto;
import swp12.gym.model.entity.Order;
import swp12.gym.model.entity.OrderDetail;

import java.util.List;

@Service
public interface OrderService {
    int getIdOrder();

    boolean goSaveOrder(Order order);

    List<OrderDto> getAllOrderOfEmployee(int id);

    List<OrderDetail> getDetailOfAnOrder(int id);

    List<Order> findAllOrderOfAnUserById(int id);

    int getNumberOrderOfAnCustomer(int customer_id);

    List<Order> findAllOrderOfAnStaffId(int id);
}
