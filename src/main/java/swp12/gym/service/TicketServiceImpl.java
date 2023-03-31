package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TicketsDao;
import swp12.gym.dto.TicketDto;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService{

    @Autowired
    private TicketsDao ticketsDao;

    public List<TicketDto> findAllTicketDoor() {
        return ticketsDao.findAllTicketDoor();
    }

    public List<TicketDto> findAllTicketPersonalTrainer() {
        return ticketsDao.findAllTicketPersonalTrainer();
    }
}
