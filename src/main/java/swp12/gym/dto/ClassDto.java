package swp12.gym.dto;

import java.util.Date;

public class ClassDto {
    private int class_id;
    private String c_name;
    private String c_create_date;
    private int c_time_id;
    private int c_status;
    private String c_start_date;
    private String c_end_date;
    private int max_member;
    private int c_price;
    private int c_trainer_id;
    private String c_trainer_name;
    private int c_ticket_id;
    private String start_time;
    private String end_time;
    private int total_attendees; //số người đã tham gia vào class

    private int weekdays_id;
    private int sunday;
    private int monday;
    private int tuesday;
    private int wednesday;
    private int thursday;
    private int friday;
    private int saturday;

    public ClassDto() {
    }

    public ClassDto(int class_id, String c_name, String c_create_date, int c_time_id, int c_status, String c_start_date, String c_end_date, int max_member, int c_price, int c_trainer_id, String c_trainer_name, int c_ticket_id, String start_time, String end_time, int total_attendees, int weekdays_id, int sunday, int monday, int tuesday, int wednesday, int thursday, int friday, int saturday) {
        this.class_id = class_id;
        this.c_name = c_name;
        this.c_create_date = c_create_date;
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
        this.weekdays_id = weekdays_id;
        this.sunday = sunday;
        this.monday = monday;
        this.tuesday = tuesday;
        this.wednesday = wednesday;
        this.thursday = thursday;
        this.friday = friday;
        this.saturday = saturday;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getC_create_date() {
        return c_create_date;
    }

    public void setC_create_date(String c_create_date) {
        this.c_create_date = c_create_date;
    }

    public int getC_time_id() {
        return c_time_id;
    }

    public void setC_time_id(int c_time_id) {
        this.c_time_id = c_time_id;
    }

    public int getC_status() {
        return c_status;
    }

    public void setC_status(int c_status) {
        this.c_status = c_status;
    }

    public String getC_start_date() {
        return c_start_date;
    }

    public void setC_start_date(String c_start_date) {
        this.c_start_date = c_start_date;
    }

    public String getC_end_date() {
        return c_end_date;
    }

    public void setC_end_date(String c_end_date) {
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

    public int getC_trainer_id() {
        return c_trainer_id;
    }

    public void setC_trainer_id(int c_trainer_id) {
        this.c_trainer_id = c_trainer_id;
    }

    public String getC_trainer_name() {
        return c_trainer_name;
    }

    public void setC_trainer_name(String c_trainer_name) {
        this.c_trainer_name = c_trainer_name;
    }

    public int getC_ticket_id() {
        return c_ticket_id;
    }

    public void setC_ticket_id(int c_ticket_id) {
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

    public int getWeekdays_id() {
        return weekdays_id;
    }

    public void setWeekdays_id(int weekdays_id) {
        this.weekdays_id = weekdays_id;
    }

    public int getSunday() {
        return sunday;
    }

    public void setSunday(int sunday) {
        this.sunday = sunday;
    }

    public int getMonday() {
        return monday;
    }

    public void setMonday(int monday) {
        this.monday = monday;
    }

    public int getTuesday() {
        return tuesday;
    }

    public void setTuesday(int tuesday) {
        this.tuesday = tuesday;
    }

    public int getWednesday() {
        return wednesday;
    }

    public void setWednesday(int wednesday) {
        this.wednesday = wednesday;
    }

    public int getThursday() {
        return thursday;
    }

    public void setThursday(int thursday) {
        this.thursday = thursday;
    }

    public int getFriday() {
        return friday;
    }

    public void setFriday(int friday) {
        this.friday = friday;
    }

    public int getSaturday() {
        return saturday;
    }

    public void setSaturday(int saturday) {
        this.saturday = saturday;
    }

    @Override
    public String toString() {
        return "ClassDto{" +
                "class_id=" + class_id +
                ", c_name='" + c_name + '\'' +
                ", c_create_date='" + c_create_date + '\'' +
                ", c_time_id=" + c_time_id +
                ", c_status=" + c_status +
                ", c_start_date='" + c_start_date + '\'' +
                ", c_end_date='" + c_end_date + '\'' +
                ", max_member=" + max_member +
                ", c_price=" + c_price +
                ", c_trainer_id=" + c_trainer_id +
                ", c_trainer_name='" + c_trainer_name + '\'' +
                ", c_ticket_id=" + c_ticket_id +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                ", total_attendees=" + total_attendees +
                ", weekdays_id=" + weekdays_id +
                ", sunday=" + sunday +
                ", monday=" + monday +
                ", tuesday=" + tuesday +
                ", wednesday=" + wednesday +
                ", thursday=" + thursday +
                ", friday=" + friday +
                ", saturday=" + saturday +
                '}';
    }
}
