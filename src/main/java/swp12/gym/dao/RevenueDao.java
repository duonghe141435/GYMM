package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.Revenue;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class RevenueDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<Integer> getAllYearRevenue(){
        sql = "SELECT YEAR(date_payment) as year FROM ticket_user WHERE date_payment IS NOT NULL GROUP BY YEAR(date_payment);";
        return jdbcTemplate.query(sql, new RowMapper<Integer>() {
            public Integer mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getInt("year");
            }
        });
    }

    public List<Revenue> getAllRevenueOfYear(){
        sql = "SELECT YEAR(date_payment) as year, SUM(value_cost) as value_cost FROM ticket_user " +
                "WHERE date_payment IS NOT NULL GROUP BY YEAR(date_payment);\n ";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("year"));
                revenue.setTotal_money(resultSet.getInt("value_cost"));
                return revenue;
            }
        });
    }


//    public List<Revenue> getAllRevenueOfYear(){

//    }

    public List<Revenue> getDetailRevenueInMonth(int year, int moth){
        sql = "SELECT DAY(date_payment) as day, SUM(value_cost) as value_cost FROM ticket_user\n" +
                "                WHERE date_payment IS NOT NULL AND YEAR(date_payment) = ? AND MONTH(date_payment) = ? GROUP BY DAY(date_payment);";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("day"));
                revenue.setTotal_money(resultSet.getInt("value_cost"));
                return revenue;
            }
        }, year, moth);
    }

    public List<Revenue> getDetailRevenueYear(int year_int) {
        sql = "SELECT m.month , SUM(ticket_user.value_cost) as value, YEAR(date_payment) as years FROM (\n" +
                "SELECT 1 AS month\n" +
                "UNION ALL\n" +
                "SELECT 2 AS month\n" +
                "UNION ALL\n" +
                "SELECT 3 AS month\n" +
                "UNION ALL\n" +
                "SELECT 4 AS month\n" +
                "UNION ALL\n" +
                "SELECT 5 AS month\n" +
                "UNION ALL\n" +
                "SELECT 6 AS month\n" +
                "UNION ALL\n" +
                "SELECT 7 AS month\n" +
                "UNION ALL\n" +
                "SELECT 8 AS month\n" +
                "UNION ALL\n" +
                "SELECT 9 AS month\n" +
                "UNION ALL\n" +
                "SELECT 10 AS month\n" +
                "UNION ALL\n" +
                "SELECT 11 AS month\n" +
                "UNION ALL\n" +
                "SELECT 12 AS month) m left join ticket_user on m.month = MONTH(ticket_user.date_payment) and YEAR(date_payment) = ?\n" +
                "GROUP BY m.month\n" +
                "ORDER BY m.month ASC;";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("month"));
                revenue.setTotal_money(resultSet.getInt("value"));
                return revenue;
            }
        }, year_int);
    }

    public List<Revenue> getDetailRevenueInMonthByTicket(int year_int, int month_int) {
        sql = "SELECT name, SUM(value_cost) as value_cost FROM ticket_user\n" +
                "WHERE date_payment IS NOT NULL AND YEAR(date_payment) = ? AND MONTH(date_payment) = ? GROUP BY ticket_id";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("name"));
                revenue.setTotal_money(resultSet.getInt("value_cost"));
                return revenue;
            }
        }, year_int, month_int);
    }

    public List<Revenue> getAllRevenueOfYearByProduct() {
        sql = "SELECT YEAR(order_date) as year_product,SUM(total_payment) as value_cost FROM `order`\n" +
                "WHERE order_date IS NOT NULL GROUP BY order_date;";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("year_product"));
                revenue.setTotal_money(resultSet.getInt("value_cost"));
                return revenue;
            }
        });
    }


    public List<Revenue> getDetailRevenueYearByProduct(int year_int) {
        sql = "SELECT m.month , SUM(o.total_payment) as value, YEAR(o.order_date) as years FROM (\n" +
                "SELECT 1 AS month\n" +
                "UNION ALL\n" +
                "SELECT 2 AS month\n" +
                "UNION ALL\n" +
                "SELECT 3 AS month\n" +
                "UNION ALL\n" +
                "SELECT 4 AS month\n" +
                "UNION ALL\n" +
                "SELECT 5 AS month\n" +
                "UNION ALL\n" +
                "SELECT 6 AS month\n" +
                "UNION ALL\n" +
                "SELECT 7 AS month\n" +
                "UNION ALL\n" +
                "SELECT 8 AS month\n" +
                "UNION ALL\n" +
                "SELECT 9 AS month\n" +
                "UNION ALL\n" +
                "SELECT 10 AS month\n" +
                "UNION ALL\n" +
                "SELECT 11 AS month\n" +
                "UNION ALL\n" +
                "SELECT 12 AS month) m left join `order` o on m.month = MONTH(o.order_date) and YEAR(o.order_date) = ?\n" +
                "GROUP BY m.month\n" +
                "ORDER BY m.month ASC;";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("month"));
                revenue.setTotal_money(resultSet.getInt("value"));
                return revenue;
            }
        }, year_int);
    }

    public List<Revenue> getDetailRevenueInMonthProduct(int year_int, int month_int) {
        sql = "SELECT DAY(order_date) as day, SUM(total_payment) as value_cost FROM `order`\n" +
                "WHERE order_date IS NOT NULL AND YEAR(order_date) = ? AND MONTH(order_date) = ? GROUP BY order_date;";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("day"));
                revenue.setTotal_money(resultSet.getInt("value_cost"));
                return revenue;
            }
        }, year_int, month_int);
    }

    public List<Revenue> getDetailRevenueInMonthByProduct(int year_int, int month_int) {
        sql = "SELECT p.name as name_product , order_details.price_sale as moneys\n" +
                "FROM order_details left join product p on order_details.product_id = p.product_id \n" +
                "                   join `order` o on order_details.order_id = o.order_id\n" +
                "WHERE YEAR(o.order_date) = ? AND MONTH(o.order_date) = ?\n" +
                "GROUP BY p.product_id;";
        return jdbcTemplate.query(sql, new RowMapper<Revenue>() {
            public Revenue mapRow(ResultSet resultSet, int i) throws SQLException {
                Revenue revenue = new Revenue();
                revenue.setTime(resultSet.getString("name_product"));
                revenue.setTotal_money(resultSet.getInt("moneys"));
                return revenue;
            }
        }, year_int, month_int);
    }
}
