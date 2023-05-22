package swp12.gym.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.dto.UserDto;
import swp12.gym.service.UserService;

import java.util.List;

@RestController
public class UserAPIOfAdmin {

    private final String URL_API = "/admin/user-management";

    @Autowired
    private UserService userService;

    //Get An Product
    @GetMapping(value = URL_API+"/search", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<UserDto>> search(@RequestParam(name = "query") String query){
        try{
            System.out.println(query);
            List<UserDto> results = userService.searchUser(query);
            return new ResponseEntity<List<UserDto>>(results, HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<List<UserDto>>(HttpStatus.BAD_REQUEST);
        }
    }

    //Get An Product
    @GetMapping(value = URL_API+"/delete/{id}", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> search(Model model, @PathVariable int id){
        try{
            String notify = "";
            int ids = userService.deleteAnUser(id);
            if(id == 0){
                notify = "Xóa thất bại";
            }else {
                notify = "Xóa thành công";
            }
            return new ResponseEntity<String>(notify, HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}
