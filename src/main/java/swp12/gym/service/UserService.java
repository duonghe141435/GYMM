package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.model.Entity.Users;

import java.util.List;

@Service
public interface UserService {

    Users findById(long id);
    Users findByName(String name);
    void saveUser(Users user);
    void updateUser(Users user);
    void lockUserById(long id);
    List<Users> findAllUsers();
    public boolean isUserExist(Users user);
    int getNumberUserInSystem();
}
