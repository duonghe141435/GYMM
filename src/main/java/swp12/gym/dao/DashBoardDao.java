package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DashBoardDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public int TotalRevenueOfMonth(int year, int month) {
        sql = "SELECT IFNULL(SUM(total),0) FROM (\n" +
                "SELECT total_payment as total FROM `order` WHERE YEAR(order_date) = ? AND MONTH(order_date) = ?\n" +
                "union ALL SELECT value_cost as total FROM ticket_user WHERE YEAR(date_payment) = ? AND MONTH(date_payment) = ?) as money;";
        return jdbcTemplate.queryForObject(sql,Integer.class, year, month, year, month);
    }

    public int TotalRevenueOfThisYear(int year) {
        sql = "SELECT IFNULL(SUM(total),0) FROM (\n" +
                "SELECT total_payment as total FROM `order` WHERE YEAR(order_date) = ?\n" +
                "union ALL SELECT value_cost as total FROM ticket_user WHERE year(date_payment) = ?) as money;";
        return jdbcTemplate.queryForObject(sql,Integer.class, year, year);
    }

    public int TotalRevenueOfDay(String date) {
        sql = "SELECT IFNULL(SUM(total),0) FROM (\n" +
                "SELECT total_payment as total FROM `order` WHERE order_date = ?\n" +
                "union ALL SELECT value_cost as total FROM ticket_user WHERE date_payment = ?) as money;";
        return jdbcTemplate.queryForObject(sql,Integer.class, date, date);
    }

    public int getNumberAccountNew(String date) {
        sql = "SELECT IFNULL(COUNT(*),0) FROM users WHERE create_date = ?";
        return jdbcTemplate.queryForObject(sql,Integer.class, date);
    }
}
