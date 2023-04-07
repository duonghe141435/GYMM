package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public class TrainerServiceImpl implements TrainerService{

    @Autowired
    private UsersDao usersDao;


    public List<UserDto> findAllTrainerPersonal(int ticket_id) {
        return usersDao.findAllTrainerPersonal(ticket_id);
    }
}
