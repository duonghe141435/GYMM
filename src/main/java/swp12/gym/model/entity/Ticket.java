package swp12.gym.model.entity;

import java.sql.Date;

public class Ticket {

    private int t_id;
    private String t_name;
    private int tt_id;
    private float t_price;
    private int t_status;
    private int t_total_days; // the day ticket is active
    private String  create_date;
    private String min_member;
    private String max_member;
    private int class_price_min;
    private int class_price_max;
    private int trainer_price_min;
    private int trainer_price_max;

    public Ticket() {
    }

    public Ticket(int t_id, String t_name, int tt_id, float t_price, int t_status, int t_total_days, String create_date, String min_member, String max_member, int class_price_min, int class_price_max, int trainer_price_min, int trainer_price_max) {
        this.t_id = t_id;
        this.t_name = t_name;
        this.tt_id = tt_id;
        this.t_price = t_price;
        this.t_status = t_status;
        this.t_total_days = t_total_days;
        this.create_date = create_date;
        this.min_member = min_member;
        this.max_member = max_member;
        this.class_price_min = class_price_min;
        this.class_price_max = class_price_max;
        this.trainer_price_min = trainer_price_min;
        this.trainer_price_max = trainer_price_max;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public int getTt_id() {
        return tt_id;
    }

    public void setTt_id(int tt_id) {
        this.tt_id = tt_id;
    }

    public float getT_price() {
        return t_price;
    }

    public void setT_price(float t_price) {
        this.t_price = t_price;
    }

    public int getT_status() {
        return t_status;
    }

    public void setT_status(int t_status) {
        this.t_status = t_status;
    }

    public int getT_total_days() {
        return t_total_days;
    }

    public void setT_total_days(int t_total_days) {
        this.t_total_days = t_total_days;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_day) {
        this.create_date = create_day;
    }

    public String getMin_member() {
        return min_member;
    }

    public void setMin_member(String min_member) {
        this.min_member = min_member;
    }

    public String getMax_member() {
        return max_member;
    }

    public void setMax_member(String max_member) {
        this.max_member = max_member;
    }

    public int getClass_price_min() {
        return class_price_min;
    }

    public void setClass_price_min(int class_price_min) {
        this.class_price_min = class_price_min;
    }

    public int getClass_price_max() {
        return class_price_max;
    }

    public void setClass_price_max(int class_price_max) {
        this.class_price_max = class_price_max;
    }

    public int getTrainer_price_min() {
        return trainer_price_min;
    }

    public void setTrainer_price_min(int trainer_price_min) {
        this.trainer_price_min = trainer_price_min;
    }

    public int getTrainer_price_max() {
        return trainer_price_max;
    }

    public void setTrainer_price_max(int trainer_price_max) {
        this.trainer_price_max = trainer_price_max;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "t_id=" + t_id +
                ", t_name='" + t_name + '\'' +
                ", tt_id=" + tt_id +
                ", t_price=" + t_price +
                ", t_status=" + t_status +
                ", t_total_days=" + t_total_days +
                ", create_date='" + create_date + '\'' +
                ", min_member='" + min_member + '\'' +
                ", max_member='" + max_member + '\'' +
                ", class_price_min=" + class_price_min +
                ", class_price_max=" + class_price_max +
                ", trainer_price_min=" + trainer_price_min +
                ", trainer_price_max=" + trainer_price_max +
                '}';
    }
}
