package swp12.gym.model.entity;

import java.time.LocalDateTime;
import java.util.Date;

public class TicketUser {
    private long t_u_ID;
    private String name;
    private LocalDateTime create_date;
    private LocalDateTime start_date;
    private LocalDateTime end_date;
    private int payment_Status;
    private float value_Cost;
    private LocalDateTime date_Payment;
    private long id_u;
    private long id_t;

    public TicketUser() {
    }

    public TicketUser(long t_u_ID, String name, LocalDateTime create_date, LocalDateTime start_date, LocalDateTime end_date, int payment_Status, float value_Cost, LocalDateTime date_Payment, long id_u, long id_t) {
        this.t_u_ID = t_u_ID;
        this.name = name;
        this.create_date = create_date;
        this.start_date = start_date;
        this.end_date = end_date;
        this.payment_Status = payment_Status;
        this.value_Cost = value_Cost;
        this.date_Payment = date_Payment;
        this.id_u = id_u;
        this.id_t = id_t;
    }

    public long getT_u_ID() {
        return t_u_ID;
    }

    public void setT_u_ID(long t_u_ID) {
        this.t_u_ID = t_u_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getCreate_date() {
        return create_date;
    }

    public void setCreate_date(LocalDateTime create_date) {
        this.create_date = create_date;
    }

    public LocalDateTime getStart_date() {
        return start_date;
    }

    public void setStart_date(LocalDateTime start_date) {
        this.start_date = start_date;
    }

    public LocalDateTime getEnd_date() {
        return end_date;
    }

    public void setEnd_date(LocalDateTime end_date) {
        this.end_date = end_date;
    }

    public int getPayment_Status() {
        return payment_Status;
    }

    public void setPayment_Status(int payment_Status) {
        this.payment_Status = payment_Status;
    }

    public float getValue_Cost() {
        return value_Cost;
    }

    public void setValue_Cost(float value_Cost) {
        this.value_Cost = value_Cost;
    }

    public LocalDateTime getDate_Payment() {
        return date_Payment;
    }

    public void setDate_Payment(LocalDateTime date_Payment) {
        this.date_Payment = date_Payment;
    }

    public long getId_u() {
        return id_u;
    }

    public void setId_u(long id_u) {
        this.id_u = id_u;
    }

    public long getId_t() {
        return id_t;
    }

    public void setId_t(long id_t) {
        this.id_t = id_t;
    }

    @Override
    public String toString() {
        return "TicketUser{" +
                "t_u_ID=" + t_u_ID +
                ", name='" + name + '\'' +
                ", create_date=" + create_date +
                ", start_date=" + start_date +
                ", end_date=" + end_date +
                ", payment_Status=" + payment_Status +
                ", value_Cost=" + value_Cost +
                ", date_Payment=" + date_Payment +
                ", id_u=" + id_u +
                ", id_t=" + id_t +
                '}';
    }
}
