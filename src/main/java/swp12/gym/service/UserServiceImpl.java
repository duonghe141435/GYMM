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

    public UserDto findAnUserById(int id) { return usersDao.findAnUserById(id); }

    public User getNameAndImgByEmail(String email) {
        return usersDao.getNameAndImgByEmail(email);
    }

    public int getNumberUserInSystem() {
        return 0;
    }

    public void createUser(UserDto user) {
        usersDao.createUser(user);
    }

    public void updateUser(UserDto user) {

    }

    public void createStaff(int id_u) {

    }

    public void deleteStaff(int u_id) {

    }

    public boolean isExistsStaff(int u_id) {
        return false;
    }

    public void createTrainer(int id_u, int year_experience) {

    }

    public void deleteTrainer(int u_id) {

    }

    public boolean isExistsTrainer(int u_id) {
        return false;
    }

    public void updateExperienceTrainer(int u_id, int year_experience) {

    }
}
