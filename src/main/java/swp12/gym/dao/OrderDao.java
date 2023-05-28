package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.common.DataUtil;
import swp12.gym.dto.OrderDto;
import swp12.gym.model.entity.Order;
import swp12.gym.model.entity.OrderDetail;
import swp12.gym.model.mapper.OrderMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class OrderDao {

    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

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
            jdbcTemplate.update(sql, dataUtil.getDateNowToString(), 1, order.getTotal_amount(), order.getStaff_id(), order.getCustomer_id(), order.getDiscount(), order.getTotal_payment(), order.getCustomer_paying(), order.getChange(), order.getCode());

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<OrderDto> getAllOrderOfEmployee(int id) {
        try{
            sql = "SELECT `order`.order_id as order_id, `order`.code as code, " +
                    "`order`.total_amount as total_amount, `order`.order_date as order_date, u.name as name\n" +
                    "from `order` join order_details on order_details.order_id = `order`.order_id\n" +
                    "             join users u on `order`.customer = u.id_u\n" +
                    "             join  users u2 on `order`.staff = u2.id_u\n" +
                    "WHERE u2.id_u = ?\n" +
                    "GROUP BY `order`.order_id DESC, `order`.code, `order`.order_date, u.name";
            return jdbcTemplate.query(sql, new RowMapper<OrderDto>() {
                public OrderDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    OrderDto orderDto = new OrderDto();
                    orderDto.setOrder_id(resultSet.getInt("order_id"));
                    orderDto.setOrder_code(resultSet.getString("code"));
                    orderDto.setCustomer_name(resultSet.getString("name"));
                    orderDto.setOrder_date(resultSet.getString("order_date"));
                    orderDto.setTotal_price(resultSet.getInt("total_amount"));
                    return orderDto;
                }
            }, id);
        }catch (Exception e){
            return null;
        }
    }

    public List<Order> findAllOrderOfAnStaffId(int id) {
        try{
            sql = "SELECT `order`.order_id as order_id, `order`.code as code, `order`.`order_date` AS order_date, `order`.`status` AS status,\n" +
                    "`order`.total_amount as total_amount, `order`.`discount` as discount, `order`.`total_payment` as total_payment, `order`.`customer_paying` AS customer_paying, `order`.`change` AS `change`, `order`.`staff` AS staff, `order`.`customer` AS customer\n" +
                    "from `order` join order_details on order_details.order_id = `order`.order_id\n" +
                    "join users u on `order`.customer = u.id_u\n" +
                    "join  users u2 on `order`.staff = u2.id_u\n" +
                    "WHERE u2.id_u = ?\n" +
                    "GROUP BY `order`.order_id DESC, `order`.code, `order`.order_date, u.name";
            return jdbcTemplate.query(sql, new OrderMapper(), id);
        }catch (Exception e){
            return null;
        }
    }

    public List<Order> getAllOrderOfAnUserById(int id) {
        try{
            sql = "SELECT * FROM `order` o WHERE o.customer = ?";
            return jdbcTemplate.query(sql, new OrderMapper(), id);
        }catch (Exception e){
            return null;
        }
    }

    public List<OrderDetail> getDetailOfAnOrder(int id) {
        try{
            sql = "SELECT order_details.product_id, p.name, order_details.price_sale, order_details.quantity, \n" +
                    "       order_details.total_price\n" +
                    "FROM `order` join order_details on `order`.order_id = order_details.order_id\n" +
                    "join product p on order_details.product_id = p.product_id\n" +
                    "WHERE order_details.order_id = ?";
            return jdbcTemplate.query(sql, new RowMapper<OrderDetail>() {
                public OrderDetail mapRow(ResultSet resultSet, int i) throws SQLException {
                    OrderDetail orderDetail = new OrderDetail();

                    orderDetail.setProduct_id(resultSet.getInt("product_id"));
                    orderDetail.setPrice_sale(resultSet.getInt("price_sale"));
                    orderDetail.setQuantity(resultSet.getInt("quantity"));
                    orderDetail.setTotal_price(resultSet.getInt("total_price"));
                    orderDetail.setProduct_name(resultSet.getString("name"));
                    return orderDetail;
                }
            }, id);
        }catch (Exception e){
            return null;
        }
    }

    public int getNumberOrderOfAnCustomer(int customer_id) {
        try{
            sql = "SELECT COUNT(*) FROM `order` o WHERE o.customer = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class, customer_id);
        }catch (Exception e){
            return 0;
        }
    }
}
