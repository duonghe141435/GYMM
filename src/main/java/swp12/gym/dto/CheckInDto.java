package swp12.gym.dto;

public class CheckInDto {
    private String u_img;
    private String u_email;
    private String u_full_name;
    private int u_gender;
    private String current_time;
    private int status;

    public CheckInDto() {
    }

    public CheckInDto(String u_img, String u_email, String u_full_name, int u_gender, String current_time, int status) {
        this.u_img = u_img;
        this.u_email = u_email;
        this.u_full_name = u_full_name;
        this.u_gender = u_gender;
        this.current_time = current_time;
        this.status = status;
    }

    public String getU_img() {
        return u_img;
    }

    public void setU_img(String u_img) {
        this.u_img = u_img;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public String getU_full_name() {
        return u_full_name;
    }

    public void setU_full_name(String u_full_name) {
        this.u_full_name = u_full_name;
    }

    public int getU_gender() {
        return u_gender;
    }

    public void setU_gender(int u_gender) {
        this.u_gender = u_gender;
    }

    public String getCurrent_time() {
        return current_time;
    }

    public void setCurrent_time(String current_time) {
        this.current_time = current_time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CheckInDto{" +
                "u_img='" + u_img + '\'' +
                ", u_email='" + u_email + '\'' +
                ", u_full_name='" + u_full_name + '\'' +
                ", u_gender=" + u_gender +
                ", current_time='" + current_time + '\'' +
                ", status=" + status +
                '}';
    }
}
