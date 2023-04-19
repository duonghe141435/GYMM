package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ClassDto;

import java.util.List;

@Service
public interface ClassService {
    List<ClassDto> findClassAll();

    List<ClassDto> findAllClassOfAnUserById(int id);

    List<ClassDto> findAllScheduleClassOfAnUserById(int id);

    List<ClassDto> findAllClassOfAnTicket(int id);

    List<ClassDto> findDetailAnClass(int class_id);

    List<ClassDto> findAllTrainerClass(int ticket_id);

    List<ClassDto> findAllClassNoneTicket();

    List<String[]> findScheduleCheckClass(String id_ticket, String id_trainer, String id_time);

    void createNewClass(String class_name, String time_id, int i, String start_date, String end_date, String trainer_id, String ticket_id, int max_member, int price, String dateNowToString);

    List<ClassDto> findAllClassOfAnTicketClass(int id);
}
