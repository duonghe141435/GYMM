package swp12.gym.service;

import swp12.gym.dao.UserDao;
import swp12.gym.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    public void createUser(User user) {
        userDao.saveUser(user);
    }

    public void resetPassword() { }

    public void lockUser() {

    }

    public List<User> findAll() {
        return userDao.findAllUsers();
    }
}
