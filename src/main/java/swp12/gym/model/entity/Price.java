package swp12.gym.model.entity;

public class Price {
    private int pri_id;
    private int pri_sale;
    private int pri_oprice;
    private String pri_start_date;
    private String pri_end_date;
    private Boolean pri_status;
    private int product_id;

    public Price() {
    }

    public Price(int pri_id, int pri_sale, int pri_oprice, String pri_start_date, String pri_end_date, Boolean pri_status, int product_id) {
        this.pri_id = pri_id;
        this.pri_sale = pri_sale;
        this.pri_oprice = pri_oprice;
        this.pri_start_date = pri_start_date;
        this.pri_end_date = pri_end_date;
        this.pri_status = pri_status;
        this.product_id = product_id;
    }

    public int getPri_id() {
        return pri_id;
    }

    public void setPri_id(int pri_id) {
        this.pri_id = pri_id;
    }

    public int getPri_sale() {
        return pri_sale;
    }

    public void setPri_sale(int pri_sale) {
        this.pri_sale = pri_sale;
    }

    public int getPri_oprice() {
        return pri_oprice;
    }

    public void setPri_oprice(int pri_oprice) {
        this.pri_oprice = pri_oprice;
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

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    @Override
    public String toString() {
        return "Price{" +
                "pri_id=" + pri_id +
                ", pri_sale=" + pri_sale +
                ", pri_oprice=" + pri_oprice +
                ", pri_start_date='" + pri_start_date + '\'' +
                ", pri_end_date='" + pri_end_date + '\'' +
                ", pri_status=" + pri_status +
                ", product_id=" + product_id +
                '}';
    }
}
