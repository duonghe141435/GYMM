package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.OrderDetail;

import java.util.List;

@Repository
public class OrderDetailDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void insertOrderDetail(List<OrderDetail> listOrderDetail){
        try{
            StringBuffer sql = new StringBuffer("INSERT INTO order_details (order_id, price_original, price_sale, product_id, quantity, total_price) VALUES");
            for (OrderDetail orderDetail: listOrderDetail) {
                sql.append("(" + "'" + orderDetail.getOrder_id() + "'" + "," + orderDetail.getPrice_original() + "," + orderDetail.getPrice_sale() + "," + orderDetail.getProduct_id() + "," + orderDetail.getQuantity() + "," + orderDetail.getTotal_price() + ")");
                sql.append(",");
            }
            String sqlRs = sql.substring(0, sql.length()-1);
            jdbcTemplate.update(sqlRs);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
