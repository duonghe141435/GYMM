package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.Entity.Tickets;

import java.util.List;

@Service
public interface TicketService {
    Tickets findById(long id);
    Tickets findByName(String name);
    void createTicket(Tickets ticket);
    void updateTicket(Tickets ticket);
    void deleteTicket(long id);
    List<Tickets> findAllTicketIsActive();
    int getNumberUserInSystem();
}
