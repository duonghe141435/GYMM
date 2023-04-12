package swp12.gym.model.entity;

public class Time {

    private int id_time;
    private String start_time;
    private String end_time;

    public Time() {
    }

    public Time(int id_time, String start_time, String end_time) {
        this.id_time = id_time;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public int getId_time() {
        return id_time;
    }

    public void setId_time(int id_time) {
        this.id_time = id_time;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    @Override
    public String toString() {
        return "Time{" +
                "id_time=" + id_time +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                '}';
    }


}

