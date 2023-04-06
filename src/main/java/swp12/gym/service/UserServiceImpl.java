package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.StaffDto;
import swp12.gym.dto.TrainerDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersDao usersDao;


    public List<UserDto> findAll() {
        return usersDao.findAll();
    }

    public UserDto findAnUserById(int id) {
        return usersDao.findAnUserById(id);
    }

    public User getNameAndImgByEmail(String email) {
        return usersDao.getNameAndImgByEmail(email);
    }

    public int getNumberUserInSystem() {
        return usersDao.getNumberUserInSystem();
    }

    public void createUser(UserDto user) {
        usersDao.createUser(user);
    }

    public void updateUser(UserDto user) {
        usersDao.updateUser(user);
    }

    public int getNumberTrainerInSystem() {
        return usersDao.getNumberTrainerInSystem();
    }

    public List<User> findAllEmployee() {
        return usersDao.findAllEmployee();
    }

    public StaffDto findAnEmployeeByEmail(String email) {
        return usersDao.findAnEmployeeByEmail(email);
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

    public int getNumberEmployeeInSystem() {
        return usersDao.getNumberEmployeeInSystem();
    }

    public List<User> findAllTrainer() {
        return usersDao.findAllTrainer();
    }

    public TrainerDto findAnTrainerByEmail(String email) {
        return usersDao.findAnTrainerByEmail(email);
    }

    public void createTrainer(int id_u, int year_experience) {
        usersDao.createTrainer(id_u,year_experience);
    }

    public void deleteTrainer(int u_id) {
        usersDao.deleteTrainer(u_id);
    }

    public boolean isExistsTrainer(int u_id) { return usersDao.isExistsTrainer(u_id) != 0; }

    public void updateExperienceTrainer(int u_id, int year_experience) {
        usersDao.updateExperienceTrainer(u_id, year_experience);
    }

    public void createUserForGuest(User user) { usersDao.createUserForGuest(user); }

    public boolean isExistsUser(String email) { return usersDao.isExistsUser(email) != 0; }
}
