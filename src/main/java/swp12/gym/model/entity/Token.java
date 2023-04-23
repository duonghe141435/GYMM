package swp12.gym.model.entity;

public class Token {
    private int id;
    private String token;
    private int create_date;
    private int expire_date;
    private int confirm_date;
    private int id_u;

    public Token() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getCreate_date() {
        return create_date;
    }

    public void setCreate_date(int create_date) {
        this.create_date = create_date;
    }

    public int getExpire_date() {
        return expire_date;
    }

    public void setExpire_date(int expire_date) {
        this.expire_date = expire_date;
    }

    public int getConfirm_date() {
        return confirm_date;
    }

    public void setConfirm_date(int confirm_date) {
        this.confirm_date = confirm_date;
    }

    public int getId_u() {
        return id_u;
    }

    public void setId_u(int id_u) {
        this.id_u = id_u;
    }
}
