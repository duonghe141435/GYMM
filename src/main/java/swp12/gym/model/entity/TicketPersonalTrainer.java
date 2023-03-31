package swp12.gym.model.entity;

public class TicketPersonalTrainer {
    private int personal_trainer_id;
    private String start_date;
    private String end_date;
    private int ticket_id;
    private int trainer_id;
    private int status;
    private int price;

    public TicketPersonalTrainer() {
    }

    public TicketPersonalTrainer(int personal_trainer_id, String start_date, String end_date, int ticket_id,
                                 int trainer_id, int status, int price) {
        this.personal_trainer_id = personal_trainer_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.ticket_id = ticket_id;
        this.trainer_id = trainer_id;
        this.status = status;
        this.price = price;
    }

    public int getPersonal_trainer_id() {
        return personal_trainer_id;
    }

    public void setPersonal_trainer_id(int personal_trainer_id) {
        this.personal_trainer_id = personal_trainer_id;
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

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public int getTrainer_id() {
        return trainer_id;
    }

    public void setTrainer_id(int trainer_id) {
        this.trainer_id = trainer_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "PersonalTrainer{" +
                "personal_trainer_id=" + personal_trainer_id +
                ", start_date='" + start_date + '\'' +
                ", end_date='" + end_date + '\'' +
                ", ticket_id=" + ticket_id +
                ", trainer_id=" + trainer_id +
                ", status=" + status +
                ", price=" + price +
                '}';
    }
}
