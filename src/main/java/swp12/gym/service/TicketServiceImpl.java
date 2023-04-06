package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TicketsDao;
import swp12.gym.dto.TicketClassDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;

import java.sql.Time;
import java.util.List;

@Service
public class TicketServiceImpl implements TicketService{

    @Autowired
    private TicketsDao ticketsDao;

    public List<Ticket> findAll() {
        return null;
    }

    public List<Ticket> findAllTicketDoor() {
        return null;
    }

    public List<TicketTrainerDto> findAllTicketTrainer() {
        return null;
    }

    public List<TicketClassDto> findAllTicketClass() {
        return null;
    }

    public List<Time> findAllTime() {
        return null;
    }

    public int getNumberTicketInSystem() {
        return 0;
    }

    public void createTicket(String name, String price, String day_other, int i, int ids) {

    }

    public void createPersonalTicket(String id, int price, int ids) {

    }

    public int getNumberClassInSystem() {
        return 0;
    }

    public int getNumberClassWeekendInSystem() {
        return 0;
    }

    public void createTicketClass(int ids_class, int id_trainer, int ids, int _id_time, int state, String start_date, String end_date, int _max_member, int _price) {

    }

    public void createClassWeekdays(int ids, int cn, int thu2, int thu3, int thu4, int thu5, int thu6, int thu7, int id_class) {

    }

    public void deleteTickets(String id) {

    }
}
