package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.ClassDao;
import swp12.gym.dto.ClassDto;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService{

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

    public List<ClassDto> findAllScheduleClassOfAnTrainer(int id) {
        return classDao.findAllScheduleClassOfAnTrainer(id);
    }

    public ClassDto findDetailAnClass(int class_id) {
        return classDao.findDetailAnClass(class_id);
    }


    public List<ClassDto> findAllClassOfAnTicket(int ticket_id) {
        return classDao.findAllClassOfAnTicket(ticket_id);
    }

    public List<ClassDto> findAllClassOfAnTicketClass(int ticket_id) {
        return classDao.findAllClassOfAnTicketClass(ticket_id);
    }

    public List<ClassDto> findClassAllOfAnTrainer(String email) {
        return classDao.findClassAllOfAnTrainer(email);
    }

    public List<ClassDto> findClassAll() {
        return classDao.findAllClass();
    }


    public List<ClassDto> findAllTrainerClass(int ticket_id) {
        return classDao.findAllClassOfAnTicketClass(ticket_id);
    }

    public List<ClassDto> findAllClassNoneTicket() {
        return null;
    }

    public List<String[]> findScheduleCheckClass(String id_ticket, String id_trainer, String id_time) {
        return classDao.findScheduleCheckClass(id_ticket,id_time,id_trainer);
    }

    public void createNewClass(int id_class, String class_name, String time_id, int i, String start_date, String end_date, String trainer_id, String ticket_id, int max_member, int price, String dateNowToString) {
        classDao.createNewClass(id_class,class_name,time_id,i,start_date,end_date,trainer_id,ticket_id,max_member,price,dateNowToString);
    }

    public void createClassWeekdays(String cn, String thu2, String thu3, String thu4, String thu5, String thu6, String thu7, int ids_class) {
        classDao.createClassWeekdays(cn,thu2,thu3,thu4,thu5,thu6,thu7,ids_class);
    }

    public int getMaxIdClassInSystem() {
        return classDao.getMaxIdClassInSystem();
    }

    public void updateStatusClassForStartDate(String dateNowToString) {
        classDao.updateStatusClassForStartDate(dateNowToString);
    }

    public void updateStatusClassForEndDate(String dateNowToString) {
        classDao.updateStatusClassForEndDate(dateNowToString);
    }
}
