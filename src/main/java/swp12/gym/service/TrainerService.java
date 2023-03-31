package swp12.gym.service;

import org.springframework.stereotype.Service;

@Service
public interface TrainerService {
    void createNewTrainer(int id_u, int year_experience);
}
