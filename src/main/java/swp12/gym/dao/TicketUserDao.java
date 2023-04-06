package swp12.gym.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketDtoMapper;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.model.entity.User;
import swp12.gym.model.mapper.TicketMapper;
import swp12.gym.model.mapper.UserMapper;

import java.time.LocalDateTime;

@Repository
public class TicketUserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public Ticket findAnTicket1(long id) {

//        sql = "SELECT * FROM ticket WHERE id_t = ?";

        sql = "SELECT t.id_t as id_t, t.name as t_name,t.tt_id as tt_id, \n" +
                "t.total_days as t_day, t.status as t_status,\n" +
                "t.create_date as t_create_date, t.price as t_price\n" +
                "FROM ticket t WHERE id_t = ?";
        System.out.println("......sql findAnTicket1");
        return jdbcTemplate.queryForObject(sql,new TicketMapper(),id);
    }

    public void insertAnTicketUser(TicketUser ticketUser){
        try{
            System.out.println("......sql insertAnTicketUser");
            sql = "INSERT INTO ticket_user (name, create_date, start_date, end_date, payment_status, value_cost, date_payment, id_u, ticket_id) VALUES (?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,ticketUser.getName(),ticketUser.getCreate_date(), ticketUser.getStart_date(), ticketUser.getEnd_date(), ticketUser.getPayment_Status(), ticketUser.getValue_Cost(), ticketUser.getDate_Payment(), ticketUser.getId_u(), ticketUser.getId_t());
            System.out.println(ticketUser.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public long findUserID(String name){
        try{
            sql = "SELECT * FROM users WHERE username = ?";
            User user = jdbcTemplate.queryForObject(sql, new UserMapper());
            return user.getU_id();
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    public LocalDateTime findDateAnTicket(long userId){
        sql = "SELECT MAX(end_date) FROM ticket_user JOIN ticket t on ticket_user.ticket_id = t.id_t and t.tt_id = 1 WHERE id_u = ?";
        LocalDateTime end_date = jdbcTemplate.queryForObject(sql, LocalDateTime.class, userId);
        return end_date;
    }

    public LocalDateTime findDateAnTicketClass(long userId){
//        sql = "SELECT MAX(end_date) FROM ticket_user JOIN ticket t on ticket_user.ticket_id = t.id_t JOIN ticket_type tt on t.tt_id = tt.tt_id WHERE id_u = ?";
        sql = "SELECT MAX(end_date) FROM ticket_user JOIN ticket t on ticket_user.ticket_id = t.id_t and t.tt_id = 3 WHERE id_u = ?";
        LocalDateTime end_date = jdbcTemplate.queryForObject(sql, LocalDateTime.class, userId);
        return end_date;
    }

    public TicketDto findAnTicket(long id) {
        sql = "SELECT * FROM ticket WHERE id_t = ? AND status = 1";
        return jdbcTemplate.queryForObject(sql,new TicketDtoMapper(), id);
    }
}
