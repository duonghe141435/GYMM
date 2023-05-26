package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.PersonalTrainerDetail;

import java.util.List;

@Service
public interface PersonalTrainerDetailService {
    List<PersonalTrainerDetail> findPersonalTrainerDetail(int user_id);

    List<PersonalTrainerDetail> findAllSchedulePersonalOfAnTrainer(int user_id);

    String checkPersonalTrainerDetail(int userID, String date);

    void insertPersonalTrainerDetail(List<String> date, int status, int personal_trainer_id, int time_id, int userID);

    int checkPersonalTrainerDetailForBookSchedule(int userID, List<String> date);
}
