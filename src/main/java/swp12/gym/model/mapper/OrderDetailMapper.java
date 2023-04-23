package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.OrderDetail;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDetailMapper implements RowMapper<OrderDetail> {
    public OrderDetail mapRow(ResultSet resultSet, int i) throws SQLException {

        OrderDetail orderDetail = new OrderDetail();

        orderDetail.setQuantity(resultSet.getInt("quantity"));
        orderDetail.setPrice_sale(resultSet.getInt("price_sale"));
        orderDetail.setPrice_original(resultSet.getInt("price_original"));
        orderDetail.setOrder_id(resultSet.getInt("order_id"));
        orderDetail.setProduct_id(resultSet.getInt("product_id"));
        orderDetail.setTotal_price(resultSet.getInt("total_price"));

        return orderDetail;
    }
}
