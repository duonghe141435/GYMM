package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TicketDao;
import swp12.gym.model.Entity.Tickets;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService{

    @Autowired
    TicketDao ticketDao;

    public Tickets findById(long id) {
        return ticketDao.findById(id);
    }

    public Tickets findByName(String name) {
        return ticketDao.findByName(name);
    }

    public void createTicket(Tickets ticket) {
        ticketDao.createTicket(ticket);
    }

    public void updateTicket(Tickets ticket) {
        ticketDao.updateTicket(ticket);
    }

    public void deleteTicket(long id) {
        ticketDao.deleteTicket(id);
    }

    public List<Tickets> findAllTicketIsActive() {
        return ticketDao.findAllTicketIsActive();
    }


    public int getNumberUserInSystem() {
        return 0;
    }
}
