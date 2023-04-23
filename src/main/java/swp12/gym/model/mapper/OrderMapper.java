package swp12.gym.model.mapper;

import org.springframework.jdbc.core.RowMapper;
import swp12.gym.model.entity.Order;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderMapper implements RowMapper<Order> {

    public Order mapRow(ResultSet resultSet, int i) throws SQLException {

        Order order = new Order();

        order.setOrder_id(resultSet.getInt("order_id"));
        order.setCode(resultSet.getString("code"));
        order.setOrder_date(resultSet.getString("order_date"));
        order.setStatus(resultSet.getInt("status"));
        order.setTotal_amount(resultSet.getInt("total_amount"));
        order.setDiscount(resultSet.getInt("discount"));
        order.setTotal_payment(resultSet.getInt("total_payment"));
        order.setCustomer_paying(resultSet.getInt("customer_paying"));
        order.setChange(resultSet.getInt("change"));
        order.setStaff_id(resultSet.getInt("staff"));
        order.setCustomer_id(resultSet.getInt("customer"));

        return order;
    }
}
