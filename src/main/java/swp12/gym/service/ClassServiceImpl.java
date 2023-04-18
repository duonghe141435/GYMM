package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.ClassDao;
import swp12.gym.dao.TicketDao;
import swp12.gym.dto.ClassDto;

import java.util.List;

@Service
class ClassServiceImpl implements ClassService{

    @Autowired
    private ClassDao classDao;
    @Autowired
    private TicketDao ticketDao;

    public List<ClassDto> findAll() {
        return classDao.findAllClass();
    }

    public List<ClassDto> findAllClassOfAnUserById(int user_id) {
        return classDao.findAllClassOfAnUserById(user_id);
    }

    public List<ClassDto> findAllScheduleClassOfAnUserById(int user_id) {
        return classDao.findAllScheduleClassOfAnUserById(user_id);
    }

    public List<ClassDto> findAllClassOfAnTicket(int id) {
        return classDao.findAllClassOfAnTicket(id);
    }

    public List<ClassDto> findDetailAnClass(int class_id) {
        return classDao.findDetailAnClass(class_id);
    }

    public List<ClassDto> findAllTrainerClass(int ticket_id) {
        return ticketDao.findAllClassOfTicketClass(ticket_id);
    }
}
