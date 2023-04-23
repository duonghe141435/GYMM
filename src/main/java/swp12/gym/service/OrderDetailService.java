package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.OrderDetail;

import java.util.List;

@Service
public interface OrderDetailService {

    boolean goSaveOrderDetail(List<OrderDetail> orderDetail);
}
