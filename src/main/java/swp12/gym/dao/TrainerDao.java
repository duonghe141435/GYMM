package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.TrainerDto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TrainerDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<TrainerDto> findAllTrainerByTicket(int id) {
        sql = "SELECT tr.trainer_id, u.name, u.email, u.phone, pt.price, pt.personal_trainer_id, pt.status\n" +
                "FROM ticket t\n" +
                "JOIN personal_trainer pt ON t.id_t = pt.ticket_id\n" +
                "JOIN trainer tr ON pt.trainer_id = tr.trainer_id\n" +
                "JOIN users u ON tr.id_u = u.id_u\n" +
                "WHERE pt.ticket_id = ?";
        return jdbcTemplate.query(sql, new RowMapper<TrainerDto>() {
            public TrainerDto mapRow(ResultSet resultSet, int i) throws SQLException {
                TrainerDto trainerDto = new TrainerDto();
                trainerDto.setId_trainer(resultSet.getInt("trainer_id"));
                trainerDto.setName_trainer(resultSet.getString("name"));
                trainerDto.setEmail_trainer(resultSet.getString("email"));
                trainerDto.setPhone(resultSet.getString("phone"));
                trainerDto.setPrice(resultSet.getInt("price"));
                trainerDto.setPersonal_trainer_id(resultSet.getInt("personal_trainer_id"));
                trainerDto.setStatus_trainer(resultSet.getInt("status"));
                return trainerDto;
            }
        }, id);
    }
}
