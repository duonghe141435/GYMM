package swp12.gym.model.entity;

import java.util.Date;

public class Unit {
    private long un_id;
    private String un_name;
    private Date un_create_date;
    private boolean un_status;

    public Unit() {
    }

    public Unit(long un_id, String un_name, Date un_create_date, boolean un_status) {
        this.un_id = un_id;
        this.un_name = un_name;
        this.un_create_date = un_create_date;
        this.un_status = un_status;
    }

    public Unit(int un_id, String cân, String s, boolean un_status) {
    }

    public long getUn_id() {
        return un_id;
    }

    public void setUn_id(long un_id) {
        this.un_id = un_id;
    }

    public String getUn_name() {
        return un_name;
    }

    public void setUn_name(String un_name) {
        this.un_name = un_name;
    }

    public Date getUn_create_date() {
        return un_create_date;
    }

    public void setUn_create_date(Date un_create_date) {
        this.un_create_date = un_create_date;
    }

    public boolean isUn_status() {
        return un_status;
    }

    public void setUn_status(boolean un_status) {
        this.un_status = un_status;
    }
}
