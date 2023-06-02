package swp12.gym.dto;

public class TrainerDto {

    private int id_trainer;
    private String name_trainer;
    private String email_trainer;
    private String phone;
    private int price;
    private int status_trainer;

    public TrainerDto() {
    }

    public TrainerDto(int id_trainer, String name_trainer, String email_trainer, String phone, int price, int status_trainer) {
        this.id_trainer = id_trainer;
        this.name_trainer = name_trainer;
        this.email_trainer = email_trainer;
        this.phone = phone;
        this.price = price;
        this.status_trainer = status_trainer;
    }

    public int getId_trainer() {
        return id_trainer;
    }

    public void setId_trainer(int id_trainer) {
        this.id_trainer = id_trainer;
    }

    public String getName_trainer() {
        return name_trainer;
    }

    public void setName_trainer(String name_trainer) {
        this.name_trainer = name_trainer;
    }

    public String getEmail_trainer() {
        return email_trainer;
    }

    public void setEmail_trainer(String email_trainer) {
        this.email_trainer = email_trainer;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStatus_trainer() {
        return status_trainer;
    }

    public void setStatus_trainer(int status_trainer) {
        this.status_trainer = status_trainer;
    }

    @Override
    public String toString() {
        return "TrainerDto{" +
                "id_trainer=" + id_trainer +
                ", name_trainer='" + name_trainer + '\'' +
                ", email_trainer='" + email_trainer + '\'' +
                ", phone='" + phone + '\'' +
                ", price=" + price +
                ", status_trainer=" + status_trainer +
                '}';
    }
}
