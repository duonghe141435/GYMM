package swp12.gym.model.entity;

import java.util.Date;

public class Product {
    private int p_id;
    private String p_name;
    private String p_title;
    private String p_create_date;
    private String p_img;
    private int p_unit_id;
    private int p_quantity;
    private float p_price;
    private float p_price_original;
    private boolean p_status;

    public Product() {
    }

    public Product(int p_id, String p_name, String title, String p_create_date, String p_img, int p_unit_id,
                   int p_quantity, float p_price, float p_price_original, boolean p_status) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.p_title = title;
        this.p_create_date = p_create_date;
        this.p_img = p_img;
        this.p_unit_id = p_unit_id;
        this.p_quantity = p_quantity;
        this.p_price = p_price;
        this.p_price_original = p_price_original;
        this.p_status = p_status;
    }

    public Product(int p_id, String nuoc_tang_luc_sting, String sting, String s, String demo_img, int p_unit_id, int p_quantity, int p_price, int p_price_original, boolean p_status) {
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_title() {
        return p_title;
    }

    public void setP_title(String title) {
        this.p_title = title;
    }

    public String getP_create_date() {
        return p_create_date;
    }

    public void setP_create_date(String p_create_date) {
        this.p_create_date = p_create_date;
    }

    public String getP_img() {
        return p_img;
    }

    public void setP_img(String p_img) {
        this.p_img = p_img;
    }

    public int getP_unit_id() {
        return p_unit_id;
    }

    public void setP_unit_id(int p_unit_id) {
        this.p_unit_id = p_unit_id;
    }

    public int getP_quantity() {
        return p_quantity;
    }

    public void setP_quantity(int p_quantity) { this.p_quantity = p_quantity; }

    public float getP_price() {
        return p_price;
    }

    public void setP_price(float p_price) {
        this.p_price = p_price;
    }

    public float getP_price_original() {
        return p_price_original;
    }

    public void setP_price_original(float p_price_original) {
        this.p_price_original = p_price_original;
    }

    public boolean isP_status() {
        return p_status;
    }

    public void setP_status(boolean p_status) {
        this.p_status = p_status;
    }
}
