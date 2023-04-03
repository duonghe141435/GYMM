package swp12.gym.service;

import swp12.gym.dao.UserDao;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    public List<UserDto> findAll() {
        return null;
    }

    public List<UserDto> findAllTrainer() {
        return null;
    }

    public List<User> findAllTrainerIdAndName() {
        return null;
    }

    public List<UserDto> findAllCustomer() {
        return null;
    }

    public List<UserDto> findAllEmployee() {
        return null;
    }

    public UserDto findAnUserById(int id) {
        return null;
    }

    public User getNameAndImgByEmail(String email) {
        return null;
    }

    public int getNumberUserInSystem() {
        return 0;
    }

    public void createUser(UserDto user) {

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
