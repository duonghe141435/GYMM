package swp12.gym.model.entity;

public class PersonalTrainerDetail {
    private int personal_trainer_detail_id;
    private String current_date;
    private int status;
    private String note;
    private int personal_trainer_id;
    private int time_id;
    private int user_id;

    public PersonalTrainerDetail() {
    }

    public PersonalTrainerDetail(int personal_trainer_detail_id, String current_date, int status, String note, int personal_trainer_id, int time_id, int user_id) {
        this.personal_trainer_detail_id = personal_trainer_detail_id;
        this.current_date = current_date;
        this.status = status;
        this.note = note;
        this.personal_trainer_id = personal_trainer_id;
        this.time_id = time_id;
        this.user_id = user_id;
    }

    public int getPersonal_trainer_detail_id() {
        return personal_trainer_detail_id;
    }

    public void setPersonal_trainer_detail_id(int personal_trainer_detail_id) {
        this.personal_trainer_detail_id = personal_trainer_detail_id;
    }

    public String getCurrent_date() {
        return current_date;
    }

    public void setCurrent_date(String current_date) {
        this.current_date = current_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getPersonal_trainer_id() {
        return personal_trainer_id;
    }

    public void setPersonal_trainer_id(int personal_trainer_id) {
        this.personal_trainer_id = personal_trainer_id;
    }

    public int getTime_id() {
        return time_id;
    }

    public void setTime_id(int time_id) {
        this.time_id = time_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "PersonalTrainerDetail{" +
                "personal_trainer_detail_id=" + personal_trainer_detail_id +
                ", current_date='" + current_date + '\'' +
                ", status=" + status +
                ", note=" + note +
                ", personal_trainer_id=" + personal_trainer_id +
                ", time_id=" + time_id +
                ", user_id=" + user_id +
                '}';
    }
}
