package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.dto.TicketTrainerDtoMapper;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.mapper.TicketMapper;

import java.time.LocalDate;
import java.util.List;

@Repository
public class TicketDao {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    private final LocalDate currentDate = LocalDate.now();

    public List<Ticket> findAllTicketDoor(){
        try{
            sql = "SELECT t.id_t as id_t, t.name as t_name,t.tt_id as tt_id, \n" +
                    "t.total_days as t_day, t.status as t_status,\n" +
                    "t.create_date as t_create_date, t.price as t_price\n" +
                    "FROM ticket t WHERE t.tt_id = 1";
            return jdbcTemplate.query(sql, new TicketMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<TicketTrainerDto> findAllTicketTrainer() {
        try{
            sql = "SELECT t.id_t as t_id, t.name as t_name, t.tt_id, t.total_days as t_day, " +
                    "t.status as t_status, t.create_date as t_create_date,  MIN(pt.price) as min_price, MAX(pt.price) as max_price\n" +
                    "FROM ticket t join personal_trainer pt on t.id_t = pt.ticket_id WHERE t.tt_id = 2\n" +
                    "GROUP BY t.id_t,  t.tt_id, t.total_days, t.create_date";
            return jdbcTemplate.query(sql, new TicketTrainerDtoMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<Ticket> findAllTicketClass() {
        try{
            sql = "SELECT t.id_t as t_id, t.name as t_name,t2.tt_id as tt_id, t2.name as tt_name,\n" +
                    "t.total_days as t_day, t.status as t_status,\n" +
                    "t.create_date as t_create_date, t.price as t_price\n" +
                    "FROM ticket t join ticket_type t2 on t.tt_id = t2.tt_id WHERE t.tt_id = 3";
            return jdbcTemplate.query(sql, new TicketMapper());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public void createPersonalTicket(int id_trainer, int price,int ids) {
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

    public void createTicket(String name, String price, String day, int type_id, int ids) {
        try{
            sql = "INSERT INTO ticket (id_t, price, total_days, status, name, create_date,tt_id) VALUES (?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,ids, price, day, 1,name, currentDate, type_id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void createTicketClass(int ids_class, int id_trainer, int ids, int id_time, int state,
                                  String start_date, String end_date, int max_member, int price) {
        try{
            sql = "INSERT INTO class (class_id ,price, time_id, state, start_date,end_date, trainer_id,ticket_id,max_menber) VALUES (?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,ids_class, price, id_time,state, start_date,end_date, id_trainer,ids, max_member);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void createClassWeekdays(int ids, int cn, int thu2, int thu3, int thu4, int thu5, int thu6, int thu7, int id_class) {
        try{
            sql = "INSERT INTO weekdays (id_weekdays, cn, thu2, thu3, thu4, thu5, thu6, thu7, id_class) VALUES (?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,ids, cn, thu2, thu3, thu4, thu5, thu6, thu7, id_class);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int getNumberTicketTrainerInSystem() {
        try{
            sql = "SELECT COUNT(*) FROM personal_trainer";
            int number = jdbcTemplate.queryForObject(sql, Integer.class);
            return number;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public int getNumberClassWeekendInSystem() {
        try{
            sql = "SELECT COUNT(*) FROM weekdays";
            int number = jdbcTemplate.queryForObject(sql, Integer.class);
            return number;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public int getNumberTicketInSystem() {
        sql = "SELECT COUNT(*) FROM ticket";
        int number = jdbcTemplate.queryForObject(sql, Integer.class);
        return number;
    }

    public void deleteAnTicket(String id_t){
        try{
            sql = "UPDATE ticket SET status = 0 WHERE id_t = ?";
            jdbcTemplate.update(sql,id_t);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
