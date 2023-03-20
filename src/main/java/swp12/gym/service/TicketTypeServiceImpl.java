package swp12.gym.service;

import swp12.gym.dao.TicketTypeDao;
import swp12.gym.model.entity.TicketType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketTypeServiceImpl implements TicketTypeService{

    @Autowired
    private TicketTypeDao ticketTypeDao;

    public TicketType findTickets() {
        return null;
    }

    public void createTicket(TicketType ticket) {

    }

    public void updateTickets(TicketType ticket) {

    }

    public void deleteTickets(TicketType ticket) {

    }

    public List<TicketType> findAll() {
        return ticketTypeDao.findAllTickets();
    }

    public List<TicketType> findAllForAttribute() {
        return null;
    }

    public void createManyTickets() {

    }

    public int deleteManyTickets() {
        return 0;
    }
}
