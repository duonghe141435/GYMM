package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.controller.admin.base.UserDto;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public interface UserService {
    User getNameAndImgByEmail(String userName);

    List<UserDto> findAll();

    int getNumberUserInSystem();
}
