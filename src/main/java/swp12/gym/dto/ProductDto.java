package swp12.gym.dto;

public class ProductDto {

    private int p_id;
    private String p_name;
    private String p_img;
    private int p_price_id;
    private float p_price;
    private float p_Oprice;
    private String p_create;
    private int p_quantity;
    private int p_unit;
    private String p_unit_name;
    private String p_description;
    private Boolean p_status;
    private int p_kind;
    private String p_kind_name;

    public ProductDto() { }

    public ProductDto(int p_id, String p_name, String p_img, int p_price_id, float p_price, float p_Oprice,
                      String p_create, int p_quantity, int p_unit, String p_unit_name, String p_description,
                      Boolean p_status, int p_kind, String p_kind_name) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.p_img = p_img;
        this.p_price_id = p_price_id;
        this.p_price = p_price;
        this.p_Oprice = p_Oprice;
        this.p_create = p_create;
        this.p_quantity = p_quantity;
        this.p_unit = p_unit;
        this.p_unit_name = p_unit_name;
        this.p_description = p_description;
        this.p_status = p_status;
        this.p_kind = p_kind;
        this.p_kind_name = p_kind_name;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public float getP_price() {
        return p_price;
    }

    public void setP_price(float p_price) {
        this.p_price = p_price;
    }

    public float getP_Oprice() {
        return p_Oprice;
    }

    public void setP_Oprice(float p_Oprice) {
        this.p_Oprice = p_Oprice;
    }

    public String getP_create() {
        return p_create;
    }

    public void setP_create(String p_create) {
        this.p_create = p_create;
    }

    public int getP_quantity() {
        return p_quantity;
    }

    public void setP_quantity(int p_quanity) {
        this.p_quantity = p_quanity;
    }

    public int getP_unit() {
        return p_unit;
    }

    public void setP_unit(int p_unit) {
        this.p_unit = p_unit;
    }

    public String getP_unit_name() {
        return p_unit_name;
    }

    public void setP_unit_name(String p_unit_name) {
        this.p_unit_name = p_unit_name;
    }

    public String getP_description() {
        return p_description;
    }

    public void setP_description(String p_description) {
        this.p_description = p_description;
    }

    public Boolean getP_status() {
        return p_status;
    }

    public void setP_status(Boolean p_status) {
        this.p_status = p_status;
    }

    public int getP_kind() {
        return p_kind;
    }

    public void setP_kind(int p_kind) {
        this.p_kind = p_kind;
    }

    public String getP_kind_name() {
        return p_kind_name;
    }

    public void setP_kind_name(String p_kind_name) {
        this.p_kind_name = p_kind_name;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_img() {
        return p_img;
    }

    public void setP_img(String p_img) {
        this.p_img = p_img;
    }

    public int getP_price_id() {
        return p_price_id;
    }

    public void setP_price_id(int p_price_id) {
        this.p_price_id = p_price_id;
    }

    @Override
    public String toString() {
        return "ProductDto{" +
                "p_id=" + p_id +
                ", p_name='" + p_name + '\'' +
                ", p_img='" + p_img + '\'' +
                ", p_price_id=" + p_price_id +
                ", p_price=" + p_price +
                ", p_Oprice=" + p_Oprice +
                ", p_create='" + p_create + '\'' +
                ", p_quantity=" + p_quantity +
                ", p_unit=" + p_unit +
                ", p_unit_name='" + p_unit_name + '\'' +
                ", p_description='" + p_description + '\'' +
                ", p_status=" + p_status +
                ", p_kind=" + p_kind +
                ", p_kind_name='" + p_kind_name + '\'' +
                '}';
    }
}
