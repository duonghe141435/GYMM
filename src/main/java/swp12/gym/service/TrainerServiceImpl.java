package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TicketDao;
import swp12.gym.dao.TrainerDao;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.TrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public class TrainerServiceImpl implements TrainerService{

    @Autowired
    private UsersDao usersDao;

    @Autowired
    private TicketDao ticketDao;

    @Autowired
    private TrainerDao trainerDao;

    public List<UserDto> findAllTrainerPersonal(int ticket_id) {
        return usersDao.findAllTrainerPersonal(ticket_id);
    }

    public List<ClassDto> findAllTrainerClass(int ticket_id) {
        return ticketDao.findAllClassOfAnTicketClass(ticket_id);
    }

    public List<TrainerDto> findAllTrainerByTicket(int id) {
        return trainerDao.findAllTrainerByTicket(id);
    }

}
