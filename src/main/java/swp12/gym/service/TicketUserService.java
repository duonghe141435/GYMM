package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.TicketDto;

import java.time.LocalDateTime;

@Service
public interface TicketUserService {
    TicketDto findAnTicket(long id);

    boolean bookTicket(long id, long userID, String date, int price);

//    boolean checkTicketUser(long userID);

    LocalDateTime findEndDateTicket(long userID);

    LocalDateTime findEndDateTicketClass(long userID);

    LocalDateTime findEndDateTicketTrainerPersonal(long userID);
}
