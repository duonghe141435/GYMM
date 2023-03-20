package swp12.gym.model.entity;

public class User {
    private long u_id;
    private String u_full_name;
    private String u_email;
    private String u_password;
    private int u_age;
    private int u_gender;
    private String u_phone_number;
    private String u_address;
    private boolean u_status;
    private String u_img;
    private String u_identity_card;
    private boolean u_enable;
    private String create_date;

    public User() {
    }

    public User(long u_id, String u_full_name, String u_email, String u_password, int u_age,
                int u_gender, String u_phone_number, String u_address, boolean u_status,
                String u_img, String u_identity_card, boolean u_enable, String create_date) {
        this.u_id = u_id;
        this.u_full_name = u_full_name;
        this.u_email = u_email;
        this.u_password = u_password;
        this.u_age = u_age;
        this.u_gender = u_gender;
        this.u_phone_number = u_phone_number;
        this.u_address = u_address;
        this.u_status = u_status;
        this.u_img = u_img;
        this.u_identity_card = u_identity_card;
        this.u_enable = u_enable;
        this.create_date = create_date;
    }

    public long getU_id() {
        return u_id;
    }

    public void setU_id(long u_id) {
        this.u_id = u_id;
    }

    public String getU_full_name() {
        return u_full_name;
    }

    public void setU_full_name(String u_full_name) {
        this.u_full_name = u_full_name;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public int getU_age() {
        return u_age;
    }

    public void setU_age(int u_age) {
        this.u_age = u_age;
    }

    public int getU_gender() {
        return u_gender;
    }

    public void setU_gender(int u_gender) {
        this.u_gender = u_gender;
    }

    public String getU_phone_number() {
        return u_phone_number;
    }

    public void setU_phone_number(String u_phone_number) {
        this.u_phone_number = u_phone_number;
    }

    public String getU_address() {
        return u_address;
    }

    public void setU_address(String u_address) {
        this.u_address = u_address;
    }

    public boolean isU_status() {
        return u_status;
    }

    public void setU_status(boolean u_status) {
        this.u_status = u_status;
    }

    public String getU_img() {
        return u_img;
    }

    public void setU_img(String u_img) {
        this.u_img = u_img;
    }

    public String getU_identity_card() {
        return u_identity_card;
    }

    public void setU_identity_card(String u_identity_card) {
        this.u_identity_card = u_identity_card;
    }

    public boolean isU_enable() {
        return u_enable;
    }

    public void setU_enable(boolean u_enable) {
        this.u_enable = u_enable;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }
}
