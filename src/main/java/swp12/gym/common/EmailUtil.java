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


    public boolean sentMailRestPassWord(String email_to, String name, String new_pass){
        boolean flag = false;
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.host", "smtp.gmail.com");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username,password);
            }
        });

        try{
            Message message = new MimeMessage(session);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(email_to));
            message.setFrom(new InternetAddress(email_form));

            message.setSubject("Mật khẩu của bạn đã được thay đổi");
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

}
