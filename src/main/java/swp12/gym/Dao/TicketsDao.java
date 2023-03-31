package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketDtoMapper;

import java.time.LocalDate;
import java.util.List;

@Repository
public class TicketsDao {

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

    public List<TicketDto> findAllTicketPersonalTrainer() {
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
}
