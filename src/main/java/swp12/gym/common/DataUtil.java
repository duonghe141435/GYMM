package swp12.gym.common;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.TimeZone;

@Component
public class DataUtil {
    public static final String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static final String lower = upper.toLowerCase(Locale.ROOT);

    public static final String digits = "0123456789";

    public static final String alphanum = upper + lower + digits;

    private final Date now = new Date();

    private final int min_length_password = 6;

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

    SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");

    public String convertLocalDateTimeToString(LocalDateTime localDateTime){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String formattedDateTime = localDateTime.format(formatter);
        return formattedDateTime;
    }

    public LocalDateTime convertStringToLocalDateTime(String date){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime dateTime = LocalDateTime.parse(date, formatter);
        return dateTime;
    }

    public int getIntToDate(){
        long timestampInSeconds = now.getTime() / 1000;
        return (int) timestampInSeconds;
    }

    public String getDateMilisNowToString(){
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return dateFormat.format(now);
    }

    public String getDateNowToString(){
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return dateFormat2.format(now);
    }

    public Date convertStringDateToDate(String dateString) {
        Date date = null;
        try {
            date = dateFormat2.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public String generatePassword () {
      String password = "Gm12ha";
        try {
            password = RandomStringUtils.randomAlphanumeric(min_length_password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return password;
    }
}
