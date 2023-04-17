package swp12.gym.model.entity;

public class UserClass {
    private int user_id;
    private int class_id;
    private int status;
    private int ticket_user_id;
    private String c_class_name;

    public UserClass() {
    }

    public UserClass(int user_id, int class_id, int status, int ticket_user_id, String c_class_name) {
        this.user_id = user_id;
        this.class_id = class_id;
        this.status = status;
        this.ticket_user_id = ticket_user_id;
        this.c_class_name = c_class_name;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTicket_user_id() {
        return ticket_user_id;
    }

    public void setTicket_user_id(int ticket_user_id) {
        this.ticket_user_id = ticket_user_id;
    }

    public String getC_class_name() {
        return c_class_name;
    }

    public void setC_class_name(String c_class_name) {
        this.c_class_name = c_class_name;
    }

    @Override
    public String toString() {
        return "UserClass{" +
                "user_id=" + user_id +
                ", class_id=" + class_id +
                ", status=" + status +
                ", ticket_user_id=" + ticket_user_id +
                ", c_class_name='" + c_class_name + '\'' +
                '}';
    }
}
