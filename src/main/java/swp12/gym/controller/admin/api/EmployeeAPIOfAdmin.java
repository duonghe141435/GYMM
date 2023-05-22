package swp12.gym.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import swp12.gym.dto.UserDto;
import swp12.gym.service.OrderService;
import swp12.gym.service.RoleService;
import swp12.gym.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class EmployeeAPIOfAdmin {


    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OrderService orderService;

    private final String URL_API = "/admin/employee-management";

//    @GetMapping(value = URL_API, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
//    public ResponseEntity<?> getEmployeeForStatus(@RequestParam(name = "query") int query) {
//        try {
//            List<UserDto> results = userService.findAllEmployee(query);
//            Map<String, Object> result = new HashMap<String,Object>();
//            result.put("count",results.size());
//            result.put("employee",results);
//
//            return new ResponseEntity<Map<String,Object>>(result, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//        }
//    }
}
