package swp12.gym.model.entity;

public class ClassTrainer {
    private int class_id;
    private String class_name;
    private int time_id;
    private int class_state; //Trạng thái của lớp có mở hay không
    private String start_date;
    private String end_date;
    private int trainer_id;
    private int ticket_id;
    private int max_member;
    private int class_price;

    public ClassTrainer() {
    }

    public ClassTrainer(int class_id, String class_name, int time_id, int class_state, String start_date,
                        String end_date, int trainer_id, int ticket_id, int max_member, int class_price) {
        this.class_id = class_id;
        this.class_name = class_name;
        this.time_id = time_id;
        this.class_state = class_state;
        this.start_date = start_date;
        this.end_date = end_date;
        this.trainer_id = trainer_id;
        this.ticket_id = ticket_id;
        this.max_member = max_member;
        this.class_price = class_price;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public int getTime_id() {
        return time_id;
    }

    public void setTime_id(int time_id) {
        this.time_id = time_id;
    }

    public int getClass_state() {
        return class_state;
    }

    public void setClass_state(int class_state) {
        this.class_state = class_state;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public int getTrainer_id() {
        return trainer_id;
    }

    public void setTrainer_id(int trainer_id) {
        this.trainer_id = trainer_id;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public int getMax_member() {
        return max_member;
    }

    public void setMax_member(int max_member) {
        this.max_member = max_member;
    }

    public int getClass_price() {
        return class_price;
    }

    public void setClass_price(int class_price) {
        this.class_price = class_price;
    }
}
