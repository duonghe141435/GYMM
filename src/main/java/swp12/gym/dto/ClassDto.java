package swp12.gym.dto;

import java.util.Date;

public class ClassDto {
    private long class_id;
    private long c_time_id;
    private int c_status;
    private Date c_start_date;
    private Date c_end_date;
    private int max_member;
    private int c_price;
    private long c_trainer_id;
    private String c_trainer_name;
    private long c_ticket_id;
    private String start_time;
    private String end_time;
    private int total_attendees; //số người đã tham gia vào class

    public ClassDto() {
    }

    public ClassDto(long class_id, long c_time_id, int c_status, Date c_start_date, Date c_end_date, int max_member, int c_price, long c_trainer_id, String c_trainer_name, long c_ticket_id, String start_time, String end_time, int total_attendees) {
        this.class_id = class_id;
        this.c_time_id = c_time_id;
        this.c_status = c_status;
        this.c_start_date = c_start_date;
        this.c_end_date = c_end_date;
        this.max_member = max_member;
        this.c_price = c_price;
        this.c_trainer_id = c_trainer_id;
        this.c_trainer_name = c_trainer_name;
        this.c_ticket_id = c_ticket_id;
        this.start_time = start_time;
        this.end_time = end_time;
        this.total_attendees = total_attendees;
    }

    public long getClass_id() {
        return class_id;
    }

    public void setClass_id(long class_id) {
        this.class_id = class_id;
    }

    public long getC_time_id() {
        return c_time_id;
    }

    public void setC_time_id(long c_time_id) {
        this.c_time_id = c_time_id;
    }

    public int getC_status() {
        return c_status;
    }

    public void setC_status(int c_status) {
        this.c_status = c_status;
    }

    public Date getC_start_date() {
        return c_start_date;
    }

    public void setC_start_date(Date c_start_date) {
        this.c_start_date = c_start_date;
    }

    public Date getC_end_date() {
        return c_end_date;
    }

    public void setC_end_date(Date c_end_date) {
        this.c_end_date = c_end_date;
    }

    public int getMax_member() {
        return max_member;
    }

    public void setMax_member(int max_member) {
        this.max_member = max_member;
    }

    public int getC_price() {
        return c_price;
    }

    public void setC_price(int c_price) {
        this.c_price = c_price;
    }

    public long getC_trainer_id() {
        return c_trainer_id;
    }

    public void setC_trainer_id(long c_trainer_id) {
        this.c_trainer_id = c_trainer_id;
    }

    public String getC_trainer_name() {
        return c_trainer_name;
    }

    public void setC_trainer_name(String c_trainer_name) {
        this.c_trainer_name = c_trainer_name;
    }

    public long getC_ticket_id() {
        return c_ticket_id;
    }

    public void setC_ticket_id(long c_ticket_id) {
        this.c_ticket_id = c_ticket_id;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public int getTotal_attendees() {
        return total_attendees;
    }

    public void setTotal_attendees(int total_attendees) {
        this.total_attendees = total_attendees;
    }

    @Override
    public String toString() {
        return "ClassDto{" +
                "class_id=" + class_id +
                ", c_time_id=" + c_time_id +
                ", c_status=" + c_status +
                ", c_start_date=" + c_start_date +
                ", c_end_date=" + c_end_date +
                ", max_member=" + max_member +
                ", c_price=" + c_price +
                ", c_trainer_id=" + c_trainer_id +
                ", c_trainer_name='" + c_trainer_name + '\'' +
                ", c_ticket_id=" + c_ticket_id +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                ", total_attendees=" + total_attendees +
                '}';
    }
}
