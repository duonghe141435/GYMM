package swp12.gym.common;

import jakarta.mail.Session;

import java.util.Properties;

public class EmailUtil {

    private final String email_form = "luonghoang1401@gmail.com";
    private final boolean auth = true;
    private final boolean start_enable = true;
    private final String port = "587";
    private final String host = "smtp.gmail.com";

    public void sentMail(String email_to, String subject, String content){
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", auth);
        properties.put("mail.smtp.starttls.enable", start_enable);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.host", host);

        Session.getInstance(properties);

    }

}
