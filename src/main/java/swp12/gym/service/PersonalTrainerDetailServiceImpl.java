package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.PersonalTrainerDetailDao;
import swp12.gym.model.entity.PersonalTrainerDetail;

import java.util.List;

@Service
public class PersonalTrainerDetailServiceImpl implements PersonalTrainerDetailService{

    @Autowired
    private PersonalTrainerDetailDao personalTrainerDetailDao;

    public List<PersonalTrainerDetail> findPersonalTrainerDetail(int user_id) {
        return personalTrainerDetailDao.findAllPersonalOfAnUserById(user_id);
    }

    public List<PersonalTrainerDetail> findAllSchedulePersonalOfAnTrainer(int user_id) {
        return personalTrainerDetailDao.findAllSchedulePersonalOfAnTrainer(user_id);
    }

    public String checkPersonalTrainerDetail(int userID, String date) {
        return personalTrainerDetailDao.checkPersonalTrainerDetail(userID, date);
    }

    public void insertPersonalTrainerDetail(List<String> date, int status, int personal_trainer_id, int time_id, int userID) {
        personalTrainerDetailDao.insertPersonalTrainerDetail(date, status, personal_trainer_id, time_id, userID);
    }

    public int checkPersonalTrainerDetailForBookSchedule(int userID, List<String> date) {
        return personalTrainerDetailDao.checkPersonalTrainerDetailForBookSchedule(userID, date);
    }
}
