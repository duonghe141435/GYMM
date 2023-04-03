package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.Unit;

import java.util.List;

@Service
public interface UnitService {
    List<Unit> findAll();

    int getTotalItemInSystem();

    void createUnit(int id, String type);
}
