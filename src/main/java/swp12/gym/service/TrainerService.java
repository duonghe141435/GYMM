package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.TrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public interface TrainerService {

    List<UserDto> findAllTrainerPersonal(int ticket_id);

    List<ClassDto> findAllTrainerClass(int ticket_id);

    List<TrainerDto> findAllTrainerByTicket(int id);

}
