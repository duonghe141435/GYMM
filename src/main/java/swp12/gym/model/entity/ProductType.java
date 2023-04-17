package swp12.gym.model.entity;

public class ProductType {
    private int kind_id;
    private String name;

    public ProductType() {
    }

    public ProductType(int kind_id, String name) {
        this.kind_id = kind_id;
        this.name = name;
    }

    public int getKind_id() {
        return kind_id;
    }

    public void setKind_id(int kind_id) {
        this.kind_id = kind_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
