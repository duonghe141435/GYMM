package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.TicketClassDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;

import java.sql.Time;
import java.util.List;

@Service
public interface TicketService {

    List<Ticket> findAll();

    List<Ticket> findAllTicketDoor();

    List<TicketTrainerDto> findAllTicketTrainer();

    List<TicketClassDto> findAllTicketClass();

    List<Time> findAllTime();

    int getNumberTicketInSystem();

    void createTicket(String name, String price, String day_other, int i, int ids);

    void createPersonalTicket(String id, int price, int ids);

    int getNumberClassInSystem();

    int getNumberClassWeekendInSystem();

    void createTicketClass(int ids_class, int id_trainer, int ids, int _id_time, int state, String start_date,
                           String end_date, int _max_member, int _price);

    void createClassWeekdays(int ids, int cn, int thu2, int thu3, int thu4, int thu5, int thu6, int thu7, int id_class);

    void deleteTickets(String id);
}
