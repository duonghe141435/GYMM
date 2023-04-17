package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.model.entity.UserClass;

import java.time.LocalDateTime;
import java.util.List;

@Service
public interface TicketUserService {
    TicketDto findAnTicket(long id);

    boolean bookTicket(long id, long userID, String date, int price);

    long findIDTicketUser();

//    boolean checkTicketUser(long userID);

    LocalDateTime findEndDateTicket(long userID);

    LocalDateTime findEndDateTicketClass(long userID);

    LocalDateTime findEndDateTicketTrainerPersonal(long userID);

    void deleteTicketUser(String id);

    void insertUserPersonal(long userID, int personalTrainerID, long ticketUserID);

    void insertUserClass(long userID, int class_id, long ticketUserID);

    void deleteUserPersonal(String id);

    void deleteUserClass(String id);

    void updateTicketUser(int userID);

    void updateUserClass(int userID);

    void updateUserPersonal(int userID);

    List<UserClass> checkUserClass(int userID);
}
