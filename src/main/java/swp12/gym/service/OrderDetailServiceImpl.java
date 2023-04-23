package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.OrderDetailDao;
import swp12.gym.model.entity.OrderDetail;

import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{

    @Autowired
    private OrderDetailDao orderDetailDao;

    public boolean goSaveOrderDetail(List<OrderDetail> orderDetail) {
        orderDetailDao.insertOrderDetail(orderDetail);
        return false;
    }
}
