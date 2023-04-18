package swp12.gym.dto;

public class TrainerDto {

    private int id_trainer;
    private String name_trainer;
    private int status_trainer;

    public TrainerDto() {
    }

    public TrainerDto(int id_trainer, String name_trainer, int status_trainer) {
        this.id_trainer = id_trainer;
        this.name_trainer = name_trainer;
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
                ", status_trainer=" + status_trainer +
                '}';
    }
}