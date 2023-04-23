package swp12.gym.model.entity;

public class Order {

    private int order_id;
    private String code;
    private String order_date;
    private int status;
    private float total_amount;
    private int discount;
    private float total_payment;
    private float customer_paying;
    private float change;
    private int staff_id;
    private int customer_id;

    public Order() {
    }

    public Order(int order_id, String code, String order_date, int status, float total_amount, int discount, float total_payment, float customer_paying, float change, int staff_id, int customer_id) {
        this.order_id = order_id;
        this.code = code;
        this.order_date = order_date;
        this.status = status;
        this.total_amount = total_amount;
        this.discount = discount;
        this.total_payment = total_payment;
        this.customer_paying = customer_paying;
        this.change = change;
        this.staff_id = staff_id;
        this.customer_id = customer_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(float total_amount) {
        this.total_amount = total_amount;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public float getTotal_payment() {
        return total_payment;
    }

    public void setTotal_payment(float total_payment) {
        this.total_payment = total_payment;
    }

    public float getCustomer_paying() {
        return customer_paying;
    }

    public void setCustomer_paying(float customer_paying) {
        this.customer_paying = customer_paying;
    }

    public float getChange() {
        return change;
    }

    public void setChange(float change) {
        this.change = change;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", code='" + code + '\'' +
                ", order_date='" + order_date + '\'' +
                ", status=" + status +
                ", total_amount=" + total_amount +
                ", discount=" + discount +
                ", total_payment=" + total_payment +
                ", customer_paying=" + customer_paying +
                ", change=" + change +
                ", staff_id=" + staff_id +
                ", customer_id=" + customer_id +
                '}';
    }
}
