package swp12.gym.service;

import swp12.gym.model.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    //Create an Users
    public void createUser(User user);

    //Reset password of Users
    public void resetPassword();

    //Lock account of Users
    public void lockUser();

    //Get all users
    public List<User> findAll();
}
