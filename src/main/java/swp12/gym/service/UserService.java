package swp12.gym.service;

import org.springframework.stereotype.Service;
import swp12.gym.dto.UserDto;
import swp12.gym.dto.UserDtoAdmin;
import swp12.gym.model.entity.Attendance;
import swp12.gym.model.entity.User;

import java.util.List;

@Service
public interface UserService {

    int findIdByUsername(String username);
    List<UserDtoAdmin> findAllOfAdmin();
    String getPasswordOfUser(String username);
    void updatePasswordOfUser(String username, String hashpw);
    //Get All User
    List<UserDto> findAll();
    //Get All Trainer
    List<User> findAllTrainer();
    List<User> findAllTrainerIdAndName();
    //Get All Customer
    List<UserDto> findAllCustomer();
    //Get All Trainer
    List<UserDto> findAllTrainerForAdmin();
    //Get An User By Id
    UserDto findAnUserById(int id);
    //Get Name and Email By email of user
    User getNameAndImgByEmail(String email);
    //Get number user in system
    int getNumberUserInSystem();
    //Create new user in system
    void createUser(UserDto user);
    //Update Information of user in system
    void updateUser(UserDto user);

    //Create new staff in System
    void createStaff(int id_u);
    //Delete staff in System(This is function lock staff)
    void deleteStaff(int u_id);
    //Checking user is staff or not
    boolean isExistsStaff(int u_id);

    //Create new trainer in System
    void createTrainer(int id_u, int year_experience);
    //Delete staff in System(This is function lock staff)
    void deleteTrainer(int u_id);
    //Checking user is staff or not
    boolean isExistsTrainer(int u_id);
    //update information of trainer
    void updateExperienceTrainer(int u_id, int year_experience);

    UserDto getUserByEmail(String userName);

    UserDto getCustomerByEmail(String userName);


    int getMaxIdUserInSystem();

    void saveCustomerForGoogle(int ids, String trim, String trim1, int i);

    void createUserForGuest(User user);

    List<User> findAllUserOfAnClass(int class_id);

    List<Attendance> findAllAttendaneUserOfAnClass(int class_id);

    void updateStatusUser(int id_u);

    //Admin Employee
    //Get All Employee by status
    List<UserDto> findAllEmployee(int status, int pagination_value);
    //Get number of Employee by status
    int getNumberEmployeeInSystem(int status);
    //Get detail employee
    UserDto getEmployeeById(int employee_id);
    //search employee
    List<UserDto> searchEmployee(String query);
    //delete status status search status
    int lockAnUser(int id);
    //delete status status search status
    int deleteAnUser(int id);

    List<UserDto> searchUser(String query);


    //Admin Trainer
    //Get All Employee by status
    List<UserDto> findAllTrainer(int status, int pagination_value);
    //Get number of Employee by status
    int getNumberTrainerInSystem(int status);
    //Get detail employee
    UserDto getTrainerId(int employee_id);
    //search employee
    List<UserDto> searchTrainer(String query);
    //delete status status search status
}
