package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.common.DataUtil;
import swp12.gym.dao.ClassDao;
import swp12.gym.dao.TicketUserDao;
import swp12.gym.dao.TicketUserDtoDao;
import swp12.gym.dao.UserPersonalTrainerDao;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketUserDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.model.entity.UserClass;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class TicketUserServiceImpl implements TicketUserService{

    @Autowired
    private TicketUserDao ticketUserDao;

    @Autowired
    private TicketUserDtoDao ticketUserDtoDao;

    @Autowired
    private UserPersonalTrainerDao userPersonalTrainerDao;

    @Autowired
    private ClassDao classDao;


    public TicketDto findAnTicket(long id) {
        return ticketUserDtoDao.findAnTicket(id);
    }

    public List<TicketUser> findTicketsOfUser(int userID) {
        return ticketUserDao.findTicketsOfUser(userID);
    }

    public List<TicketUserDto> findTicketUserOfSchedulePersonal(int userID) {
        return ticketUserDao.findTicketUserOfSchedulePersonal(userID);
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

        ticketUser.setPayment_Status(0);
        if (price != 0){
            ticketUser.setValue_Cost(price);
        }else {
            ticketUser.setValue_Cost(ticket.getT_price());
        }


        ticketUser.setId_t(id);
        ticketUser.setId_u(userID);

        ticketUserDao.insertAnTicketUser(ticketUser);
        return false;
    }

    public long findIDTicketUser() {
        return ticketUserDao.findIDTicketUser();
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

    public void deleteTicketUser(String id) {
        ticketUserDao.deleteTicketUser(id);
    }

    public void insertUserPersonal(long userID, int personalTrainerID, long ticketUserID) {
        userPersonalTrainerDao.insertUserPersonal(userID, personalTrainerID, ticketUserID);
    }

    public void insertUserClass(long userID, int class_id, long ticketUserID) {
        classDao.insertUserClass(userID, class_id, ticketUserID);
    }

    public void deleteUserPersonal(String id) {
        ticketUserDao.deleteUserPersonal(id);
    }

    public void deleteUserClass(String id) {
        ticketUserDao.deleteUserClass(id);
    }

    public void updateTicketUser(int userID) {
        ticketUserDao.updateTicketUser(userID);
    }

    public void updateUserClass(int userID) {
        ticketUserDao.updateUserClass(userID);
    }

    public void updateUserPersonal(int userID) {
        ticketUserDao.updateUserPersonal(userID);
    }

    public List<UserClass> checkUserClass(int userID) {
        return ticketUserDao.checkUserClass(userID);
    }
}
