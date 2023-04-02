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

    public void createTicket(String name, String price, String day, int type_id) {
        ticketDao.createTicket(name, price,day, type_id);
    }

    public void createTicketForTrainer(String ticketName, String ticketDay, int i) {
        ticketDao.createTicketForTrainer(ticketName, ticketDay, i);
    }

    public void createPersonalTicket(String id_trainer, String price, int ids) {
        ticketDao.createPersonalTicket(id_trainer, price, ids);
    }

    public int getNumberTicketInSystem() {
        return ticketDao.getNumberTicketInSystem();
    }

}
