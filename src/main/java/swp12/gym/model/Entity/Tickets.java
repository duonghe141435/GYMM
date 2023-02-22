package swp12.gym.model.Entity;

public class Tickets {
    private long id;
    private String name_ticket;
    private float price;
    private String note;
    private boolean status;
    private int total_days; // the day ticket is active

    public Tickets() {
    }

    public Tickets(long id, String name_ticket, float price, String note, boolean status, int total_days) {
        this.id = id;
        this.name_ticket = name_ticket;
        this.price = price;
        this.note = note;
        this.status = status;
        this.total_days = total_days;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName_ticket() {
        return name_ticket;
    }

    public void setName_ticket(String type_ticket) {
        this.name_ticket = type_ticket;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getTotal_days() {
        return total_days;
    }

    public void setTotal_days(int total_days) {
        this.total_days = total_days;
    }
}
