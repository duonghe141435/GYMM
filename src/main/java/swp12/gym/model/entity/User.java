package swp12.gym.model.entity;

public class User {
    private long u_id;
    private String u_full_name;
    private String u_email;
    private String u_password;
    private String u_dob;
    private int u_gender;
    private String u_phone_number;
    private String u_address;
    private String u_img;
    private String u_identity_card;
    private int u_enable;
    private String u_create_date;
    public User() {
    }

    public User(long u_id, String u_full_name, String u_email, String u_password, String u_dob, int u_gender,
                String u_phone_number, String u_address, String u_img, String u_identity_card,
                int u_enable, String u_create_date) {
        this.u_id = u_id;
        this.u_full_name = u_full_name;
        this.u_email = u_email;
        this.u_password = u_password;
        this.u_dob = u_dob;
        this.u_gender = u_gender;
        this.u_phone_number = u_phone_number;
        this.u_address = u_address;
        this.u_img = u_img;
        this.u_identity_card = u_identity_card;
        this.u_enable = u_enable;
        this.u_create_date = u_create_date;
    }

    public String getU_dob() {
        return u_dob;
    }

    public void setU_dob(String u_dob) {
        this.u_dob = u_dob;
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

    public int getU_enable() { return u_enable; }

    public void setU_enable(int u_enable) { this.u_enable = u_enable; }

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

    public String getU_create_date() {
        return u_create_date;
    }

    public void setU_create_date(String u_create_date) {
        this.u_create_date = u_create_date;
    }

    @Override
    public String toString() {
        return "User{" +
                "u_id=" + u_id +
                ", u_full_name='" + u_full_name + '\'' +
                ", u_email='" + u_email + '\'' +
                ", u_password='" + u_password + '\'' +
                ", u_dob='" + u_dob + '\'' +
                ", u_gender=" + u_gender +
                ", u_phone_number='" + u_phone_number + '\'' +
                ", u_address='" + u_address + '\'' +
                ", u_img='" + u_img + '\'' +
                ", u_identity_card='" + u_identity_card + '\'' +
                ", u_enable=" + u_enable +
                ", u_create_date='" + u_create_date + '\'' +
                '}';
    }
}
