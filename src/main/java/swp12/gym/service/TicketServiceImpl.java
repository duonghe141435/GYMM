package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TicketDao;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService{

    @Autowired
    private TicketDao ticketDao;

    public List<Ticket> findAll() {
        return null;
    }

    public List<Ticket> findAllTicketDoor() { return ticketDao.findAllTicketDoor(); }

    public List<TicketTrainerDto> findAllTicketTrainer() { return ticketDao.findAllTicketTrainer(); }

    public List<Ticket> findAllTicketClass() {
        return null;
    }

    public void createTicket(String name, String price, String day, int typeId, int id_t) {
        ticketDao.createTicket(name, price,day, typeId, id_t);
    }

    public void createTicketForTrainer(String ticketName, String ticketDay, int i) {
        ticketDao.createTicketForTrainer(ticketName, ticketDay, i);
    }

    public void createPersonalTicket(int id_trainer, int price, int ids) {
        ticketDao.createPersonalTicket(id_trainer, price, ids);
    }

    public void createTicketClass(int ids_class, int id_trainer, int ids, int _id_time, int state, String start_date, String end_date, int _max_member, int _price) {
        ticketDao.createTicketClass(ids_class, id_trainer, ids, _id_time, state, start_date, end_date, _max_member, _price);
    }

    public void createClassWeekdays(int ids_weekdays, int cn, int thu2, int thu3, int thu4, int thu5, int thu6, int thu7, int ids_class) {
        ticketDao.createClassWeekdays(ids_weekdays,cn,thu2,thu3,thu4,thu5,thu6,thu7,ids_class);
    }

    public int getNumberTicketTrainerInSystem() {
        return ticketDao.getNumberTicketTrainerInSystem();
    }

    public int getNumberClassWeekendInSystem() {
        return ticketDao.getNumberClassWeekendInSystem();
    }

    public int getNumberTicketInSystem() {
        return ticketDao.getNumberTicketInSystem();
    }

    public void deleteTickets(String id) {
        ticketDao.deleteAnTicket(id);
    }

}
