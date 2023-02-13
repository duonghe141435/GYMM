package swp12.gym.controller.admin.restAPI;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import swp12.gym.model.Entity.Users;
import swp12.gym.service.UserService;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UserAPIForAdmin {

    @Autowired
    private UserService userService;

    @PostMapping(value = "/user", consumes = {"application/xml","application/json"})
    public ResponseEntity<Users> createUser(@RequestBody Users users){
        int lastIndex = userService.getNumberUserInSystem();
        users.setId(lastIndex+1);
        users.setPassword(BCrypt.hashpw(users.getPassword(),BCrypt.gensalt(10)));
        userService.saveUser(users);
        return new ResponseEntity<Users>(HttpStatus.OK);
    }

    @GetMapping(value = "/user/{id}")
    public Users getDataOfUser(@PathVariable long id){
        return userService.findById(id);
    }

    @GetMapping(value = "/user")
    public List<Users> getAllUserForAdmin(){
        List<Users> usersList = new ArrayList<Users>();
        usersList = userService.findAllUsers();
        return usersList;
    }

    @PutMapping("/user/{id}")
    public void UpdateDataOfUser(@RequestBody Users users){
        userService.saveUser(users);
    }

    @DeleteMapping()
    public void deleteUser(){ }

}
