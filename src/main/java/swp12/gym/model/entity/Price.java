package swp12.gym.model.entity;

public class Price {
    private int pri_id;
    private int pri_value;
    private int pri_value_original;
    private String pri_start_date;
    private String pri_end_date;
    private Boolean pri_status;

    public Price() {
    }

    public Price(int pri_id, int pri_value, int pri_value_original, String pri_start_date, String pri_end_date, Boolean pri_status) {
        this.pri_id = pri_id;
        this.pri_value = pri_value;
        this.pri_value_original = pri_value_original;
        this.pri_start_date = pri_start_date;
        this.pri_end_date = pri_end_date;
        this.pri_status = pri_status;
    }

    public int getPri_id() {
        return pri_id;
    }

    public void setPri_id(int pri_id) {
        this.pri_id = pri_id;
    }

    public int getPri_value() {
        return pri_value;
    }

    public void setPri_value(int pri_value) {
        this.pri_value = pri_value;
    }

    public int getPri_value_original() {
        return pri_value_original;
    }

    public void setPri_value_original(int pri_value_original) {
        this.pri_value_original = pri_value_original;
    }

    public String getPri_start_date() {
        return pri_start_date;
    }

    public void setPri_start_date(String pri_start_date) {
        this.pri_start_date = pri_start_date;
    }

    public String getPri_end_date() {
        return pri_end_date;
    }

    public void setPri_end_date(String pri_end_date) {
        this.pri_end_date = pri_end_date;
    }

    public Boolean getPri_status() {
        return pri_status;
    }

    public void setPri_status(Boolean pri_status) {
        this.pri_status = pri_status;
    }
}
