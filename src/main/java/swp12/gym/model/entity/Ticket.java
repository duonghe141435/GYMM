package swp12.gym.model.entity;

public class Ticket {
    private int t_id;
    private String t_name;
    private int tt_id;
    private float t_price;
    private int t_status;
    private int t_total_days; // the day ticket is active
    private String create_date;

    public Ticket() {
    }

    public Ticket(int t_id, String t_name, int tt_id, float t_price, String t_note,
                  int t_status, int t_total_days, String create_day) {
        this.t_id = t_id;
        this.t_name = t_name;
        this.tt_id = tt_id;
        this.t_price = t_price;
        this.t_status = t_status;
        this.t_total_days = t_total_days;
        this.create_date = create_day;
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

    @Override
    public String toString() {
        return "Ticket{" +
                "t_id=" + t_id +
                ", t_name='" + t_name + '\'' +
                ", tt_id=" + tt_id +
                ", t_price=" + t_price +
                ", t_status=" + t_status +
                ", t_total_days=" + t_total_days +
                ", create_date=" + create_date +
                '}';
    }
}
