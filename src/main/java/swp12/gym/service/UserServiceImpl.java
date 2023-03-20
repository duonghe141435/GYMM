package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import swp12.gym.dao.UsersDao;
import swp12.gym.model.Entity.Users;

import java.util.List;

@Service("userService")
@Transactional

public class UserServiceImpl implements UserService {

    @Autowired
    private UsersDao usersDao;

    public Users findById(long id) {
        return usersDao.findById(id);
    }

    public Users findByName(String name) {
        return null;
    }

    public void saveUser(Users user) {

    }

    public void updateUser(Users user) {

    }

    public void lockUserById(long id) {

    }

    public List<Users> findAllUsers() {
        return usersDao.findAllUsers();
    }

    public boolean isUserExist(Users user) {
        return false;
    }

    public int getNumberUserInSystem() {
        return usersDao.getNumberUserInSystem();
    }
}
