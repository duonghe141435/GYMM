package swp12.gym.model.entity;

public class OrderDetail {
    private int quantity;
    private int price_sale;
    private int price_original;
    private int order_id;
    private int product_id;
    private int total_price;

    public OrderDetail() {
    }

    public OrderDetail(int quantity, int price_sale, int price_original, int order_id, int product_id, int total_price) {
        this.quantity = quantity;
        this.price_sale = price_sale;
        this.price_original = price_original;
        this.order_id = order_id;
        this.product_id = product_id;
        this.total_price = total_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice_sale() {
        return price_sale;
    }

    public void setPrice_sale(int price_sale) {
        this.price_sale = price_sale;
    }

    public int getPrice_original() {
        return price_original;
    }

    public void setPrice_original(int price_original) {
        this.price_original = price_original;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "quantity=" + quantity +
                ", price_sale=" + price_sale +
                ", price_original=" + price_original +
                ", order_id=" + order_id +
                ", product_id=" + product_id +
                ", total_price=" + total_price +
                '}';
    }
}
