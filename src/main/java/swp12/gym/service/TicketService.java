package swp12.gym.service;

import swp12.gym.model.entity.Ticket;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TicketService {

    //===============One Object===============//

    //Get an tickets
    public Ticket findAnTicket(int id);

    //Create an tickets
    public void createTicket(Ticket ticket);

    //Update an tickets
    public void updateTickets(Ticket ticket);

    //Delete an Tickets (Lock tickets)
    public void deleteTickets(int id_t);

    //===============Many Object===============//

    //Get all tickets
    public List<Ticket> findAll();

    //Get all tickets for something
    public List<Ticket> findAllForAttribute();

    //Create many tickets for ...
    public void createManyTickets();

    //Delete many tickets for ...
    public int deleteManyTickets();
}
