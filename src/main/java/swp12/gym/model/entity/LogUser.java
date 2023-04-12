package swp12.gym.model.entity;

public class LogUser{

    private int id_log;
    private int type_log;
    private String date_time_create;
    private String content;
    private int u_id;

    public LogUser() {
    }

    public LogUser(int id_log, int type_log, String date_time_create, String content, int u_id) {
        this.id_log = id_log;
        this.type_log = type_log;
        this.date_time_create = date_time_create;
        this.content = content;
        this.u_id = u_id;
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

    public String getDate_time_create() {
        return date_time_create;
    }

    public void setDate_time_create(String date_time_create) {
        this.date_time_create = date_time_create;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }
}
