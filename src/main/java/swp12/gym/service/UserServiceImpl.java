package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.UsersDao;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoAdmin;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UsersDao usersDao;

    public int findIdByUsername(String username) {
        return usersDao.findIdByUsername(username);
    }

    public List<UserDtoAdmin> findAllOfAdmin() {
        return usersDao.findAllOfAdmin();
    }

    public String getPasswordOfUser(String username) {
        return usersDao.getPasswordOfUser(username);
    }

    public void updatePasswordOfUser(String userDetailsUsername, String pass) {
        usersDao.updatePasswordOfUser(userDetailsUsername,pass);
    }

    public List<UserDto> findAll() {
        return usersDao.findAll();
    }

    public List<User> findAllTrainer(){ return usersDao.findAllTrainer(); }

    public List<User> findAllTrainerIdAndName() {
        return usersDao.findAllTrainerIdAndName();
    }

    public List<UserDto> findAllCustomer(){ return usersDao.findAllCustomer(); }

    public List<UserDto> findAllTrainerForAdmin() {
        return usersDao.findAllTrainerForAdmin();
    }

    public UserDto findAnUserById(int id) { return usersDao.findAnUserById(id); }

    public User getNameAndImgByEmail(String email) {
        return usersDao.getNameAndImgByEmail(email);
    }

    public int getNumberUserInSystem() {
        return usersDao.getMaxIdUserInSystem();
    }

    public void createUser(UserDto user) {
        usersDao.createUser(user);
    }

    public void updateUser(UserDto user) {
        usersDao.updateUser(user);
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
        return usersDao.findAnUserByEmail(username);
    }

    public UserDto getCustomerByEmail(String username) {
        return usersDao.findAnCustomerByEmail(username);
    }

    public int getMaxIdUserInSystem() {
        return usersDao.getMaxIdUserInSystem();
    }

    public void saveCustomerForGoogle(int ids, String email, String picture, int enable) {
        usersDao.saveCustomerForGoogle(ids,email,picture,enable);
    }

    public void createUserForGuest(User user) {
        usersDao.createNewUser(user);
    }

    public List<User> findAllUserOfAnClass(int class_id) {
        return usersDao.findAllUserOfAnClass(class_id);
    }

    public void updateStatusUser(int id_u) {
        usersDao.updateStatusUser(id_u);
    }

    //Admin Employee
    //Get All Employee by status
    public List<UserDto> findAllEmployee(int status, int pagination_value){
        return usersDao.findAllEmployee(status, pagination_value);
    }
    //Get number of Employee by status
    public int getNumberEmployeeInSystem(int status) {
        return usersDao.getNumberEmployeeInSystem(status);
    }
    //Get detail employee
    public UserDto getEmployeeById(int employee_id) {
        return usersDao.getEmployeeById(employee_id);
    }
    public List<UserDto> searchEmployee(String query){
        return usersDao.searchEmployee(query);
    }

    //Admin trainer
    public List<UserDto> findAllTrainer(int status, int pagination_value) {
       return usersDao.findAllTrainer(status, pagination_value);
    }

    public int getNumberTrainerInSystem(int status) {
        return usersDao.getNumberTrainerInSystem(status);
    }

    public UserDto getTrainerId(int employee_id) {
        return null;
    }

    public List<UserDto> searchTrainer(String query) {
        return usersDao.searchTrainer(query);
    }

    public List<UserDto> searchUser(String query) {
        return usersDao.searchUser(query);
    }



    public int lockAnUser(int id) {
        return 0;
    }

    public int deleteAnUser(int id) {
        return usersDao.deleteAnUser(id);
    }


}
