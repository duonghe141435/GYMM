package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoAdmin;
import swp12.gym.dto.UserDtoDao;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UsersDao usersDao;

    @Autowired
    private UserDtoDao userDtoDao;

    public List<UserDtoAdmin> findAllOfAdmin() {
        return usersDao.findAllOfAdmin();
    }

    public List<UserDto> findAll() {
        return usersDao.findAll();
    }

    public List<User> findAllTrainer(){ return usersDao.findAllTrainer(); }

    public List<User> findAllTrainerIdAndName() {
        return usersDao.findAllTrainerIdAndName();
    }

    public List<UserDto> findAllCustomer(){ return usersDao.findAllCustomer(); }

    public List<UserDto> findAllEmployee(){ return usersDao.findAllEmployee(); }

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
        usersDao.createStaff(id_u);
    }

    public void deleteStaff(int u_id) {
        usersDao.deleteStaff(u_id);
    }

    public boolean isExistsStaff(int u_id) {
        return usersDao.isExistsStaff(u_id) != 0;
    }

    public void createTrainer(int id_u, int year_experience) {
        usersDao.createTrainer(id_u, year_experience);
    }

    public void deleteTrainer(int u_id) {
        usersDao.deleteTrainer(u_id);
    }

    public boolean isExistsTrainer(int u_id) {
        return usersDao.isExistsTrainer(u_id) != 0;
    }

    public void updateExperienceTrainer(int u_id, int year_experience) {
        usersDao.updateExperienceTrainer(u_id, year_experience);
    }

    public UserDto getUserByEmail(String username) {
        return userDtoDao.findAnUserByEmail(username);
    }
}
