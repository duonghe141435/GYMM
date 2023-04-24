package swp12.gym.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import swp12.gym.model.entity.OrderDetail;
import swp12.gym.service.OrderService;

import java.util.List;

@RestController
public class OrderAPIOfAdmin {
    private final String URL_API = "/admin/order-management";

    @Autowired
    OrderService orderService;

    @GetMapping(value = URL_API+"/{id}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<OrderDetail>> createProductType(@PathVariable int id) {
        try {
            List<OrderDetail> orderDetail = orderService.getDetailOfAnOrder(id);
            return new ResponseEntity<List<OrderDetail>>(orderDetail, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<List<OrderDetail>>(HttpStatus.BAD_REQUEST);
        }
    }
}
