package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Time;

import java.util.List;

@Service
public interface TimeService {
    List<Time> findAll();
}
