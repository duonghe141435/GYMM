package swp12.gym.service;

import swp12.gym.model.entity.TicketType;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TicketTypeService {

    //Get an ticket type
    public TicketType findTickets();

    //Create an ticket type
    public void createTicket(TicketType ticket);

    //Update an ticket type
    public void updateTickets(TicketType ticket);

    //Delete an ticket type (Lock ticket type)
    public void deleteTickets(TicketType ticket);

    //===============Many Object===============//

    //Get all ticket type
    public List<TicketType> findAll();

    //Get all ticket type for something
    public List<TicketType> findAllForAttribute();

    //Create many ticket type for ...
    public void createManyTickets();

    //Delete many ticket type for ...
    public int deleteManyTickets();
}
