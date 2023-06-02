package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TicketDao;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;

import java.util.List;
import java.util.Map;

@Service
public class TicketServiceImpl implements TicketService{

    @Autowired
    private TicketDao ticketDao;

    public List<Ticket> findAll() {
        return ticketDao.findAllTickets();
    }

    public List<TicketTrainerDto> findAllTicketTrainer() {
        return ticketDao.findAllTicketTrainer();
    }

    public List<TicketTrainerDto> findAllTicketClassForCustomer() {
        return ticketDao.findAllTicketClassForCustomer();
    }

    public List<TicketDto> findAllOfAdmin(int pagination_value, int type) {
        return ticketDao.findAllOfAdmin(pagination_value, type);
    }


    public Boolean checkClassExist(int userID, int class_id) {
        return ticketDao.findAnUserClass(userID, class_id) == 0;
    }

    public List<Ticket> findAllTicketClass() {
        return ticketDao.findAllTicketClass();
    }

    public void createTicket(String name, String price, String day, String type_id, int status, int ids) {
        ticketDao.createTicket(name, price,day, type_id, status, ids);
    }

    public void createTicketForTrainer(String ticketName, String ticketDay, int i) {
        ticketDao.createTicketForTrainer(ticketName, ticketDay, i);
    }

    public void createPersonalTicket(int id_trainer, int price, int ids) {
        ticketDao.createPersonalTicket(id_trainer, price, ids);
    }

    public void createTicketClass(int ids_class, String name, int id_trainer, int ids, int _id_time, int state,
                                  String start_date, String end_date, int _max_member, int _price) {
        ticketDao.createTicketClass(ids_class,name,id_trainer, ids, _id_time, state, start_date, end_date, _max_member, _price);
    }

    public int getNumberTicketInSystem() {
        return ticketDao.getNumberTicketInSystem();
    }

    public void deleteTickets(String id) {
        ticketDao.deleteAnTicket(id);
    }

    public List<Ticket> findAddTicketOfAnCustomer(int ticketTypeId, int id_customer, int pagination) {
        return ticketDao.findAddTicketOfAnCustomer(ticketTypeId, id_customer,pagination);
    }

    public int getNumberTicketInSystemPage(int status_num) {
        return ticketDao.getNumberTicketInSystem(status_num);
    }

    public int getNumberTicketDeleteInSystemPage() {
        return ticketDao.getNumberTicketDeleteInSystem();
    }

    public List<TicketDto> findAllDeleteTicketOfAdmin(int pagination_value) {
        return ticketDao.findAllDeleteTicketOfAdmin(pagination_value);
    }

    public void deleteClass(String id_str) {
        ticketDao.deleteClass(id_str);
    }

    public List<Map<Integer, Integer>> getDataOfAnTicket(int id) {
        return ticketDao.getDataOfAnTicket(id);
    }

    public Ticket findAnTicket(int id) {
        return ticketDao.findAnTicket(id);
    }

    public int getTotalNumberOrderOfTicket(int id) {
        return ticketDao.getTotalNumberOrderOfTicket(id);
    }

    public int getTotalNumberOrderOfTicketToday(int id) {
        return ticketDao.getTotalNumberOrderOfTicketToday(id);
    }

    public void updateStatusTicket(String ticket_id) {
        ticketDao.updateStatusTicket(ticket_id);
    }

    public int getNumberTicketOfAnCustomer(int i, int customer_id) {
        return ticketDao.getNumberTicketOfAnCustomer(i, customer_id);
    }
}
