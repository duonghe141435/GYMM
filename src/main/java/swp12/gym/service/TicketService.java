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

    int getNumberTicketInSystem();

    void createTicket(Ticket ticket);
}
