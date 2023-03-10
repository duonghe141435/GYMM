package swp12.gym.model.entity;

public class Role {
    private long r_id;
    private String r_code;
    private String r_name;

    public Role() {
    }

    public Role(long r_id, String r_code, String r_name) {
        this.r_id = r_id;
        this.r_code = r_code;
        this.r_name = r_name;
    }

    public long getR_id() {
        return r_id;
    }

    public void setR_id(long r_id) {
        this.r_id = r_id;
    }

    public String getR_code() {
        return r_code;
    }

    public void setR_code(String r_code) {
        this.r_code = r_code;
    }

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }
}