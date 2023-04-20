package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.ClassDto;

import java.util.List;

@Service
public interface ClassService {
    List<ClassDto> findAll();

    List<ClassDto> findAllClassOfAnUserById(int id);

    List<ClassDto> findAllScheduleClassOfAnUserById(int id);

    List<ClassDto> findAllClassOfAnTicket(int id);

    List<ClassDto> findDetailAnClass(int class_id);


    List<ClassDto> findAllClassOfAnTicketClass(int id);
}
