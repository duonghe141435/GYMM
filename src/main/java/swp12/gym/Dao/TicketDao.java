package swp12.gym.dao;

import swp12.gym.model.entity.Ticket;
import swp12.gym.model.mapper.TicketMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TicketDao {
// lich tap cua trainer - co dinh hay ko co dinh, neu co dinh, thif co dinh theo gif ngay thang nam, thoi gian cong viec
    //tao 1 bang lich taapj - khoa sat lai - xep lich mk;`
    // 2 - 3 loai giao dich, tuy thuoc ve vao pt co la

    //product - spma phan loai
    //check auto =>  dua ra canh check ntn button check in ve
    //ai la nguoi xem danh sach nhan vien o trong may

    //check in, check out
    //quan ly san pham - ai se lam, ai se mua

    //phan tich nghiep vu

    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String sql;

    public List<Ticket> findAllTickets(){
        sql = "SELECT * FROM ticket WHERE status = 1";
        return jdbcTemplate.query(sql, new TicketMapper());
    }

    public Ticket findAnTickets(int id){
        sql = "SELECT * FROM ticket WHERE id_t = ? AND status = 1";
        return jdbcTemplate.queryForObject(sql, new TicketMapper(), id);
    }

    public void createTicket(Ticket ticket) {
        sql = "INSERT INTO ticket (id_t, tt_id, price, note, total_days, status, name) VALUES (?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql,ticket.getT_id(),ticket.getTt_id(),ticket.getT_price(),
                ticket.getT_note(),ticket.getT_total_days(),1,ticket.getT_name());
    }

    public void deleteAnTicket(int id_t){
        sql = "UPDATE ticket SET status = 0 WHERE id_t = ?";
        jdbcTemplate.update(sql,id_t);
    }
}
