package swp12.gym.service;

import swp12.gym.dao.TicketDao;
import swp12.gym.dao.TicketDtoDao;
import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketDao ticketDao;
    @Autowired
    private TicketDtoDao ticketDtoDao;

    public TicketDto findAnTicket(int id) {
        return ticketDtoDao.findAnTickets(id);
    }

    public void createTicket(Ticket ticket) {
        ticketDao.createTicket(ticket);
    }

    public void updateTickets(Ticket ticket) { ticketDao.updateTickets(ticket); }

    public void deleteTickets(int id_t) {
        ticketDao.deleteAnTicket(id_t);
    }

    public List<TicketDto> findAll() {
      return ticketDtoDao.findAll();
    }

    public List<Ticket> findAllForAttribute() {
        return null;
    }

    public void createManyTickets() { }

    public int deleteManyTickets() {
        return 0;
    }

    public int getNumberTicketInSystem() {
        return ticketDao.getNumberTicketInSystem();
    }

}
