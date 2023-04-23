package swp12.gym.controller.security;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import swp12.gym.common.DataUtil;
import swp12.gym.common.EmailUtil;
import swp12.gym.dto.UserDto;
import swp12.gym.service.LogUserService;
import swp12.gym.service.UserService;

import javax.servlet.http.HttpServletRequest;

@RestController
public class LoginAPI {

    @Autowired
    private UserService userService;
    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private EmailUtil emailUtil;
    @Autowired
    private LogUserService logUserService;

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
                notify = "success-Bạn đã đổi mật khẩu thành công";
            } else {
                notify = "fail-Mật khẩu cũ của bạn không chính sác";
            }
            return new ResponseEntity<String>(notify, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = "/reset-pass", produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> resetPassword(HttpServletRequest request) {
        String notify = "";
        try {
            String email = request.getParameter("email");
            UserDto userDto = userService.getUserByEmail(email);
            if(userDto != null){
                String new_pass = dataUtil.generatePassword();
                System.out.println(new_pass);
                userService.updatePasswordOfUser(email,
                        BCrypt.hashpw(new_pass, BCrypt.gensalt(10)));

                emailUtil.sentMailRestPassWord(email,userDto.getU_full_name(),new_pass);
                notify = "success-Mật khẩu mới đã được gửi đến Email của bạn";
                logUserService.saveLog(userDto.getU_id(),1,dataUtil.getIntToDate(),"Thay đổi mật khẩu");
            }else {
                notify = "fail-Email của bạn không tồn tại trong hệ thống";
            }
            return new ResponseEntity<String>(notify, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }
}
