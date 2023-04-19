package swp12.gym.model.entity;

public class Attendance {
    private String attendance_date;
    private int status;
    private int user_id;
    private int class_id;

    public Attendance(int user_id) {
        this.user_id = user_id;
        this.class_id = 1;
        this.status = 1;
    }

    public Attendance() {
    }

    public Attendance(String attendance_date, int status, int user_id, int class_id) {
        this.attendance_date = attendance_date;
        this.status = status;
        this.user_id = user_id;
        this.class_id = class_id;
    }

    public String getAttendance_date() {
        return attendance_date;
    }

    public void setAttendance_date(String attendance_date) {
        this.attendance_date = attendance_date;
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

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    @Override
    public String toString() {
        return "AttendanceDao{" +
                "attendance_date='" + attendance_date + '\'' +
                ", status=" + status +
                ", user_id=" + user_id +
                ", class_id=" + class_id +
                '}';
    }
}
