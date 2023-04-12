package swp12.gym.controller.security;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.service.UserService;

import javax.servlet.http.HttpServletRequest;

@RestController
public class LoginAPI {

    @Autowired
    private UserService userService;

    private final String URL_API = "/users/user-management";

    @PostMapping(value = URL_API + "/change-pass", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> changePassword(Authentication authentication, HttpServletRequest request) {
        try {

            String notify = "";
            String pass_old = request.getParameter("_pass_old");
            String new_pass = request.getParameter("_pass_new");
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            //so sanh mat khau
            String pass = userService.getPasswordOfUser(userDetails.getUsername());

            if (BCrypt.checkpw(pass_old, pass)) {
                userService.updatePasswordOfUser(userDetails.getUsername(),
                        BCrypt.hashpw(new_pass, BCrypt.gensalt(10)));
                notify = "Bạn đã đổi mật khẩu thành công";

            } else {
                notify = "Mật khẩu cũ của bạn không chính sác";
            }



            return new ResponseEntity<String>(notify, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

    }
}
