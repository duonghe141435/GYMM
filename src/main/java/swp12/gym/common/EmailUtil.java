package swp12.gym.common;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.stereotype.Component;

import java.util.Properties;

@Component
public class EmailUtil {
    private final String email_form = "gymmasterg12@gmail.com";
    private final String username = "gymmasterg12";
    private final String password = "tkizkludycmdbzwr";

    private Properties properties = new Properties();

    private Session BuildProperties(){
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.host", "smtp.gmail.com");

        return Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username,password);
            }
        });
    }


    public boolean sentMailRestPassWord(String email_to, String name, String new_pass){
        boolean flag = false;
        try{
            MimeMessage message = new MimeMessage(BuildProperties());
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email_to));
            message.setFrom(new InternetAddress(email_form));

            String subject = "Mật khẩu của bạn đã được thay đổi";
            message.setSubject(subject,"UTF-8");
            String htmlContent = "<html><body>"
                    + "<p>Xin chào, "+ name + "</p>"
                    + "<p><em>Đây là tin nhắn tự động-- vui lòng không trả lời vì bạn sẽ không nhận được phản hồi.</em></p>"
                    + "<p>Bạn đã yêu cầu reset lại mật khẩu."
                    + "<p>Mật khẩu mới của bạn là: <strong>" + new_pass + "</strong> </p>"
                    + "<p>Trân trọng,</p>"
                    + "<p>Gym Master</p>" +
                    "</body></html>";

            // Thiết lập nội dung của email với đoạn mã HTML
            message.setContent(htmlContent, "text/html; charset=utf-8");
            Transport.send(message);
            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    public boolean sentActiveEmail(String u_email, String u_full_name, String url_active) {
        boolean flag = false;
        try{
            MimeMessage message = new MimeMessage(BuildProperties());
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(u_email));
            message.setFrom(new InternetAddress(email_form));

            String subject = "Bạn đã đăng ký tài khoản thành công";
            message.setSubject(subject,"UTF-8");
            String htmlContent = "<html><body>"
                    + "<p>Xin chào, "+ u_full_name + "</p>"
                    + "<p><em>Đây là tin nhắn tự động-- vui lòng không trả lời vì bạn sẽ không nhận được phản hồi.</em></p>"
                    + "<p>Bạn đã tạo tài khoản thành công."
                    + "<p>Để bắt đầu sử dụng dịch vụ của chúng tôi, Xin vui lòng click đường link dưới đây để kích hoạt tài khoản</p>"
                    + "<a href='"+url_active+ "'>Hãy click vào đây</a>"
                    + "<p>Trân trọng,</p>"
                    + "<p>Gym Master</p>" +
                    "</body></html>";

            // Thiết lập nội dung của email với đoạn mã HTML
            message.setContent(htmlContent, "text/html; charset=utf-8");
            Transport.send(message);
            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
