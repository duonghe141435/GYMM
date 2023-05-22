package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketDtoMapper;
import swp12.gym.dto.TicketUserDto;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class TicketUserDtoDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    private String sql;

    public TicketDto findAnTicket(long id) {
        sql = "SELECT * FROM ticket WHERE id_t = ? AND status = 1";
        return jdbcTemplate.queryForObject(sql,new TicketDtoMapper(), id);
    }

    public TicketUserDto findAnTicketUserDto(int userID, String dateConvert) {
        try{
            sql = "SELECT tu.name, tu.start_date, tu.end_date, upt.personal_trainer_id\n" +
                    "FROM ticket_user tu\n" +
                    "JOIN user_personal_trainer upt ON tu.ticket_user_id = upt.ticket_user_id AND tu.id_u = upt.user_id\n" +
                    "WHERE  tu.id_u = ? AND ? BETWEEN tu.start_date AND tu.end_date ";

            return jdbcTemplate.queryForObject(sql, new RowMapper<TicketUserDto>() {
                public TicketUserDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    TicketUserDto ticketUserDto = new TicketUserDto();
                    ticketUserDto.setName(resultSet.getString("name"));
                    ticketUserDto.setStart_date(resultSet.getString("start_date"));
                    ticketUserDto.setEnd_date(resultSet.getString("end_date"));
                    ticketUserDto.setCreate_date(resultSet.getString("personal_trainer_id"));
                    return ticketUserDto;
                }
            }, userID, dateConvert);
        }catch (EmptyResultDataAccessException e) {
            // No results found, return null
            return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
