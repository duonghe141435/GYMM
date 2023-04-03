package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;

import java.util.List;

@Service
public interface TicketService {

    List<TicketDto> findAll();

    List<TicketDto> findAllTicketDoor();

    List<TicketDto> findAllTicketTrainer();

    List<TicketDto> findAllTicketClass();

    //Create an tickets
    public void createTicket(String name, String price, String day, int type_id);

    //Create an have trainer
    void createTicketForTrainer(String ticketName, String ticketDay, int i);

    //Create an tickets personal
    void createPersonalTicket(String id_trainer, String price, int ids);

    int getNumberTicketInSystem();
}
