package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.PersonalTrainerDetail;

import java.util.List;

@Service
public interface PersonalTrainerDetailService {
    List<PersonalTrainerDetail> findPersonalTrainerDetail(int user_id);
}
