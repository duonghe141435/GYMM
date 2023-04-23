package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.model.entity.Token;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class TokenDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public int createNewToken(String token, int create_date, int id_u) {
        sql = "INSERT INTO token (token_hash, create_date,expire_date, id_u)  VALUES (?,?,?,?);";
        return jdbcTemplate.update(sql, token, create_date, create_date + 900, id_u);
    }

    public int deleteAnToken(String token, int id_u){
        sql = "DELETE FROM token WHERE token_hash = ? AND id_u = ?";
        return jdbcTemplate.update(sql, token, id_u);
    }

    public Token ckeckingToken(String token_old, final String time) {
        sql = "SELECT * FROM token WHERE token_hash = ? AND expire_date = ?";
        return jdbcTemplate.queryForObject(sql, new RowMapper<Token>() {
            public Token mapRow(ResultSet resultSet, int i) throws SQLException {
                Token token = new Token();
                token.setId(resultSet.getInt("id"));
                token.setConfirm_date(resultSet.getInt("confirm_date"));
                token.setExpire_date(resultSet.getInt("expire_date"));
                token.setId_u(resultSet.getInt("id_u"));
                return token;
            }
        }, token_old, time);
    }

    public void updateToken(String token_old, String time, int confirm_date) {
        sql = "UPDATE token SET confirm_date = ? WHERE token_hash = ? AND id_u = ?";
        jdbcTemplate.update(sql, confirm_date, token_old, time);
    }
}
