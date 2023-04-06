package swp12.gym.dto;

public class TicketClassDto {
    private int t_id;
    private String t_name;
    private int t_status;
    private int t_total_days; // the day ticket is active
    private String create_date;
    private int t_price_min;
    private int t_price_max;
    private int min_member;
    private int max_member;

    public TicketClassDto() {
    }

    public TicketClassDto(int t_id, String t_name, int t_status, int t_total_days, String create_date, int t_price_min,
                          int t_price_max, int min_member, int max_member) {
        this.t_id = t_id;
        this.t_name = t_name;
        this.t_status = t_status;
        this.t_total_days = t_total_days;
        this.create_date = create_date;
        this.t_price_min = t_price_min;
        this.t_price_max = t_price_max;
        this.min_member = min_member;
        this.max_member = max_member;
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

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public int getT_price_min() {
        return t_price_min;
    }

    public void setT_price_min(int t_price_min) {
        this.t_price_min = t_price_min;
    }

    public int getT_price_max() {
        return t_price_max;
    }

    public void setT_price_max(int t_price_max) {
        this.t_price_max = t_price_max;
    }

    public int getMax_member() {
        return max_member;
    }

    public void setMax_member(int max_member) {
        this.max_member = max_member;
    }

    public int getMin_member() {
        return min_member;
    }

    public void setMin_member(int min_member) {
        this.min_member = min_member;
    }
}
