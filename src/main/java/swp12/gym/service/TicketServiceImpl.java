package swp12.gym.service;

import swp12.gym.dao.TicketDao;
import swp12.gym.model.entity.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketDao ticketDao;

    public Ticket findAnTicket(int id) {
        return ticketDao.findAnTickets(id);
    }

    public void createTicket(Ticket ticket) {
        ticketDao.createTicket(ticket);
    }

    public void updateTickets(Ticket ticket) {

    }

    public void deleteTickets(int id_t) {
        ticketDao.deleteAnTicket(id_t);
    }

    public List<Ticket> findAll() {
      return ticketDao.findAllTickets();
    }

    public List<Ticket> findAllForAttribute() {
        return null;
    }

    public void createManyTickets() {

    }

    public int deleteManyTickets() {
        return 0;
    }

    public Ticket find() {
        return null;
    }

    public void createNewTicket(Ticket ticket) {

    }
}
