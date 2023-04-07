package swp12.gym.dto;

public class TicketDto {

//    SELECT t.id_t as ticket_id, t.tt_id as ticket_type, t.name as ticket_name, t.total_days as ticket_day,
//    IFNULL(MAX(class.max_menber),1) as max_menber, IFNULL(MIN(class.max_menber),1) as min_menber, t.status as ticket_status,
//    IFNULL(t.price,0) as ticket_price, IFNULL(MAX(class.price),0) as class_price_max,
//    IFNULL(MIN(class.price),0) as class_price_min,IFNULL(MAX(t2.price),0) as trainer_price_max,
//    IFNULL(MIN(t2.price),0) as trainer_price_min, t.create_date as ticket_create
//    FROM ticket t left join class on t.id_t = class.ticket_id left join personal_trainer t2 on t.id_t = t2.ticket_id
//    GROUP BY t.id_t, t.create_date, t.tt_id, t.name,t.total_days

    private int t_id;
    private int tt_id;
    private String t_name;
    private int t_total_days; // the day ticket is active
    private String min_member;
    private String max_member;
    private int t_price;
    private int class_price_min;
    private int class_price_max;
    private int trainer_price_min;
    private int trainer_price_max;
    private int t_status;
    private String create_date;

    public TicketDto() {
    }

    public TicketDto(int t_id, int tt_id, String t_name, int t_total_days, String min_member, String max_member,
                  int t_price, int class_price_min, int class_price_max, int traienr_price_min, int trainer_price_max,
                  int t_status, String create_date) {
        this.t_id = t_id;
        this.tt_id = tt_id;
        this.t_name = t_name;
        this.t_total_days = t_total_days;
        this.min_member = min_member;
        this.max_member = max_member;
        this.t_price = t_price;
        this.class_price_min = class_price_min;
        this.class_price_max = class_price_max;
        this.trainer_price_min = traienr_price_min;
        this.trainer_price_max = trainer_price_max;
        this.t_status = t_status;
        this.create_date = create_date;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public int getTt_id() {
        return tt_id;
    }

    public void setTt_id(int tt_id) {
        this.tt_id = tt_id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public int getT_total_days() {
        return t_total_days;
    }

    public void setT_total_days(int t_total_days) {
        this.t_total_days = t_total_days;
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

    public int getT_price() {
        return t_price;
    }

    public void setT_price(int t_price) {
        this.t_price = t_price;
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

    public void setTrainer_price_min(int traienr_price_min) {
        this.trainer_price_min = traienr_price_min;
    }

    public int getTrainer_price_max() {
        return trainer_price_max;
    }

    public void setTrainer_price_max(int trainer_price_max) {
        this.trainer_price_max = trainer_price_max;
    }

    public int getT_status() {
        return t_status;
    }

    public void setT_status(int t_status) {
        this.t_status = t_status;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }
}

