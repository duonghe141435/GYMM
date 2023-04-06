package swp12.gym.dto;

public class TicketDto {
    private int t_id;
    private String t_name;
    private int tt_id;
    private String tt_name;
    private float t_price;
    private String t_note;
    private boolean t_status;
    private int t_total_days; // the day ticket is active
    private String create_date;

    public TicketDto() {
    }

    public TicketDto(int t_id, String t_name, int tt_id, String tt_name, float t_price, String t_note, boolean t_status, int t_total_days, String create_date) {
        this.t_id = t_id;
        this.t_name = t_name;
        this.tt_id = tt_id;
        this.tt_name = tt_name;
        this.t_price = t_price;
        this.t_note = t_note;
        this.t_status = t_status;
        this.t_total_days = t_total_days;
        this.create_date = create_date;
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

    public String getTt_name() {
        return tt_name;
    }

    public void setTt_name(String tt_name) {
        this.tt_name = tt_name;
    }

    public float getT_price() {
        return t_price;
    }

    public void setT_price(float t_price) {
        this.t_price = t_price;
    }

    public String getT_note() {
        return t_note;
    }

    public void setT_note(String t_note) {
        this.t_note = t_note;
    }

    public boolean isT_status() {
        return t_status;
    }

    public void setT_status(boolean t_status) {
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
}
