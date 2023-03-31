package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public interface UserService {

    List<UserDto> findAll();

    int getNumberUserInSystem();

    User getNameAndImgByEmail(String email);

    void createUser(UserDto user);

    User findById(long id);
    User findByName(String name);

    void updateUser(User user);
    void lockUserById(long id);

    public boolean isUserExist(User user);






}
