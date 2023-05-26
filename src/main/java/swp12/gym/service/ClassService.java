package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ClassDto;

import java.util.List;

@Service
public interface ClassService {
    List<ClassDto> findClassAll();

    List<ClassDto> findAllClassOfAnUserById(int id);

    List<ClassDto> findAllScheduleClassOfAnUserById(int id);

    List<ClassDto> findAllScheduleClassOfAnTrainer(int id);

    List<ClassDto> findAllClassOfAnTicket(int id);

    ClassDto findDetailAnClass(int class_id);

    List<ClassDto> findAllTrainerClass(int ticket_id);

    List<ClassDto> findAllClassNoneTicket();

    List<String[]> findScheduleCheckClass(String id_ticket, String id_trainer, String id_time);

    void createNewClass(int id_class, String class_name, String time_id, int i, String start_date, String end_date, String trainer_id, String ticket_id, int max_member, int price, String dateNowToString);

    List<ClassDto> findAllClassOfAnTicketClass(int id);

    List<ClassDto> findClassAllOfAnTrainer(String trainer_email);

    void createClassWeekdays(String cn, String thu2, String thu3, String thu4, String thu5, String thu6, String thu7, int ids_class);

    int getMaxIdClassInSystem();

    List<ClassDto> findAllClassesForTheDayOfAnTrainer(String trainer_email);
}
