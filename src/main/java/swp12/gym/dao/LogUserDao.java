package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.LogUserDto;
import swp12.gym.model.entity.LogUser;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class LogUserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private String sql;

    //, giao dich, chỉnh sửa-thay dổi

    public void saveLogUser(int u_id, int title, int time, String content) {
        try {
            sql = "INSERT INTO log_user(type_log, time, content, user_id) VALUES (?,?,?,?);";
            jdbcTemplate.update(sql,title,time,content,u_id);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public List<LogUser> getLogOfAnUser(int u_id, int page) {
        page = page*8 - 8;
        try {
            sql = "SELECT * FROM log_user WHERE user_id = ? ORDER BY time DESC LIMIT ?,8";
            return jdbcTemplate.query(sql, new RowMapper<LogUser> () {

                public LogUser mapRow(ResultSet resultSet, int i) throws SQLException {
                    LogUser logUser = new LogUser();
                    logUser.setType_log(resultSet.getInt("type_log"));
                    logUser.setDate_time_create(resultSet.getInt("time"));
                    logUser.setContent(resultSet.getString("content"));
                    return logUser;
                }
            },u_id,page);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public int getNumberLoguOfAnUser(int id) {
        try {
            sql = "SELECT COUNT(*) FROM log_user WHERE user_id = ?";
            return jdbcTemplate.queryForObject(sql, Integer.class,id);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
