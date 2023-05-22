package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.Revenue;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.model.entity.Token;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
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

    public List<Revenue> getAllRevenueOfYear(String year){
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
                revenue.setMonth(resultSet.getString("month"));
                revenue.setTotal_money(resultSet.getInt("value"));
                revenue.setYear(resultSet.getString("years"));
                return revenue;
            }
        }, year);
    }

    public List<TicketUser> getDetailRevenueInMonth(int year, int moth){
        sql = "SELECT name, create_date, value_cost, date_payment FROM ticket_user\n" +
                "    WHERE YEAR(date_payment) = ? AND MONTH(date_payment) = ? AND payment_status = 1";
        return jdbcTemplate.query(sql, new RowMapper<TicketUser>() {
            public TicketUser mapRow(ResultSet resultSet, int i) throws SQLException {
                TicketUser ticketUser = new TicketUser();
                ticketUser.setName(resultSet.getString("name"));
                LocalDateTime createDateTime = resultSet.getTimestamp("create_date").toLocalDateTime();
                ticketUser.setCreate_date(createDateTime);
                ticketUser.setValue_Cost(resultSet.getInt("value_cost"));
                LocalDateTime datePayment = resultSet.getTimestamp("date_payment").toLocalDateTime();
                ticketUser.setDate_Payment(datePayment);
                return ticketUser;
            }
        }, year, moth);
    }


    public int getAllRevenueTicketOfYear(int currentYear) {
        sql = "SELECT SUM(value_cost) as value FROM ticket_user" +
                " WHERE YEAR(date_payment) = ?";
        return jdbcTemplate.queryForObject(sql, Integer.class, currentYear);
    }
}
