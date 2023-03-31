package swp12.gym.service;

import org.springframework.stereotype.Service;

import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;

import java.util.List;

@Service
public interface TicketService {
    List<TicketDto> findAll();

    int getNumberTicketInSystem();

    void createTicket(Ticket ticket);
}
