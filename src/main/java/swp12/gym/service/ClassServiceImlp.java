package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.ClassDao;
import swp12.gym.dto.ClassDto;

import java.util.List;

@Service
public class ClassServiceImlp implements ClassService{

    @Autowired
    private ClassDao classDao;

    public List<ClassDto> findAll() {
        return classDao.findAllClass();
    }

    public List<ClassDto> findAllClassOfAnUserById(int user_id) {
        return classDao.findAllClassOfAnUserById(user_id);
    }

    public List<ClassDto> findAllScheduleClassOfAnUserById(int user_id) {
        return classDao.findAllScheduleClassOfAnUserById(user_id);
    }
}
