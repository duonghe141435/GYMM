package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.TicketType;

import java.util.List;

@Service
public interface TicketTypeService {
    List<TicketType> findAll();
}
