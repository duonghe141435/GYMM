package swp12.gym.model.entity;

public class Role {
    private int r_id;
    private String r_code;
    private String r_description;

    public Role() {
    }

    public Role(int r_id, String r_code, String r_description) {
        this.r_id = r_id;
        this.r_code = r_code;
        this.r_description = r_description;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public String getR_code() {
        return r_code;
    }

    public void setR_code(String r_code) {
        this.r_code = r_code;
    }

    public String getR_description() {
        return r_description;
    }

    public void setR_description(String r_name) {
        this.r_description = r_name;
    }
}
