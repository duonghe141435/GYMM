package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.ClassDao;
import swp12.gym.dao.TicketDao;
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

    public List<ClassDto> findDetailAnClass(int class_id) {
        return classDao.findDetailAnClass(class_id);
    }


    public List<ClassDto> findAllClassOfAnTicket(int ticket_id) {
        return classDao.findAllClassOfAnTicket(ticket_id);
    }

    public List<ClassDto> findAllClassOfAnTicketClass(int ticket_id) {
        return classDao.findAllClassOfAnTicketClass(ticket_id);
    }
}
