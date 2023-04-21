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
}
