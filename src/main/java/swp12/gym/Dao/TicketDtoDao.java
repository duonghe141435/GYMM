package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketDtoMapper;

import java.util.List;

@Repository
public class TicketDtoDao {

    @Autowired
    JdbcTemplate jdbcTemplate;
    private String sql;

    public List<TicketDto> findAll(){
        sql = "SELECT t.id_t as t_id, t.name as t_name,t2.name as tt_name,\n" +
                "t.note as t_note, t.total_days as t_day, t.status as t_status,\n" +
                "t.create_date as t_create_date\n" +
                "FROM ticket join ticket_type t2 on t.tt_id = t2.tt_id";
        return jdbcTemplate.query(sql, new TicketDtoMapper());
    }
}
