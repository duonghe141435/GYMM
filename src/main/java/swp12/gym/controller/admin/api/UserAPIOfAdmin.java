package swp12.gym.controller.admin.api;

import swp12.gym.dao.UserDao;
import swp12.gym.model.entity.Product;
import swp12.gym.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UserAPIOfAdmin {

    private final String URL_API = "/admin/user-management";

    @Autowired
    private UserDao userDao;

    //Change lock of user
    @PatchMapping(value = URL_API+"/{id}/change_lock", produces = "text/plain;charset=UTF-8")
    public String changeLock(@PathVariable long id){
        try{
            return "fas fa-lock fa-lg fa-fw me-2 text-danger";

        }catch (Exception e){
            return null;
        }
    }

    //Gets a list of Product
    @GetMapping(value = URL_API , produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<User>> getsProduct(){

        try{
            List<User> users = new ArrayList<User>();
            users = userDao.findAllUsers();
            ResponseEntity<List<User>> responseEntity = new ResponseEntity<List<User>>(users, HttpStatus.OK);
            return responseEntity;
        }catch (Exception e){
            return new ResponseEntity<List<User>>(HttpStatus.BAD_REQUEST);
        }
    }


    //Create multiple Product
    @PostMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> createProduct(@RequestBody Product[] product){
        try{
            List<User> products = new ArrayList<User>();
            products = userDao.findAllUsers();
            ResponseEntity<User> responseEntity = new ResponseEntity<User>(HttpStatus.OK);
            return responseEntity;
        }catch (Exception e){
            return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
        }
    }

    //Update multiple
    @PutMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<User>> UpdateDataOfProduct(@RequestBody User user){
        try{
            return new ResponseEntity<List<User>>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<User>>(HttpStatus.BAD_REQUEST);
        }

    }

    //Delete multiple
    @DeleteMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<User>> DeleteProduct(@RequestBody int[] id){
        try{
            return new ResponseEntity<List<User>>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<List<User>>(HttpStatus.BAD_REQUEST);
        }
    }


    //Get An Product
    @GetMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<User>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
        }
    }

    //Create An Product
    @PostMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> createAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<User>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
        }
    }

    //Update An Product
    @PutMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> updateAnProduct(@PathVariable long id, @RequestBody User user){
        try{
            return new ResponseEntity<User>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
        }
    }

    //Delete An Product
    @DeleteMapping(value = URL_API+"/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> deleteAnProduct(@PathVariable long id){
        try{
            return new ResponseEntity<User>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
        }
    }
}
