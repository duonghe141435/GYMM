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

    }

    public void createTicketForTrainer(String ticketName, String ticketDay, int i) {

    }

    public void createPersonalTicket(String id_trainer, String price, int ids) {

    }

    public int getNumberTicketInSystem() {
        return ticketDao.getNumberTicketInSystem();
    }

}
