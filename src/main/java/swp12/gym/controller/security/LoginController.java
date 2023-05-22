package swp12.gym.controller.security;

import org.springframework.web.bind.annotation.*;
import swp12.gym.common.DataUtil;
import swp12.gym.common.EmailUtil;
import swp12.gym.common.GooglePojo;
import swp12.gym.common.GoogleUtils;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Token;
import swp12.gym.model.entity.User;
import swp12.gym.service.LogUserService;
import swp12.gym.service.RoleService;
import swp12.gym.service.TokenService;
import swp12.gym.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private GoogleUtils googleUtils;
    @Autowired
    private DataUtil dataUtil;
    @Autowired
    private LogUserService logUserService;
    @Autowired
    private EmailUtil emailUtil;
    @Autowired
    private TokenService tokenService;

    @RequestMapping("/login")
    public String login(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.equals("")) {
            if (message.equals("logout")) {
                model.addAttribute("message", "logout");
            }
            if (message.equals("account_error")) {
                model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không chính xác!");
            }
            if (message.equals("authorization_error")) {
                model.addAttribute("message", "Không đủ quyền truy cập.");
            }
            if (message.equals("session_error")) {
                model.addAttribute("message", "Lỗi thông tin.<br>Vui lòng đăng nhập lại!");
            }
            if (message.equals("google_error")) {
                model.addAttribute("message", "Đăng nhập bằng tài khoản google thất bại!");
            }
        }
        return "base/login";
    }

    @RequestMapping(value = "/login/{token_old}", method = RequestMethod.GET)
    public String activeUser(@PathVariable String token_old, final Model model, HttpServletRequest request) {
        String time = request.getParameter("expire_date");
        if(token_old.length() != 32){
            model.addAttribute("message", "Opp!..., Đường link này đã bị hỏng, hoặc hết hạn");
        }else {
            Token token = tokenService.ckeckingToken(token_old,time);
            if(token.getConfirm_date() != 0){
                //kieemr tra xem no active chuaw, neu cr thi thoi
                model.addAttribute("message", "Tài khoản của bạn đã kích hoạt rồi");
            }else if(dataUtil.getIntToDate() <= token.getExpire_date()){
                userService.updateStatusUser(token.getId_u());
                tokenService.updateToken(token_old,time,dataUtil.getIntToDate());
                model.addAttribute("message", "Tài khoản của bạn đã được kích hoạt");
            }else {
                model.addAttribute("message", "Opp!..., Đường link này đã hết hạn");
            }
        }
        return "base/login";
    }

    @RequestMapping("/login-google")
    public String loginGoogle(HttpServletRequest request,  HttpSession session) throws IOException {
        String code = request.getParameter("code");

        if (code == null || code.equals("")) {
            return "redirect:/login?message=google_error";
        }
        String accessToken = googleUtils.getToken(code);
        GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);

        UserDto userDto = userService.getUserByEmail(googlePojo.getEmail().trim());

        if(userDto != null){
            logUserService.saveLog(userDto.getU_id(),1,dataUtil.getIntToDate(),"Đăng nhập thành công");

            session.setAttribute("display_email", userDto.getU_email());
            session.setAttribute("display_name", userDto.getU_full_name());
            session.setAttribute("display_img", userDto.getU_img());
            if(userDto.getR_id() == 1){
                UserDetails userDetail = googleUtils.buildAdmin(googlePojo);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                return "redirect:/admin/ticket";
            }
            if(userDto.getR_id() == 2){
                UserDetails userDetail = googleUtils.buildEmployee(googlePojo);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                return "redirect:/employee/index";
            }
            if(userDto.getR_id() == 3){
                UserDetails userDetail = googleUtils.buildTrainer(googlePojo);
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
                return "redirect:/trainer/index";
            }
            session.setAttribute("display_email", userDto.getU_email());
            session.setAttribute("display_name", userDto.getU_full_name());
            session.setAttribute("display_img", userDto.getU_img());

            UserDetails userDetail = googleUtils.buildCustomer(googlePojo);
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return "redirect:/customer/home";
        }


        UserDetails userDetail = googleUtils.buildCustomer(googlePojo);
        int ids = userService.getMaxIdUserInSystem() + 1;
        userService.saveCustomerForGoogle(ids,googlePojo.getEmail().trim(), googlePojo.getPicture().trim(),1);
        roleService.saveRoleForUser(ids,4);

        session.setAttribute("display_email", googlePojo.getEmail().trim());
        session.setAttribute("display_name", googlePojo.getEmail().trim());
        session.setAttribute("display_img", googlePojo.getPicture().trim());

        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null, userDetail.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        logUserService.saveLog(ids,1,dataUtil.getIntToDate(),"Đăng nhập thành công");
        return "redirect:/customer/home";
    }

    @RequestMapping("/login_success")
    public String loginSuccess(HttpServletRequest request, HttpSession session, Authentication authentication){

        if (authentication != null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();

            // quyền của tài khoản hiện tại
            User user = userService.getNameAndImgByEmail(userName);

            session.setAttribute("display_email", userName);
            session.setAttribute("display_id", user.getU_id());
            session.setAttribute("display_name", user.getU_full_name());
            session.setAttribute("display_img", user.getU_img());

            int ids = userService.findIdByUsername(userName);

//            sendMail.sendMail();
            logUserService.saveLog(ids,1,dataUtil.getIntToDate(),"Đăng nhập thành công");

            // Check user's role and then redirect
            if (request.isUserInRole("ROLE_ADMIN")) {
                return "redirect:/admin/ticket";
            }
            if (request.isUserInRole("ROLE_EMPLOYEE")) {
                return "redirect:/employee/index";
            }
            if (request.isUserInRole("ROLE_TRAINER")) {
                return "redirect:/trainer/index";
            }
            // End: Check user's role and then redirect
        }
        return "redirect:/customer/home";
    }

    @RequestMapping("/access_denied")
    public String loginError(@RequestParam(required = false) String message, final Model model) {
        if (message != null && !message.equals("")) {
            if (message.equals("authorization_error")) {
                model.addAttribute("message", "Không đủ quyền hạn để truy cập!");
            }
        }
        return "base/access_denied";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String goRegisterPage(Model model){
        model.addAttribute("new_users", new User());
        return "base/register";
    }

    @RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
    public String goForgotPassword(@RequestParam(required = false) String message,final Model model){
        return "base/forgot-password";
    }

    @RequestMapping(value = "/resent/{id_hash}", method = RequestMethod.POST)
    public void reSentActiveMail(@PathVariable String id_hash){
    }

    @RequestMapping(value = "/register/create_user", method = RequestMethod.POST)
    public String saveNewUsers(@ModelAttribute("new_users")User user, final Model model, HttpServletRequest request){

        UserDto userDto = userService.getUserByEmail(user.getU_email());

        if(userDto == null){
            int id_u = userService.getMaxIdUserInSystem() + 1;
            String token =  dataUtil.GenerateToken();
            String service_name = request.getServerName();
            int service_port = request.getServerPort();
            user.setU_id(id_u);
            user.setU_password(BCrypt.hashpw(user.getU_password(), BCrypt.gensalt(10)));
            userService.createUserForGuest(user);
            roleService.saveRoleForUser(id_u,4);
            tokenService.createNewToken(token, dataUtil.getIntToDate(),id_u);
            String  url_active = "http://"+service_name+":"+service_port+"/login/"+token+"?expire_date="+(dataUtil.getIntToDate()+900);
            boolean flag = emailUtil.sentActiveEmail(user.getU_email(), user.getU_full_name(), url_active);
        }else {
            model.addAttribute("new_users", user);
            model.addAttribute("message", "Email đã tồn tại xin vui lòng nhập email khác");
            return "base/register";
        }
        return "redirect:/login";
    }
}
