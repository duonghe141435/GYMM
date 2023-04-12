package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.common.DataUtil;
import swp12.gym.dao.TicketUserDao;
import swp12.gym.dao.TicketUserDtoDao;
import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketUser;

import java.time.LocalDateTime;

@Service
public class TicketUserServiceImpl implements TicketUserService{

    @Autowired
    private TicketUserDao ticketUserDao;

    @Autowired
    private TicketUserDtoDao ticketUserDtoDao;


    public TicketDto findAnTicket(long id) {
        return ticketUserDtoDao.findAnTicket(id);
    }

    public boolean bookTicket(long id, long userID, String date, int price) {
        Ticket ticket = ticketUserDao.findAnTicket1(id);
        TicketUser ticketUser = new TicketUser();

        System.out.println("book ticket");
        ticketUser.setName(ticket.getT_name());
        ticketUser.setCreate_date(LocalDateTime.now());
        if (date == ""){
            ticketUser.setStart_date(LocalDateTime.now());
        }else {
            LocalDateTime endDate = new DataUtil().convertStringToLocalDateTime(date);
            ticketUser.setStart_date(endDate.plusDays(1));
        }
        if (date == ""){
            ticketUser.setEnd_date(LocalDateTime.now().plusDays(ticket.getT_total_days()));
        }else {
            LocalDateTime endDate = new DataUtil().convertStringToLocalDateTime(date);
            ticketUser.setEnd_date(endDate.plusDays(1 + ticket.getT_total_days()));
        }

        ticketUser.setPayment_Status(1);
        if (price != 0){
            ticketUser.setValue_Cost(price);
        }else {
            ticketUser.setValue_Cost(ticket.getT_price());
        }

        ticketUser.setDate_Payment(LocalDateTime.now());
        ticketUser.setId_t(id);
        ticketUser.setId_u(userID);

        ticketUserDao.insertAnTicketUser(ticketUser);
        return false;
    }

    public LocalDateTime findEndDateTicket(long userID) {
        LocalDateTime end_date = ticketUserDao.findDateAnTicket(userID);
        LocalDateTime now = LocalDateTime.now();
        if (end_date == null){
            return end_date;
        }else{
            if (end_date.isBefore(now)){
                end_date = null;
                return end_date;
            }else{
                return end_date;
            }
        }
    }

    public LocalDateTime findEndDateTicketClass(long userID) {
        LocalDateTime end_date = ticketUserDao.findDateAnTicketClass(userID);
        LocalDateTime now = LocalDateTime.now();

        if (end_date == null){
            return end_date;
        }else{
            if (end_date.isBefore(now)){
                end_date = null;
                return end_date;
            }else{
                return end_date;
            }
        }
    }

    public LocalDateTime findEndDateTicketTrainerPersonal(long userID) {
        LocalDateTime end_date = ticketUserDao.findDateAnTicketTrainerPersonal(userID);
        LocalDateTime now = LocalDateTime.now();

        if (end_date == null){
            return end_date;
        }else{
            if (end_date.isBefore(now)){
                end_date = null;
                return end_date;
            }else{
                return end_date;
            }
        }
    }
}
