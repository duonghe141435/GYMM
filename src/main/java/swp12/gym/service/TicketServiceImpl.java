package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import swp12.gym.dao.TicketDao;
import swp12.gym.dto.TicketDto;
import swp12.gym.model.entity.Ticket;

import java.util.List;

public class TicketServiceImpl implements TicketService{

    @Autowired
    private TicketDao ticketDao;

    public List<TicketDto> findAll() {
        return null;
    }

    public List<TicketDto> findAllTicketDoor() {
        return null;
    }

    public List<TicketDto> findAllTicketTrainer() {
        return null;
    }

    public List<TicketDto> findAllTicketClass() {
        return null;
    }

    public int getNumberTicketInSystem() {
        return 0;
    }

    public void createTicket(Ticket ticket) {

    }
}
