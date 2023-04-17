package swp12.gym.dto;

public class LogUserDto {
    private int id_log;
    private String user_email;
    private int type_log;
    private int date_time_create;
    private String content;

    public LogUserDto() {
    }

    public LogUserDto(int id_log, String user_email, int type_log, int date_time_create, String content) {
        this.id_log = id_log;
        this.user_email = user_email;
        this.type_log = type_log;
        this.date_time_create = date_time_create;
        this.content = content;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public int getId_log() {
        return id_log;
    }

    public void setId_log(int id_log) {
        this.id_log = id_log;
    }

    public int getType_log() {
        return type_log;
    }

    public void setType_log(int type_log) {
        this.type_log = type_log;
    }

    public int getDate_time_create() {
        return date_time_create;
    }

    public void setDate_time_create(int date_time_create) {
        this.date_time_create = date_time_create;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
