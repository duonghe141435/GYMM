package swp12.gym.model.entity;

import java.util.Date;

public class Notification {
    private int noti_id;
    private String noti_content;
    private Date create_time;
    private boolean status;

    public Notification() {
    }

    public Notification(int noti_id, String noti_content, Date create_time, boolean status) {
        this.noti_id = noti_id;
        this.noti_content = noti_content;
        this.create_time = create_time;
        this.status = status;
    }

    public int getNoti_id() {
        return noti_id;
    }

    public void setNoti_id(int noti_id) {
        this.noti_id = noti_id;
    }

    public String getNoti_content() {
        return noti_content;
    }

    public void setNoti_content(String noti_content) {
        this.noti_content = noti_content;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
