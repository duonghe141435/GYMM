package swp12.gym.model.entity;

import java.util.Date;

public class TicketType {
    private int tt_id;
    private String name;
    private Date create_date;
    private int status;

    public TicketType() {
    }

    public TicketType(int tt_id, String name, Date create_date, int status) {
        this.tt_id = tt_id;
        this.name = name;
        this.create_date = create_date;
        this.status = status;
    }

    public int getTt_id() {
        return tt_id;
    }

    public void setTt_id(int tt_id) {
        this.tt_id = tt_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
