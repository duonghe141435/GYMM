package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;

import java.util.List;

@Service()
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersDao usersDao;

    public List<UserDto> findAll() {
        return usersDao.findAll();
    }

    public User findById(long id) {
        return usersDao.findById(id);
    }

    public User findByName(String name) {
        return null;
    }



    public int getNumberUserInSystem() { return usersDao.getNumberUserInSystem(); }

    public void createUser(UserDto user) {
        usersDao.createUser(user);
    }

    public void updateUser(User user) {

    }

    public void lockUserById(long id) {

    }

    public boolean isUserExist(User user) {
        return false;
    }



    public User getNameAndImgByEmail(String email) {
        return usersDao.getNameAndImgByEmail(email);
    }
}
