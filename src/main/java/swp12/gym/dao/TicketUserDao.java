package swp12.gym.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.common.DataUtil;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketDtoMapper;
import swp12.gym.dto.TicketTrainerDtoMapper;
import swp12.gym.dto.TicketUserDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.model.entity.User;
import swp12.gym.model.entity.UserClass;
import swp12.gym.model.mapper.TicketMapper;
import swp12.gym.model.mapper.UserMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class TicketUserDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    private final LocalDate currentDate = LocalDate.now();

    public Ticket findAnTicket1(long id) {

//        sql = "SELECT * FROM ticket WHERE id_t = ?";

        sql = "SELECT t.id_t as id_t, t.name as t_name,t.tt_id as tt_id, \n" +
                "t.total_days as t_day, t.status as t_status,\n" +
                "t.create_date as t_create_date, t.price as t_price\n" +
                "FROM ticket t WHERE id_t = ?";
        return jdbcTemplate.queryForObject(sql,new TicketMapper(),id);
    }

    public void insertAnTicketUser(TicketUser ticketUser){
        try{
            sql = "INSERT INTO ticket_user (name, create_date, start_date, end_date, payment_status, value_cost, date_payment, id_u, ticket_id) VALUES (?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,ticketUser.getName(),ticketUser.getCreate_date(), ticketUser.getStart_date(), ticketUser.getEnd_date(), ticketUser.getPayment_Status(), ticketUser.getValue_Cost(), ticketUser.getDate_Payment(), ticketUser.getId_u(), ticketUser.getId_t());
            System.out.println(ticketUser.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public long findIDTicketUser(){
        try{
            sql = "SELECT ticket_user_id FROM ticket_user ORDER BY ticket_user.ticket_user_id DESC LIMIT 1";
            TicketUser ticketUser = jdbcTemplate.queryForObject(sql, new RowMapper<TicketUser>() {
                public TicketUser mapRow(ResultSet resultSet, int i) throws SQLException {
                    TicketUser ticketUser = new TicketUser();
                    ticketUser.setT_u_ID(resultSet.getInt("ticket_user_id"));
                    return ticketUser;
                }
            });
            return ticketUser.getT_u_ID();
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    public List<TicketUser> findTicketsOfUser(int userID) {
        try{
            sql = "SELECT ticket_user_id, name, create_date, start_date, end_date, payment_status, value_cost FROM ticket_user WHERE payment_status = 0 AND id_u = ?";
            return jdbcTemplate.query(sql, new RowMapper<TicketUser>() {
                public TicketUser mapRow(ResultSet resultSet, int i) throws SQLException {
                    TicketUser TicketUser = new TicketUser();
                    TicketUser.setT_u_ID(resultSet.getInt("ticket_user_id"));
                    TicketUser.setName(resultSet.getString("name"));
                    LocalDateTime createDateTime = resultSet.getTimestamp("create_date").toLocalDateTime();
                    TicketUser.setCreate_date(createDateTime);
                    LocalDateTime start_date = resultSet.getTimestamp("start_date").toLocalDateTime();
                    TicketUser.setStart_date(start_date);
                    LocalDateTime end_date = resultSet.getTimestamp("end_date").toLocalDateTime();
                    TicketUser.setEnd_date(end_date);
                    TicketUser.setPayment_Status(resultSet.getInt("payment_status"));
                    TicketUser.setValue_Cost(resultSet.getFloat("value_cost"));
                    return TicketUser;
                }
            }, userID);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<TicketUserDto> findTicketUserOfSchedulePersonal(int userID) {
        try{
            sql = "SELECT tu.name, tu.start_date, tu.end_date\n" +
                    "FROM ticket_user tu\n" +
                    "JOIN ticket t ON tu.ticket_id = t.id_t\n" +
                    "JOIN ticket_type tt ON t.tt_id = tt.tt_id\n" +
                    "WHERE tt.tt_id = 2 AND tu.id_u = ?";
            return jdbcTemplate.query(sql, new RowMapper<TicketUserDto>() {
                public TicketUserDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    TicketUserDto ticketUserDto = new TicketUserDto();
                    ticketUserDto.setName(resultSet.getString("name"));
                    ticketUserDto.setStart_date(resultSet.getString("start_date"));
                    ticketUserDto.setEnd_date(resultSet.getString("end_date"));
                    return ticketUserDto;
                }
            }, userID);
        }catch (Exception e){
            e.printStackTrace();
            return null;
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

    public LocalDateTime findDateAnTicketTrainerPersonal(long userId){
        sql = "SELECT MAX(end_date) FROM ticket_user JOIN ticket t on ticket_user.ticket_id = t.id_t and t.tt_id = 2 WHERE id_u = ?";
        LocalDateTime end_date = jdbcTemplate.queryForObject(sql, LocalDateTime.class, userId);
        return end_date;
    }

    public TicketDto findAnTicket(long id) {
        sql = "SELECT * FROM ticket WHERE id_t = ? AND status = 1";
        return jdbcTemplate.queryForObject(sql,new TicketDtoMapper(), id);
    }

    public void deleteTicketUser(String ticket_user_id){
        try{
            sql = "DELETE FROM ticket_user WHERE ticket_user_id = ?";
            jdbcTemplate.update(sql,ticket_user_id);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("An error occurred while deleting the ticket user with ID " + ticket_user_id);
        }
    }

    public void deleteUserPersonal(String ticket_user_id){
        try{
            sql = "DELETE FROM user_personal_trainer WHERE ticket_user_id = ?";
            jdbcTemplate.update(sql,ticket_user_id);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("An error occurred while deleting the ticket user with ID " + ticket_user_id);
        }
    }

    public void deleteUserClass(String ticket_user_id){
        try{
            sql = "DELETE FROM user_class WHERE ticket_user_id = ?";
            jdbcTemplate.update(sql,ticket_user_id);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException("An error occurred while deleting the ticket user with ID " + ticket_user_id);
        }
    }

    public void updateTicketUser(int userID){
        try{
            sql = "UPDATE ticket_user SET payment_status = 1, date_payment = ? WHERE payment_status = 0 AND id_u = ?;";
//            StringBuffer listTicketUserParam = new StringBuffer();
//            listTicketUserParam.append("(");
//            for (TicketUser item: listTicketUser) {
//                listTicketUserParam.append(item.getT_u_ID());
//                listTicketUserParam.append(",");
//            }
//            listTicketUserParam.replace(0, listTicketUser.size()-1,"");
//            listTicketUserParam.append(")");
//            sql.replace(":listTicketUser", listTicketUserParam.toString());
            jdbcTemplate.update(sql, currentDate, userID);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateUserClass(int userID){
        try{
            sql = "UPDATE user_class SET status = 1 WHERE status = 0 AND user_id = ?;";
            jdbcTemplate.update(sql, userID);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateUserPersonal(int userID){
        try{
            sql = "UPDATE user_personal_trainer SET status = 1 WHERE status = 0 AND user_id = ?;";
            jdbcTemplate.update(sql, userID);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<UserClass> checkUserClass(int userID) {
        try{
            sql = "SELECT uc.ticket_user_id AS ticket_user_id, c.name AS class_name\n" +
                    "FROM class c\n" +
                    "LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                    "WHERE uc.user_id = ? AND uc.status = 0\n" +
                    "AND (\n" +
                    "SELECT COUNT(CASE WHEN uc2.status = 1 THEN 1 ELSE NULL END)\n" +
                    "FROM class c\n" +
                    "LEFT JOIN user_class uc2 ON c.class_id = uc2.class_id\n" +
                    "WHERE uc2.class_id = uc.class_id\n" +
                    "GROUP BY uc2.class_id\n" +
                    ") IN (\n" +
                    "SELECT max_menber\n" +
                    "FROM class\n" +
                    "WHERE class_id = uc.class_id\n" +
                    ") LIMIT 0, 25";
            return jdbcTemplate.query(sql, new RowMapper<UserClass>() {
                public UserClass mapRow(ResultSet resultSet, int i) throws SQLException {
                    UserClass userClass = new UserClass();
                    userClass.setTicket_user_id(resultSet.getInt("ticket_user_id"));
                    userClass.setC_class_name(resultSet.getString("class_name"));
                    return userClass;
                }
            }, userID);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}