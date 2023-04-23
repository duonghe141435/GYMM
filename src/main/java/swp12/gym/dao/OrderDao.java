package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.Order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

@Repository
public class OrderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    private final LocalDate currentDate = LocalDate.now();

    public int getIdOrder() {
        try{
            sql = "SELECT order_id FROM `order` GROUP BY order_id DESC LIMIT 1";
            Order order = jdbcTemplate.queryForObject(sql, new RowMapper<Order>() {
                public Order mapRow(ResultSet resultSet, int i) throws SQLException {
                    Order order = new Order();
                    order.setOrder_id(resultSet.getInt("order_id"));
                    return order;
                }
            });
            return order.getOrder_id();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public void insertAnOrder(Order order){
        try{
            sql = "INSERT INTO `order` (order_date, status, total_amount, staff, customer, discount, total_payment, customer_paying, `change`, `code`) VALUES(?,?,?,?,?,?,?,?,?,?);";
            jdbcTemplate.update(sql, currentDate, 1, order.getTotal_amount(), order.getStaff_id(), order.getCustomer_id(), order.getDiscount(), order.getTotal_payment(), order.getCustomer_paying(), order.getChange(), order.getCode());

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
