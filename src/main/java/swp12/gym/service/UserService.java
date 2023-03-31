package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.entity.User;

@Service
public interface UserService {
    User getNameAndImgByEmail(String userName);
}
