package swp12.gym.service;

import org.springframework.stereotype.Service;

import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;

import java.util.List;

@Service
public interface TicketService {

    List<Ticket> findAll();

    List<TicketDto> findAllOfAdmin();

    List<Ticket> findAllGymTicket();

    List<Ticket> findAllTicketDoor();

    List<TicketTrainerDto> findAllTicketTrainer();

    List<Ticket> findAllTicketClass();

    //Create an tickets
    public void createTicket(String name, String price, String day, int typeId, int type_id);

    //Create an have trainer
    void createTicketForTrainer(String ticketName, String ticketDay, int i);

    public void createTicketClass(int ids_class, int id_trainer, int ids, int _id_time, int state,
                                  String start_date, String end_date, int _max_member, int _price);

    //Create an tickets personal
    void createPersonalTicket(int id_trainer, int price, int ids);

    void createClassWeekdays(int ids_weekdays, int cn, int thu2, int thu3, int thu4, int thu5, int thu6, int thu7, int ids_class);

    int getNumberTicketTrainerInSystem();

    int getNumberClassWeekendInSystem();

    int getNumberTicketInSystem();

    void deleteTickets(String id);

}
