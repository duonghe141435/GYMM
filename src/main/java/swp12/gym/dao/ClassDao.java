package swp12.gym.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.ClassDtoMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ClassDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public void insertUserClass(long userID, int class_id, long ticketUserID){
        try{
            sql = "INSERT INTO user_class (user_id, class_id, status, ticket_user_id) VALUES (?,?,?,?)";
            jdbcTemplate.update(sql, userID, class_id, 0, ticketUserID);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<ClassDto> findAllClass() {
        sql = "SELECT c.class_id as class_id, c.name AS c_name, c.create_date AS c_create_date, c.time_id as c_time_id, c.state as c_status,\n" +
                "                       c.start_date as c_start_date, c.end_date as c_end_date, c.max_menber as max_member, c.price as c_price, c.trainer_id as c_trainer_id,\n" +
                "                       u.name as c_trainer_name, c.ticket_id as c_ticket_id, tm.start_time, tm.end_time, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees\n" +
                "                FROM class c\n" +
                "                       JOIN ticket tk ON c.ticket_id = tk.id_t\n" +
                "                       JOIN trainer tn ON c.trainer_id = tn.trainer_id\n" +
                "                       JOIN users u ON tn.id_u = u.id_u\n" +
                "                       JOIN time tm ON c.time_id = tm.id_time\n" +
                "                       LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                "                GROUP BY c.ticket_id, uc.class_id, c.max_menber, c.name\n" +
                "                ORDER BY c.class_id DESC;";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();

                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_time_id(resultSet.getInt("c_time_id"));
                classDto.setC_status(resultSet.getInt("c_status"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setMax_member(resultSet.getInt("max_member"));
                classDto.setC_price(resultSet.getInt("c_price"));
                classDto.setC_trainer_id(resultSet.getInt("c_trainer_id"));
                classDto.setC_trainer_name(resultSet.getString("c_trainer_name"));
                classDto.setC_ticket_id(resultSet.getInt("c_ticket_id"));
                classDto.setStart_time(resultSet.getString("start_time"));
                classDto.setEnd_time(resultSet.getString("end_time"));
                classDto.setTotal_attendees(resultSet.getInt("total_attendees"));
                classDto.setC_create_date(resultSet.getString("c_create_date"));

                return classDto;
            }
        });
    }

    public List<ClassDto> findAllClassOfAnUserById(int user_id){
        sql = "SELECT c.class_id as class_id, c.name as c_name, u.value_cost as c_price, u.date_payment as c_create_date,\n" +
                "u.payment_status as c_status, c.start_date as c_start_date, c.end_date as c_end_date, us.name \n" +
                "FROM user_class\n" +
                "join ticket_user u on user_class.ticket_user_id = u.ticket_user_id\n" +
                "join class c on user_class.class_id = c.class_id\n" +
                "JOIN trainer t ON c.trainer_id = t.trainer_id\n" +
                "JOIN users us ON t.id_u = us.id_u\n" +
                "WHERE user_class.user_id = ?\n" +
                "ORDER BY  u.ticket_user_id DESC";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();

                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_status(resultSet.getInt("c_status"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setC_price(resultSet.getInt("c_price"));
                classDto.setC_create_date(resultSet.getString("c_create_date"));
                classDto.setC_trainer_name(resultSet.getString("name"));

                return classDto;
            }
        }, user_id);
    }

    public List<ClassDto> findAllScheduleClassOfAnUserById(int user_id){
        sql = "SELECT c.class_id, c.name as c_name, c.start_date as c_start_date, c.end_date as c_end_date, u.name, c.time_id, tm.start_time, tm.end_time, w.id_weekdays, w.cn AS sunday, w.thu2 AS monday, w.thu3 AS tuesday, w.thu4 AS wednesday, w.thu5 AS thursday, w.thu6 AS friday, w.thu7 AS saturday\n" +
                "FROM class c\n" +
                "JOIN `time` tm ON c.time_id = tm.id_time\n" +
                "JOIN trainer t ON c.trainer_id = t.trainer_id\n" +
                "JOIN users u ON t.id_u = u.id_u\n" +
                "JOIN weekdays w ON c.class_id = w.id_class\n" +
                "LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                "WHERE uc.user_id = ?\n" +
                "GROUP BY uc.class_id, uc.user_id";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();
                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setC_trainer_name(resultSet.getString("name"));
                classDto.setC_time_id(resultSet.getInt("time_id"));
                classDto.setStart_time(resultSet.getString("start_time"));
                classDto.setEnd_time(resultSet.getString("end_time"));
                classDto.setWeekdays_id(resultSet.getInt("id_weekdays"));
                classDto.setSunday(resultSet.getInt("sunday"));
                classDto.setMonday(resultSet.getInt("monday"));
                classDto.setTuesday(resultSet.getInt("tuesday"));
                classDto.setWednesday(resultSet.getInt("wednesday"));
                classDto.setThursday(resultSet.getInt("thursday"));
                classDto.setFriday(resultSet.getInt("friday"));
                classDto.setSaturday(resultSet.getInt("saturday"));
                return classDto;
            }
        }, user_id);
    }

    public List<ClassDto> findAllScheduleClassOfAnTrainer(int user_id){
        sql = "SELECT c.class_id, c.name as c_name, c.start_date as c_start_date, c.end_date as c_end_date, u.name, c.time_id, tm.start_time, tm.end_time, w.id_weekdays, w.cn AS sunday, w.thu2 AS monday, w.thu3 AS tuesday, w.thu4 AS wednesday, w.thu5 AS thursday, w.thu6 AS friday, w.thu7 AS saturday\n" +
                "FROM class c\n" +
                "JOIN `time` tm ON c.time_id = tm.id_time\n" +
                "JOIN trainer t ON c.trainer_id = t.trainer_id\n" +
                "JOIN users u ON t.id_u = u.id_u\n" +
                "JOIN weekdays w ON c.class_id = w.id_class\n" +
                "LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                "WHERE u.id_u = ?\n" +
                "GROUP BY uc.class_id, uc.user_id";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();
                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setC_trainer_name(resultSet.getString("name"));
                classDto.setC_time_id(resultSet.getInt("time_id"));
                classDto.setStart_time(resultSet.getString("start_time"));
                classDto.setEnd_time(resultSet.getString("end_time"));
                classDto.setWeekdays_id(resultSet.getInt("id_weekdays"));
                classDto.setSunday(resultSet.getInt("sunday"));
                classDto.setMonday(resultSet.getInt("monday"));
                classDto.setTuesday(resultSet.getInt("tuesday"));
                classDto.setWednesday(resultSet.getInt("wednesday"));
                classDto.setThursday(resultSet.getInt("thursday"));
                classDto.setFriday(resultSet.getInt("friday"));
                classDto.setSaturday(resultSet.getInt("saturday"));
                return classDto;
            }
        }, user_id);
    }

    public List<ClassDto> findAllClassOfAnTicketClass(int ticket_id) {
        try{
//            sql = "SELECT c.class_id as class_id, c.name AS c_name, c.create_date AS c_create_date, c.time_id as c_time_id, c.state as c_status, c.start_date as c_start_date, c.end_date as c_end_date, c.max_menber as max_member, c.price as c_price, c.trainer_id as c_trainer_id, u.name as c_trainer_name, c.ticket_id as c_ticket_id, tm.start_time, tm.end_time, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees\n" +
//                    "                    FROM class c\n" +
//                    "                    JOIN ticket tk ON c.ticket_id = tk.id_t\n" +
//                    "                    JOIN trainer tn ON c.trainer_id = tn.trainer_id\n" +
//                    "                    JOIN users u ON tn.id_u = u.id_u\n" +
//                    "                    JOIN time tm ON c.time_id = tm.id_time\n" +
//                    "                    LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
//                    "                    WHERE c.state = 0 and c.ticket_id = ?\n" +
//                    "                    GROUP BY c.ticket_id, uc.class_id, c.max_menber";
            sql = "SELECT c.class_id as class_id, c.name AS c_name, c.create_date AS c_create_date, c.time_id as c_time_id, c.state as c_status, c.start_date as c_start_date, c.end_date as c_end_date, c.max_menber as max_member, c.price as c_price, c.trainer_id as c_trainer_id, u.name as c_trainer_name, c.ticket_id as c_ticket_id, tm.start_time, tm.end_time, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees, w.id_weekdays, w.cn AS sunday, w.thu2 AS monday, w.thu3 AS tuesday, w.thu4 AS wednesday, w.thu5 AS thursday, w.thu6 AS friday, w.thu7 AS saturday\n" +
                    "FROM class c\n" +
                    "JOIN ticket tk ON c.ticket_id = tk.id_t\n" +
                    "JOIN trainer tn ON c.trainer_id = tn.trainer_id\n" +
                    "JOIN users u ON tn.id_u = u.id_u\n" +
                    "JOIN time tm ON c.time_id = tm.id_time\n" +
                    "JOIN weekdays w ON c.class_id = w.id_class\n" +
                    "LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                    "WHERE c.state = 0 and c.ticket_id = ?\n" +
                    "GROUP BY c.ticket_id, uc.class_id, c.max_menber";
            return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
                public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                    ClassDto classDto = new ClassDto();
                    classDto.setClass_id(resultSet.getInt("class_id"));
                    classDto.setC_name(resultSet.getString("c_name"));
                    classDto.setC_create_date(resultSet.getString("c_create_date"));
                    classDto.setClass_id(resultSet.getInt("class_id"));
                    classDto.setC_time_id(resultSet.getInt("c_time_id") );
                    classDto.setC_status(resultSet.getInt("c_status"));
                    classDto.setC_start_date(resultSet.getString("c_start_date"));
                    classDto.setC_end_date(resultSet.getString("c_end_date"));
                    classDto.setMax_member(resultSet.getInt("max_member"));
                    classDto.setC_price(resultSet.getInt("c_price"));
                    classDto.setC_trainer_id(resultSet.getInt("c_trainer_id"));
                    classDto.setC_trainer_name(resultSet.getString("c_trainer_name"));
                    classDto.setC_ticket_id(resultSet.getInt("c_ticket_id"));
                    classDto.setStart_time(resultSet.getString("start_time"));
                    classDto.setEnd_time(resultSet.getString("end_time"));
                    classDto.setTotal_attendees(resultSet.getInt("total_attendees"));
                    classDto.setWeekdays_id(resultSet.getInt("id_weekdays"));
                    classDto.setSunday(resultSet.getInt("sunday"));
                    classDto.setMonday(resultSet.getInt("monday"));
                    classDto.setTuesday(resultSet.getInt("tuesday"));
                    classDto.setWednesday(resultSet.getInt("wednesday"));
                    classDto.setThursday(resultSet.getInt("thursday"));
                    classDto.setFriday(resultSet.getInt("friday"));
                    classDto.setSaturday(resultSet.getInt("saturday"));
                    return classDto;
                }
            }, ticket_id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<ClassDto> findAllClassOfAnTicket(int id) {
        sql = "SELECT c.class_id as class_id, c.name AS c_name, c.create_date AS c_create_date, c.time_id as c_time_id, c.state as c_status,\n" +
                "       c.start_date as c_start_date, c.end_date as c_end_date, c.max_menber as max_member, c.price as c_price, c.trainer_id as c_trainer_id,\n" +
                "       u.name as c_trainer_name, c.ticket_id as c_ticket_id, tm.start_time, tm.end_time, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees\n" +
                "FROM class c\n" +
                "       JOIN ticket tk ON c.ticket_id = tk.id_t\n" +
                "       JOIN trainer tn ON c.trainer_id = tn.trainer_id\n" +
                "       JOIN users u ON tn.id_u = u.id_u\n" +
                "       JOIN time tm ON c.time_id = tm.id_time\n" +
                "       LEFT JOIN user_class uc ON c.class_id = uc.class_id WHERE ticket_id = ? \n" +
                "GROUP BY c.ticket_id, uc.class_id, c.max_menber";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_status(resultSet.getInt("c_status"));
                classDto.setC_price(resultSet.getInt("c_price"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setMax_member(resultSet.getInt("max_member"));
                classDto.setTotal_attendees(resultSet.getInt("total_attendees"));
                return classDto;
            }
        }, id);
    }

    public ClassDto findDetailAnClass(int class_id) {
        sql = "SELECT c.class_id, c.time_id, c.name, c.state, c.start_date, c.end_date, tm.start_time, tm.end_time, c.trainer_id, u.name AS c_trainer_name, c.max_menber, c.price, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees, w.id_weekdays, w.cn AS sunday, w.thu2 AS monday, w.thu3 AS tuesday, w.thu4 AS wednesday, w.thu5 AS thursday, w.thu6 AS friday, w.thu7 AS saturday\n" +
                "FROM class c\n" +
                "JOIN `time` tm ON c.time_id = tm.id_time\n" +
                "JOIN trainer t ON c.trainer_id = t.trainer_id\n" +
                "JOIN users u ON t.id_u = u.id_u\n" +
                "JOIN weekdays w ON c.class_id = w.id_class\n" +
                "LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                "WHERE c.class_id = ?\n" +
                "GROUP BY c.class_id, uc.class_id, c.max_menber";
        return jdbcTemplate.queryForObject(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();

                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_time_id(resultSet.getInt("time_id"));
                classDto.setC_status(resultSet.getInt("state"));
                classDto.setC_name(resultSet.getString("name"));
                classDto.setC_start_date(resultSet.getString("start_date"));
                classDto.setC_end_date(resultSet.getString("end_date"));
                classDto.setMax_member(resultSet.getInt("max_menber"));
                classDto.setC_price(resultSet.getInt("price"));
                classDto.setC_trainer_id(resultSet.getInt("trainer_id"));
                classDto.setC_trainer_name(resultSet.getString("c_trainer_name"));
                classDto.setStart_time(resultSet.getString("start_time"));
                classDto.setEnd_time(resultSet.getString("end_time"));
                classDto.setTotal_attendees(resultSet.getInt("total_attendees"));

                classDto.setWeekdays_id(resultSet.getInt("id_weekdays"));
                classDto.setSunday(resultSet.getInt("sunday"));
                classDto.setMonday(resultSet.getInt("monday"));
                classDto.setTuesday(resultSet.getInt("tuesday"));
                classDto.setWednesday(resultSet.getInt("wednesday"));
                classDto.setThursday(resultSet.getInt("thursday"));
                classDto.setFriday(resultSet.getInt("friday"));
                classDto.setSaturday(resultSet.getInt("saturday"));
                return classDto;
            }
        }, class_id);
    }

    public List<String[]> findScheduleCheckClass(String ticket_id, String time_id, String trainer_id) {
        try {
            sql = "SELECT class.class_id, class.trainer_id, class.time_id, class.state, class.start_date, class.end_date,\n" +
                    "w.thu2,w.thu3,w.thu4,w.thu5,w.thu6, w.thu7, w.cn\n" +
                    "FROM class join ticket t on class.ticket_id = t.id_t\n" +
                    "join trainer t2 on class.trainer_id = t2.trainer_id\n" +
                    "join time t3 on class.time_id = t3.id_time\n" +
                    "join weekdays w on class.class_id = w.id_class\n" +
                    "WHERE t.tt_id = 3  AND t2.trainer_id = ? AND t3.id_time = ?;";
            return jdbcTemplate.query(sql, new RowMapper<String[]>() {
                public String[] mapRow(ResultSet resultSet, int i) throws SQLException {
                    String[] result = new String[9];
                    result[0] = resultSet.getString("start_date");
                    result[1] = resultSet.getString("end_date");
                    result[2] = resultSet.getString("thu2");
                    result[3] = resultSet.getString("thu3");
                    result[4] = resultSet.getString("thu4");
                    result[5] = resultSet.getString("thu5");
                    result[6] = resultSet.getString("thu6");
                    result[7] = resultSet.getString("thu7");
                    result[8] = resultSet.getString("cn");
                    return result;
                }
            },trainer_id, time_id);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    public void createNewClass(int id_class, String class_name, String time_id, int i, String start_date, String end_date,
                               String trainer_id, String ticket_id, int max_member, int price, String dateNowToString) {
        try{
            sql = "INSERT INTO class (class_id,name, time_id, state, start_date, end_date, " +
                    "trainer_id, ticket_id, max_menber, price, create_date) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,id_class,class_name,time_id,i,start_date,end_date,trainer_id,ticket_id,max_member,price,dateNowToString);
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public List<ClassDto> findClassAllOfAnTrainer(String email) {
        sql = "SELECT c.class_id as class_id, c.name AS c_name, c.create_date AS c_create_date, c.time_id as c_time_id, c.state as c_status,\n" +
                "       c.start_date as c_start_date, c.end_date as c_end_date, c.max_menber as max_member, c.price as c_price, c.trainer_id as c_trainer_id,\n" +
                "       u.name as c_trainer_name, c.ticket_id as c_ticket_id, tm.start_time, tm.end_time, COUNT(CASE WHEN uc.status = 1 THEN 1 ELSE NULL END) as total_attendees\n" +
                "FROM class c\n" +
                "       JOIN ticket tk ON c.ticket_id = tk.id_t\n" +
                "       JOIN trainer tn ON c.trainer_id = tn.trainer_id\n" +
                "       JOIN users u ON tn.id_u = u.id_u\n" +
                "       JOIN time tm ON c.time_id = tm.id_time\n" +
                "       LEFT JOIN user_class uc ON c.class_id = uc.class_id\n" +
                "WHERE u.email = ?\n" +
                "GROUP BY c.ticket_id, uc.class_id, c.max_menber, c.name\n" +
                "ORDER BY c.class_id DESC;";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();

                classDto.setClass_id(resultSet.getInt("class_id"));
                classDto.setC_time_id(resultSet.getInt("c_time_id"));
                classDto.setC_status(resultSet.getInt("c_status"));
                classDto.setC_name(resultSet.getString("c_name"));
                classDto.setC_start_date(resultSet.getString("c_start_date"));
                classDto.setC_end_date(resultSet.getString("c_end_date"));
                classDto.setMax_member(resultSet.getInt("max_member"));
                classDto.setC_price(resultSet.getInt("c_price"));
                classDto.setC_trainer_id(resultSet.getInt("c_trainer_id"));
                classDto.setC_trainer_name(resultSet.getString("c_trainer_name"));
                classDto.setC_ticket_id(resultSet.getInt("c_ticket_id"));
                classDto.setStart_time(resultSet.getString("start_time"));
                classDto.setEnd_time(resultSet.getString("end_time"));
                classDto.setTotal_attendees(resultSet.getInt("total_attendees"));
                classDto.setC_create_date(resultSet.getString("c_create_date"));

                return classDto;
            }
        }, email);
    }

    public List<ClassDto> findAllClassesForTheDayOfAnTrainer(String email) {
        sql = "SELECT DISTINCT a.class_id\n" +
                "FROM attendance a\n" +
                "JOIN class c ON a.class_id = c.class_id\n" +
                "JOIN trainer tr ON c.trainer_id = tr.trainer_id\n" +
                "JOIN users u ON tr.id_u = u.id_u\n" +
                "WHERE a.attendance_date = DATE(NOW()) AND u.email = ?";
        return jdbcTemplate.query(sql, new RowMapper<ClassDto>() {
            public ClassDto mapRow(ResultSet resultSet, int i) throws SQLException {
                ClassDto classDto = new ClassDto();
                classDto.setClass_id(resultSet.getInt("class_id"));
                return classDto;
            }
        }, email);
    }

    public void createClassWeekdays(String cn, String thu2, String thu3, String thu4, String thu5, String thu6, String thu7, int id_class) {
        try{
            sql = "INSERT INTO weekdays (cn, thu2, thu3, thu4, thu5, thu6, thu7, id_class) VALUES (?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql, cn, thu2, thu3, thu4, thu5, thu6, thu7, id_class);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int getMaxIdClassInSystem() {
            try{
                sql = "SELECT MAX(class_id) FROM class";
                int number = jdbcTemplate.queryForObject(sql, Integer.class);
                return number;
            }catch (Exception e){
                e.printStackTrace();
                return 0;
            }
    }

    public void updateStatusClassForStartDate() {
        try {
            sql = "UPDATE class set state = 1 WHERE class_id IN (SELECT class_id FROM class WHERE start_date <= CURDATE() AND state = 0)";
            jdbcTemplate.update(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateStatusClassForEndDate() {
        try {
            sql = "UPDATE class set state = -1 WHERE class_id IN (SELECT class_id FROM class WHERE end_date <= CURDATE() AND state = 1)";
            jdbcTemplate.update(sql);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int getNumberClassOfAnCustomer(int customer_id) {
        sql = "SELECT COUNT(*)\n" +
                "FROM user_class\n" +
                "join ticket_user u on user_class.ticket_user_id = u.ticket_user_id\n" +
                "join class c on user_class.class_id = c.class_id\n" +
                "JOIN trainer t ON c.trainer_id = t.trainer_id\n" +
                "JOIN users us ON t.id_u = us.id_u\n" +
                "WHERE user_class.user_id = ?";
        return jdbcTemplate.queryForObject(sql, Integer.class, customer_id);
    }
}
