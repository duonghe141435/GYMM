package swp12.gym.model.entity;

public class CheckIn {
    private int checkIn_id;
    private String current_time;
    private int status;
    private int user_id;

    public CheckIn() {
    }

    public CheckIn(int checkIn_id, String date, int status, int user_id) {
        this.checkIn_id = checkIn_id;
        this.current_time = date;
        this.status = status;
        this.user_id = user_id;
    }

    public int getCheckIn_id() {
        return checkIn_id;
    }

    public void setCheckIn_id(int checkIn_id) {
        this.checkIn_id = checkIn_id;
    }

    public String getCurrent_time() {
        return current_time;
    }

    public void setCurrent_time(String date) {
        this.current_time = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "CheckIn{" +
                "checkIn_id=" + checkIn_id +
                ", date='" + current_time + '\'' +
                ", status=" + status +
                ", user_id=" + user_id +
                '}';
    }
}
