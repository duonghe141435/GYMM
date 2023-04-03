package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketDtoMapper;

import java.time.LocalDate;
import java.util.List;

@Repository
public class TicketDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    private final LocalDate currentDate = LocalDate.now();

    public List<TicketDto> findAllTicketDoor(){
        try{
            sql = "SELECT t.id_t as t_id, t.name as t_name,t2.tt_id as tt_id, t2.name as tt_name,\n" +
                    "t.total_days as t_day, t.status as t_status,\n" +
                    "t.create_date as t_create_date, t.price as t_price\n" +
                    "FROM ticket t join ticket_type t2 on t.tt_id = t2.tt_id WHERE t.tt_id = 1";
            return jdbcTemplate.query(sql, new TicketDtoMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<TicketDto> findAllTicketTrainer() {
        try{
            sql = "SELECT t.id_t as t_id, t.name as t_name,t2.tt_id as tt_id, t2.name as tt_name,\n" +
                    "t.total_days as t_day, t.status as t_status,\n" +
                    "t.create_date as t_create_date, t.price as t_price\n" +
                    "FROM ticket t join ticket_type t2 on t.tt_id = t2.tt_id WHERE t.tt_id = 2";
            return jdbcTemplate.query(sql, new TicketDtoMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<TicketDto> findAllTicketClass() {
        try{
            sql = "SELECT t.id_t as t_id, t.name as t_name,t2.tt_id as tt_id, t2.name as tt_name,\n" +
                    "t.total_days as t_day, t.status as t_status,\n" +
                    "t.create_date as t_create_date, t.price as t_price\n" +
                    "FROM ticket t join ticket_type t2 on t.tt_id = t2.tt_id WHERE t.tt_id = 3";
            return jdbcTemplate.query(sql, new TicketDtoMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void createPersonalTicket(String id_trainer, String price,int ids) {
        try{
            sql = "INSERT INTO personal_trainer (start_date, trainer_id, status, price, ticket_id) " +
                    "VALUES (?,?,?,?,?);";
            jdbcTemplate.update(sql,currentDate,id_trainer, 1,price, ids);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void createTicketForTrainer(String ticketName, String ticketDay, int i){
        try{
            sql = "INSERT INTO ticket (total_days, status, name, create_date,tt_id) VALUES (?,?,?,?,?)";
            jdbcTemplate.update(sql,ticketDay, 1,ticketName, currentDate, i);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void createTicket(String name, String price, String day, int type_id) {
        try{
            sql = "INSERT INTO ticket (price, total_days, status, name, create_date,tt_id) VALUES (?,?,?,?,?,?)";
            jdbcTemplate.update(sql,price, day, 1,name, currentDate, type_id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int getNumberTicketInSystem() {
        sql = "SELECT COUNT(*) FROM ticket";
        int number = jdbcTemplate.queryForObject(sql, Integer.class);
        return number;
    }

}
